<?php

namespace App\Http\Controllers;

use LINE\LINEBot;
use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestStatus;
use LINE\LINEBot\HTTPClient\CurlHTTPClient;
use App\Http\Resources\RequestStatusResource;
use Symfony\Component\HttpFoundation\Response;

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
    public function lineAlert(){
        $httpClient = new \LINE\LINEBot\HTTPClient\CurlHTTPClient('WblupvwwWW5IbQ1KmARod4KCHX5U8K6wCTPSW+GzAUUWRWrlr9Dofu4VKOPXnRGnN+PJ+yAgraZCSLfsKc248nfr4hLqIVtjUUxW/URPRiRPWk5mfKIAojWtjiNoGIFVVV6m9A4aL8ec58KIPvUsgAdB04t89/1O/w1cDnyilFU=');
        $bot = new \LINE\LINEBot($httpClient, ['channelSecret' => '53dbbf75ecca5c5874423d9ff8c7151c']);
        $textMessageBuilder = new \LINE\LINEBot\MessageBuilder\TextMessageBuilder('hello');
        $response = $bot->pushMessage('16746167292294', $textMessageBuilder);
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
                        $this->lineAlert();
                        // $request_form->save();
                    }else if ($request->consider_status == 2){
                        $request_form->update([
                            'status' => 4
                        ]);
                        // $request_form->save();
                    }else if ($request->consider_status == 0){
                        $request_form->update([
                            'status' => 1
                        ]);
                        // $request_form->save();
                    }
                    
                }else if ($request->has('approve_status')){
                    if ($request->approve_status == 1){
                        $request_form->update([
                            'status' => 5
                        ]);
                        // $request_form->save();
                    }
                }else if ($request->has('operate_status')){
                    // if ($request->operate_status == 1){
                        $request_form->update([
                            'status' => 6
                        ]);
                        // $request_form->save();
                    // }
                }else if ($request->has('follow_status')){
                    // if ($request->follow_status == 1){
                        $request_form->update([
                            'status' => 7
                        ]);
                        $this->lineAlert();
                        // $request_form->save();
                    // }
                }else if ($request->has('check_status')){
                    // if ($request->check_status == 1){
                        $request_form->update([
                            'status' => 8
                        ]);
                        $this->lineAlert();
                        // $request_form->save();
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
