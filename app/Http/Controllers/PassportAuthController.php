<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Group;
use App\Models\UserDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PassportAuthController extends Controller
{
    public function register(Request $request)
    {
        try {
            $this->validate($request, [
                'name' => 'required|min:4',
                'email' => 'required|email',
                'password' => 'required',
            ]);

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password)
            ]);

            $group_id = $request->group_id;
            $firstname = $request->firstname;
            $lastname = $request->lastname;
            $roles = $request->roles;
            $status = $request->status;

            $user_detail = new UserDetail;
            $user_detail->ldap = $user->name;
            $user_detail->group_id = $group_id;
            $user_detail->firstname = $firstname;
            $user_detail->lastname = $lastname;
            $user_detail->roles = (string)$roles;
            $user_detail->status = $status;
            $user->user_detail()->save($user_detail);

            $token = $user->createToken('CGD_ISO_APP')->accessToken;

            return response()->json(['token' => $token,'user_detail' => $user_detail], 200);
        } catch (\Throwable $th) {
            return $th;
        }

    }

    /**
     * Login
     */

    function checkAD($username, $password) {
        try {


            $endpoint = $_ENV['LDAP_HOSTS'];
            $dc = $_ENV['LDAP_BASE_DN'];

            $ldap = ldap_connect($endpoint);


            ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
            ldap_set_option($ldap, LDAP_OPT_REFERRALS, 0);

            // $binddn = "uid=$username";

            $bind = ldap_bind($ldap, "ad\\".$username, $password);



            $user = User::where('name',$username)->first();


            $filter="(sAMAccountName=".$username . ")";
            $result = ldap_search($ldap,$dc,$filter);
            $info = ldap_get_entries($ldap, $result);
            var_dump($info);


            if (count($info) == 0){
                return false;
            }

            if (is_null($user)){

                $new_user = User::create([
                    'name' => $username,
                    'email' => $info[0]["mail"][0],
                    'password' => bcrypt($password)
                ]);

                $group_tmp = $info[0]["department"][0];

                echo $group_tmp;
                $group_find = 0;
                switch ($group_tmp) {
                    case strpos($group_tmp,'1') !== false:
                        $group_find = 1;
                        break;
                    case strpos($group_tmp,'2') !== false:
                        $group_find = 2;
                        break;
                    case strpos($group_tmp,'3') !== false:
                        $group_find = 3;
                        break;
                    case strpos($group_tmp,'4') !== false:
                        $group_find = 4;
                        break;
                    case strpos($group_tmp,'เครื่อง') !== false:
                        $group_find = 5;
                        break;
                    case strpos($group_tmp,'ข่าย')  !== false:
                        $group_find = 6;
                        break;
                    case strpos($group_tmp,'ปลอดภัย')  !== false:
                        $group_find = 7;
                        break;
                    default:
                        $group_find = 10;
                        break;
                }

                $group_id = $group_find;
                echo $group_id;

                $group = Group::where('id',$group_id)->first();

                $firstname = $info[0]["givenname"][0];
                $lastname = $info[0]["sn"][0];
                $roles = '["request","follow"]';
                $status = 1;

                $user_detail = new UserDetail;
                $user_detail->ldap = $username;
                $user_detail->group_id = (int)$group_id;
                $user_detail->firstname = $firstname;
                $user_detail->lastname = $lastname;
                $user_detail->roles = $roles;
                $user_detail->status = $status;
                $user_detail->user_id = $new_user->id;
                echo $user_detail;

                $group->user_details()->save($user_detail);

            }else{
                $user->password = bcrypt($password);
                $user->save();
            }
            return true;

            // var_dump($info[0]["department"][0]);

            //Check User Data;


            // $user = User::where('name',$username)->get();
            // if (!$user){
            //     User::create([
            //         'name' => $username,
            //         'email' => $info[0]["mail"][0],
            //         'password' => bcrypt($password)
            //     ]);




            // }






            ldap_close($ldap);



//objectclass "name surname"
//sn "ตำแหน่งระดับ"
//title "MR.name surname"
//physicaldeliveryofficename "ศทส"
//telephonenumber
//initials นาย
//department กลุ่มงาน
//name  ชื่อ สกุล
//mail



        } catch (\Throwable $th) {
            return false;
        }
    }
    public function login(Request $request)
    {


        try {


            $username = $request->username;
            $password = $request->password;

            $result = $this->checkAD($username,$password);

            if (!$result) {
                return response()->json(['error' => 'Unauthorised'], 401);
            }

            $data = [
                'name' => $request->username,
                'password' => $request->password
            ];


            if (Auth::attempt($data)) {
                $tmp = User::with('user_detail')->where('id',Auth::id())->get();
                $auth = $tmp[0];
                if ($auth->user_detail->status == 0){
                    return response()->json(['error' => 'Unauthorised'], 401);
                }
                // $user_detail = $user->user_detail();
                $token = Auth::user()->createToken('CGD_ISO_APP')->accessToken;

                $user = (object)[
                    'id' => $auth->id,
                    'name' => $auth->name,
                    'group_id' => $auth->user_detail->group_id,
                    'firstname' => $auth->user_detail->firstname,
                    'lastname' => $auth->user_detail->lastname,
                    "roles" => $auth->user_detail->roles,
                    'status' => $auth->user_detail->status,
                    'token' => $token
                ];
                // $auth->user_detail->last_logon = date("Y-m-d H:i:s");
                $auth->user_detail()->update(['last_logon'=>date("Y-m-d H:i:s")]);
                return response()->json(['user' => $user], 200);
            } else {
                return response()->json(['error' => 'Unauthorised'], 401);
            }
        } catch (\Throwable $th) {
            return response()->json(['error' => 'Unauthorised'], 401);
        }

    }
    public function logout()
    {
        if (Auth::check()){
            $user = Auth::user()->token();
            $user->revoke();
        }
    }
}
