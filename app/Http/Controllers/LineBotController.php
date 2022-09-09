<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserDetail;
class LineBotController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function getUserLineID($group_id){
        $user_details = UserDetail::where('group_id','=',$group_id)->get();
        $arr=array();
        foreach($user_details as $item){
            if ($item->line_id){
                array_push($arr,$item->line_id);
            }
            
        }        
        return $arr;//array('U1e5e8b60c1b4ccb39fd9d1b33859bcc8','U840efe68c8e812c4ff85ebeb3101c600');
    }
    public function lineAlert($arr,$message){
        // $httpClient = new \LINE\LINEBot\HTTPClient\CurlHTTPClient(env('ACCESS_TOKEN'));
        // $bot = new \LINE\LINEBot($httpClient, ['channelSecret' => env('CHANNAL_SECRET')]);
        // $textMessageBuilder = new \LINE\LINEBot\MessageBuilder\TextMessageBuilder('test');
        // $response = $bot->pushMessage('U1e5e8b60c1b4ccb39fd9d1b33859bcc8', $textMessageBuilder);
        
        // $bot->multicast(['U1e5e8b60c1b4ccb39fd9d1b33859bcc8','U840efe68c8e812c4ff85ebeb3101c600'], 'Test Multicast');

        
    }

    public function pushMessage($userId,$message){
        $httpClient = new \LINE\LINEBot\HTTPClient\CurlHTTPClient(env('ACCESS_TOKEN'));
        $bot = new \LINE\LINEBot($httpClient, ['channelSecret' => env('CHANNAL_SECRET')]);
        $textMessageBuilder = new \LINE\LINEBot\MessageBuilder\TextMessageBuilder($message);
        $response = $bot->pushMessage($userId, $textMessageBuilder);
    }
    public function multiCast($group_id,$message){
        try {
            $httpClient = new \LINE\LINEBot\HTTPClient\CurlHTTPClient(env('ACCESS_TOKEN'));
            $bot = new \LINE\LINEBot($httpClient, ['channelSecret' => env('CHANNAL_SECRET')]);
            $userIds = $this->getUserLineID($group_id);//array('U1e5e8b60c1b4ccb39fd9d1b33859bcc8','U840efe68c8e812c4ff85ebeb3101c600');
            $textMessageBuilder = new \LINE\LINEBot\MessageBuilder\TextMessageBuilder($message);
            $bot->multicast($userIds, $textMessageBuilder);
            return "Success";
        } catch (\Throwable $th) {
            return $th;
        }
    }
    public function index()
    {
        

    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return $this->multiCast($request->group_id,$request->message);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    public function edit()
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    
    
    public function update(Request $request,RequestForm $request_form, RequestStatus $requestStatus)
    {
        

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        //
    }
}
