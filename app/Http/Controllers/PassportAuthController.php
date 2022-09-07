<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Group;
use App\Models\UserDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use DateTime;
use Carbon\Carbon;


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
            return response()->json(['error' => 'Unauthorised'], 401);
        }

    }

    /**
     * Login
     */
    function getDateDiff($idate){
        try {
            if ($idate == 9223372036854775807){
                return "";
            }
            $winSecs = (int)($idate / 10000000);
            $unixTimestamp = ($winSecs - 11644473600);
            $tmp = date(DateTime::RFC822, $unixTimestamp);
            $dt1 = Carbon::create($tmp);
            $dt = $dt1->addHours(7);   
    
            // return $dt->diffForHumans();
            return now()->diffIndays($dt,false);
        } catch (\Throwable $th) {
            return "";
        }
        
    }
    function changeDate($idate){
        // $dt = Carbon::now();
        // $dt->setTimestamp($idate);
        // $dt->tz = 'Asia/Bangkok';
        // $tmp = Carbon::createFromTimestamp($idate,'Asia/Bangkok')->format('Y-m-d\TH:i:s.uP');
        try {
            if ($idate == 9223372036854775807){
                return "Never Expire";
            }
            $winSecs = (int)($idate / 10000000);
            $unixTimestamp = ($winSecs - 11644473600);
            $tmp = date(DateTime::RFC822, $unixTimestamp);
            $dt1 = Carbon::create($tmp);
            $dt = $dt1->addHours(7);   
            return $dt->toDateTimeString();
        } catch (\Throwable $th) {
            return "error";
        }
        
    }
    function CreateResult($result){
        $arr = [];
        try {
            if ($result["count"] == 0){
                return null;
            }else{
                for ($i=0;$i<$result["count"];$i++){
                    
                    array_push($arr,[
                        'firstname' => $result[$i]["givenname"][0],
                        'surename' => !empty($result[$i]["sn"][0]) ? $result[$i]["sn"][0] : '' ,
                        'SamAccountName' => $result[$i]["samaccountname"][0],
                        'company' => !empty($result[$i]["company"][0]) ? $result[$i]["company"][0] : '',
                        'department' => (!empty($result[$i]["department"][0]) ? $result[$i]["department"][0] : ''),
                        //accountexpires
                        'accountexpires' => $this->changeDate($result[$i]["accountexpires"][0]),                        
                        'remain' => $this->getDateDiff($result[$i]["accountexpires"][0]),
                        'pwdlastset' => $this->changeDate($result[$i]["pwdlastset"][0]),
                        'title' => !empty($result[$i]["title"][0]) ? $result[$i]["title"][0] : '',
                        //badpasswordtime
                        'badpasswordtime' => !empty($result[$i]["badpasswordtime"][0]) ? $this->changeDate($result[$i]["badpasswordtime"][0]) : '',
                        //lastlogoff
                        'lastlogon' => !empty($result[$i]["lastlogon"][0]) ? $this->changeDate($result[$i]["lastlogon"][0]) : '',
                        'lastlogoff' => !empty($result[$i]["lastlogoff"][0]) ? $this->changeDate($result[$i]["lastlogoff"][0]) : '',
                        'lastlogontimestamp' => !empty($result[$i]["lastlogontimestamp"][0]) ? $this->changeDate($result[$i]["lastlogontimestamp"][0]) : '',
                    ]);
                }
                return $arr;
            }
        } catch (\Throwable $th) {
            return $th;
        }
        
        
    }
    function searchAD(Request $request){
        
        // $ldap_password = './Cgd12345';
        // $ldap_username = 'admin_nac@ad.cgd.go.th';

        $ldap_password = $_ENV['LDAP_PASSWORD'];
        $ldap_username = $_ENV['LDAP_USERNAME'];
        $field = $request->field;
        $value = $request->value;
        try {

            $endpoint = $_ENV['LDAP_HOSTS'];
            $dc = $_ENV['LDAP_BASE_DN'];

            $ldap = ldap_connect($endpoint);

            ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
            ldap_set_option($ldap, LDAP_OPT_REFERRALS, 0);

            // $binddn = "uid=$username";

            $bind = ldap_bind($ldap, $ldap_username, $ldap_password);



            


            // $filter="sAMAccountName=".$value . "";
            if ($field == 'quick'){
                $filter="(|(name=*".$value . "*)(sAMAccountName=*" .$value . "*))";
                // $filter="(|(company=*$value*)(name=*$value*))";
            }
            
            // $filter="(&(company=*".$value . "*))";
            $result = ldap_search($ldap,$dc,$filter);
            $info = ldap_get_entries($ldap, $result);
            try {
                // return var_dump($info);
                $data = $this->CreateResult($info);
                // return count($data);
                return response($data);
            } catch (\Throwable $th) {
                return $th;
            }
            
            // return response()->json(['user' => $user], 200);
            if (count($info) == 0){
                return false;
            }else{
                return "1";
            }   






            ldap_close($ldap);







        } catch (\Throwable $e) {
            
            return $e;
        }
        

    }
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
            // echo ($info);
            // var_dump($info);

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

                //echo $group_tmp;
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
                //echo $group_id;

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

            Log::channel('auth')->info('LOGIN ',[
                'username' => $request->username,
                'ip' => $request->header('X-Forwarded-For')
            ]);
            $username = $request->username;
            $password = $request->password;

            $result = $this->checkAD($username,$password);

            if (!$result) {
                //return 'ad error';
                Log::channel('auth')->error('LOGIN FAILED (AD)',[
                    'username' => $request->username,
                    'ip' => $request->header('X-Forwarded-For')
                ]);
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
                    Log::channel('auth')->error('LOGIN FAILED (User Disabled) ',[
                        'username' => $request->username,
                        'ip' => $request->header('X-Forwarded-For')
                    ]);
                    return response()->json(['error' => 'Unauthorised'], 401);
                }
                Log::channel('auth')->info('LOGIN SUCCESS ',[
                    'username' => $request->username,
                    'ip' => $request->header('X-Forwarded-For')
                ]);
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
                Log::channel('auth')->error('LOGIN FAILED (Passport)',[
                    'username' => $request->username,
                    'ip' => $request->header('X-Forwarded-For')
                ]);
                return response()->json(['error' => 'Unauthorised'], 401);
            }
        } catch (\Throwable $th) {
            Log::channel('auth')->error('LOGIN FAILED (Other)',[
                'username' => $request->username,
                'ip' => $request->header('X-Forwarded-For'),
                'error' => $th
            ]);
            return response()->json(['error' => 'Unauthorised'], 401);
        }
    }
    public function logout(Request $request)
    {
        Log::channel('auth')->info('LOGOUT ',[
            'username' => Auth::user()->name,
            'ip' => $request->header('X-Forwarded-For')
        ]);
        if (Auth::check()){            
            $user = Auth::user()->token();
            $user->revoke();
        }
    }
}
