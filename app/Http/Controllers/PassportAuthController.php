<?php

namespace App\Http\Controllers;

use App\Models\User;
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
    public function login(Request $request)
    {


        try {
            $data = [
                'name' => $request->username,
                'password' => $request->password
            ];
            // return $data;
            if (Auth::attempt($data)) {
                $tmp = User::with('user_detail')->where('id',Auth::id())->get();
                $auth = $tmp[0];
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
                return response()->json(['user' => $user], 200);
            } else {
                return response()->json(['error' => 'Unauthorised'], 401);
            }
        } catch (\Throwable $th) {
            return $th;
        }

    }
}
