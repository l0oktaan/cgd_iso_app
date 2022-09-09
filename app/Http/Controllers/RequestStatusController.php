<?php

namespace App\Http\Controllers;

use LINE\LINEBot;
use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestStatus;
use LINE\LINEBot\HTTPClient\CurlHTTPClient;
use App\Http\Resources\RequestStatusResource;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Controllers\LineBotController;

class RequestStatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(RequestForm $request_form)
    {
        try {
            $requestStatus = $request_form->request_status()->get();
            return RequestStatusResource::collection($requestStatus);
        } catch (\Throwable $th) {
            return $th;
        }

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
    public function store(RequestForm $request_form,Request $request)
    {
        $requestStatus = new RequestStatus($request->all());
        $request_form->request_status()->save($requestStatus);
        return new RequestStatusResource($requestStatus);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    public function show(RequestForm $request_form,RequestStatus $requestStatus)
    {
        if ($request_form->id == $requestStatus->request_form_id){
            return new RequestStatusResource($requestStatus);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestStatus $requestStatus)
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
    private function checkStatus(RequestForm $request_form,$request){
        if ($request->has['ensure_status']){
            if ($request->ensure_status == 1){
                $request_form->update([
                    'status' => 3
                ]);
                // $request_form->save();
            }
        }else if ($request->has['consider_status']){
            if ($request->ensure_status == 1){
                $request_form->update([
                    'status' => 3
                ]);
                // $request_form->save();
            }
        }
    }
    public function getUserLineID($group_id){
        $user_details = App\Models\UserDetail::where('group_id','=',$group_id)->get();
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

        $httpClient = new \LINE\LINEBot\HTTPClient\CurlHTTPClient(env('ACCESS_TOKEN'));
        $bot = new \LINE\LINEBot($httpClient, ['channelSecret' => env('CHANNAL_SECRET')]);
        $userIds = $arr;//array('U1e5e8b60c1b4ccb39fd9d1b33859bcc8','U840efe68c8e812c4ff85ebeb3101c600');
        $textMessageBuilder = new \LINE\LINEBot\MessageBuilder\TextMessageBuilder($message);
        $bot->multicast($userIds, $textMessageBuilder);
    }
    public function update(Request $request,RequestForm $request_form, RequestStatus $requestStatus)
    {
        try {
            if ($request_form->id == $requestStatus->request_form_id){
                $requestStatus->update($request->all());
                // $this->checkStatus($request_form,$request);
                if ($request->has('ensure_status')){
                    if ($request->ensure_status == "1"){
                        $request_form->update([
                            'status' => 3
                        ]);
                        $request_form->save();
                    }else if ($request->ensure_status == "0"){
                        $request_form->update([
                            'status' => 1
                        ]);
			            $request_form->save();
                    }
                }else if ($request->has('consider_status')){
                    if ($request->consider_status == 1){
                        $request_form->update([
                            'status' => 5
                        ]);
                        
                        
                    }else if ($request->consider_status == 2){
                        $request_form->update([
                            'status' => 4
                        ]);
                        
                    }else if ($request->consider_status == 0){
                        $request_form->update([
                            'status' => 1
                        ]);
                        
                    }
                    
                }else if ($request->has('approve_status')){
                    if ($request->approve_status == 1){
                        $request_form->update([
                            'status' => 5
                        ]);
                        
                    }
                }else if ($request->has('operate_status')){
                    // if ($request->operate_status == 1){
                        $request_form->update([
                            'status' => 6
                        ]);
                        
                    // }
                }else if ($request->has('follow_status')){
                    // if ($request->follow_status == 1){
                        $request_form->update([
                            'status' => 7
                        ]);

                        $line_bot = new LineBotController();
                        $line_bot->multiCast(7,'เอกสารหมายเลข : ' . $request_form->request_no . ' ผ่านการติดตามผลแล้ว');
                        
                        
                    // }
                }else if ($request->has('check_status')){
                    // if ($request->check_status == 1){
                        $request_form->update([
                            'status' => 8
                        ]);
                        $line_bot = new LineBotController();
                        $line_bot->multiCast(7,'เอกสารหมายเลข : ' . $request_form->request_no . ' สิ้นสุดแล้ว');
                        
                    // }
                }
                return new RequestStatusResource($requestStatus);
            }else{
                return response(null,Response::HTTP_NOT_FOUND);
            }
        } catch (\Throwable $th) {
            return $th;
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestStatus  $requestStatus
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestStatus $requestStatus)
    {
        //
    }
}
