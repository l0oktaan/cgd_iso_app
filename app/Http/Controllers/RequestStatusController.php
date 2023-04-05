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
        $line_bot = new LineBotController;
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
                        // $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> ผ่านการรับรองแล้ว");
                        // $line_bot->multiCast(7,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> รอการพิจารณา");
                    }else if ($request->ensure_status == "0"){
                        $request_form->update([
                            'status' => 1
                        ]);
			            $request_form->save();
                        // $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> ถูกส่งคืนเพื่อแก้ไขแล้ว");
                    }

                }else if ($request->has('consider_status')){
                    $consider = "";
                    if ($request->consider_status == 1){
                        $request_form->update([
                            'status' => 5
                        ]);
                        $consider = ">> ผ่านการพิจารณา และส่งต่อเพื่อดำเนินการแล้ว";


                    }else if ($request->consider_status == 2){
                        $request_form->update([
                            'status' => 4
                        ]);
                        $consider = ">> ผ่านการพิจารณา และส่งต่อเพื่อขออนุมัติแล้ว";

                    }else if ($request->consider_status == 0){
                        $request_form->update([
                            'status' => 1
                        ]);
                        // $consider = ">> ถูกส่งคืนเพื่อแก้ไขแล้ว";
                        $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n" . ">> ถูกส่งคืนเพื่อแก้ไขแล้ว");
                    }
                    // $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n" . $consider);
                    if (!empty($requestStatus->forward_to)){
                        $arr = json_decode($requestStatus->forward_to);
                        foreach ($arr as $forward_to) {
                            // $line_bot->forOperator($forward_to,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> กำลังรอดำเนินการ");
                        }
                    }
                    if ($request_form->status == 4){
                        // $line_bot->forApprove("เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> กำลังรอการอนุมัติ");
                    }
                }else if ($request->has('approve_status')){
                    if ($request->approve_status == 1){
                        $request_form->update([
                            'status' => 5
                        ]);
                        $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> ผ่านการอนุมัติแล้ว");
                        if (!empty($requestStatus->forward_to)){
                            $arr = json_decode($requestStatus->forward_to);
                            foreach ($arr as $forward_to) {
                                $line_bot->forOperator($forward_to,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> กำลังรอดำเนินการ");
                            }
                        }
                    }
                }else if ($request->has('operate_status')){
                    // if ($request->operate_status == 1){
                        $request_form->update([
                            'status' => 6
                        ]);
                        // $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> ดำเนินการเสร็จแล้ว\r\n>> โปรดบันทึกการติดตามผล");

                    // }
                }else if ($request->has('follow_status')){
                    // if ($request->follow_status == 1){
                        $request_form->update([
                            'status' => 7
                        ]);

                        $line_bot = new LineBotController();
                        // $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> ผ่านการติดตามผลแล้ว");
                        // $line_bot->multiCast(7,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> รอการตรวจสอบผล");
                        // $line_bot->pushMessage('U1e5e8b60c1b4ccb39fd9d1b33859bcc8','เอกสารหมายเลข : ' . $request_form->request_no . '\\nเรื่อง : '  .  $request_form->request_title . '\\n ผ่านการติดตามผลแล้ว');


                    // }
                }else if ($request->has('check_status')){
                    // if ($request->check_status == 1){
                        $request_form->update([
                            'status' => 8
                        ]);
                        // $line_bot = new LineBotController();
                        // $line_bot->multiCast($request_form->group_id,"เอกสารหมายเลข : " . $request_form->request_no . "\r\nเรื่อง : "  .  $request_form->request_title . "\r\n>> สิ้นสุดกระบวนการแล้ว");

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
