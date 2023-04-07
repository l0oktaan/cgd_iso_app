<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Document;
use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestStatus;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Builder;
use App\Http\Controllers\LineBotController;
use App\Http\Resources\RequestFormResource;
use Symfony\Component\HttpFoundation\Response;

class RequestFormController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private function getUser(){
        try {
            if (Auth::check()){
                $tmp = User::with('user_detail')->where('id',Auth::id())->get();
                $auth = $tmp[0];
                return $tmp[0];

                // $user = (object)[
                //     'id' => $auth->id,
                //     'name' => $auth->name,
                //     'group_id' => $auth->user_detail->group_id
                // ];
                // return $user;
            }
        } catch (\Throwable $th) {
            return $th;
        }

    }

    public function getToEnsure(){

        try {
        $user = $this->getUser();

        $requestForm = RequestForm::where('group_id',$user->user_detail->group_id)
                        ->where('status',2)
                        ->get();
        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }

    }
    public function getCloseExpire(){

        try {
        $user = $this->getUser();

        $checkDate = Carbon::today()->addDays(7);
        $requestForm = RequestForm::where('group_id',$user->user_detail->group_id)
                        ->whereBetween('end_date',[Carbon::today(), $checkDate])
                        ->get();
        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }

    }
    public function getToConsider(){

        try {
        $user = $this->getUser();

        $requestForm = RequestForm::where('status',3)
                        ->get();
        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }

    }
    public function getToApprove(){

        try {
        $user = $this->getUser();

        $requestForm = RequestForm::where('status',4)
                        ->get();
        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }
    }
    public function getApproved(){

        try {
        $user = $this->getUser();

        $requestForm = RequestForm::where('status','>',4)
                        ->get();
        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }
    }
    public function getToOperate(){
        // return $this->getUser()->user_detail->group_id;
        try {
        $user = $this->getUser();

        // $requestForm = RequestForm::with(['request_status'=> function ($query){
        //     $query->where('forward_to','LIKE','%'.'1'.'%');
        // }])
        //                 // ->where('status',5)
        //                 ->get();
        // $requestForm = new RequestForm;
        $g_id = (string)$user->user_detail->group_id;
        $requestForm = RequestForm::whereHas('request_status',function(Builder $query)use ($g_id){
            $query->where('forward_to','like',"%".$g_id."%");
        }
        )->where('status',5)->get();

        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }

    }
    public function getOperated(){
        // return $this->getUser()->user_detail->group_id;
        try {
        $user = $this->getUser();

        // $requestForm = RequestForm::with(['request_status'=> function ($query){
        //     $query->where('forward_to','LIKE','%'.'1'.'%');
        // }])
        //                 // ->where('status',5)
        //                 ->get();
        // $requestForm = new RequestForm;
        $g_id = (string)$user->user_detail->group_id;
        $requestForm = RequestForm::whereHas('request_status',function(Builder $query)use ($g_id){
            $query->where('forward_to','like',"%".$g_id."%");
        }
        )->where('status','>',5)->get();

        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }
    }
    public function getToFollow(){

        try {
        $user = $this->getUser();

        $requestForm = RequestForm::where('group_id',$user->user_detail->group_id)
                        ->where('status',6)
                        ->get();
        return RequestFormResource::collection($requestForm);
        } catch (\Throwable $th) {
            return $th;
        }

    }
    public function getToCheck(){

        try {
            $user = $this->getUser();
            if (in_array('check',json_decode($user->user_detail->roles))){
                $requestForm = RequestForm::where('status',7)
                            ->get();
            return RequestFormResource::collection($requestForm);
            }else{
                return response(null,Response::HTTP_NOT_FOUND);
            }

        } catch (\Throwable $th) {
            return response(null,Response::HTTP_NOT_FOUND);
        }

    }
    public function index()
    {
//	return "test";
            try {
            	$user = $this->getUser();
                if (in_array('admin',json_decode($user->user_detail->roles)) || in_array('approve',json_decode($user->user_detail->roles))){
                        return RequestFormResource::collection(RequestForm::where('status','>','0')->SortByDesc('created_date')->get());
            	}else{
                $requestForm = RequestForm::where('group_id',$user->user_detail->group_id)
                    ->where('status','>','0')
                    ->orderBy('created_date','desc')
                        ->get();
                        return RequestFormResource::collection($requestForm);
            	}
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
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request_form = new RequestForm($request->all());
        $request_form->save();
        return new RequestFormResource($request_form);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestForm  $requestForm
     * @return \Illuminate\Http\Response
     */
    public function show(RequestForm $requestForm)
    {
	$user = $this->getUser();
	if ($user->user_detail->group_id == $requestForm->group_id || in_array('consider',json_decode($user->user_detail->roles))||in_array('approve',json_decode($user->user_detail->roles))||in_array('operate',json_decode($user->user_detail->roles))||in_array('check',json_decode($user->user_detail->roles))){
        //if ($user->user_detail->group_id == $requestForm->group_id || in_array('admin',json_decode($user->user_detail->roles))){
            return new RequestFormResource($requestForm);
        }else{
		return response(null,Response::HTTP_NOT_FOUND);
	}

        //return new RequestFormResource($requestForm);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestForm  $requestForm
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestForm $requestForm)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestForm  $requestForm
     * @return \Illuminate\Http\Response
     */
    public function getDocumentOrder(RequestForm $requestForm){
        $last_doc = Document::where('group_code',$requestForm->group_code)
                                    ->where('year',$requestForm->year)
                                    ->orderBy('order_no','desc')
                                    ->first();
        if (!$last_doc){
            $order = 1;
        }else{
            $order = $last_doc->order_no + 1;
        }
        return $order;
    }
    public function update(Request $request, RequestForm $requestForm)
    {
        try {
            if ($request->has('status')){
                $line_bot = new LineBotController();
                if ($request->status == 2 && $requestForm->status == 1){
                    if ($requestForm->order_no == 0){
                        $order = $this->getDocumentOrder($requestForm);
                        $document = new Document;
                        $document->group_code = $requestForm->group_code;
                        $document->year = $requestForm->year;
                        $document->order_no = $order;

                        $document->updated_date = date('Y-m-d H:i:s');
                        $requestForm->document()->save($document);
                        $requestForm->order_no = $order;
                        $requestForm->request_no = $requestForm->group_code . "-" . (string)$requestForm->year . "/" . sprintf('%03d',$order);
                    }
                    $requestForm->status = 2;
                    $requestForm->save();

                    $requestStatus = new RequestStatus;
                    $requestForm->request_status()->save($requestStatus);

                    $message = "เอกสารหมายเลข : " . $requestForm->request_no . "\r\nเรื่อง : "  .  $requestForm->request_title . "\r\n>> กำลังรอการรับรอง";
                    $line_bot->forEnsure($requestForm->group_id, $message);
                    return new RequestFormResource($requestForm);
                }elseif ($request->status == 1 && $requestForm->status == 2){
                    $message = "เอกสารหมายเลข : " . $requestForm->request_no . "\r\nเรื่อง : "  .  $requestForm->request_title . "\r\n>> ยกเลิกการส่งแล้ว";
                    $line_bot->forEnsure($requestForm->group_id, $message);
                }
            }
            $requestForm->update($request->all());

            return new RequestFormResource($requestForm);
            }
            catch (\Throwable $th) {
                return $th;
            }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestForm  $requestForm
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $requestForm)
    {
	// try
    // {
	// 	$requestForm->status = 0;
	// 	$requestForm->save();
	// 	return response(null,Response::HTTP_CREATED);
    // }
	// catch (\\Throwble $th){
	// 	return response(null,Response::HTTP_NOT_FOUND);
	// }
	//	$requestForm->status = 0;
        try {
            $requestForm->status = 0;
            $requestForm->save();
            return response(null,Response::HTTP_CREATED);
        } catch (\Throwable $th) {
            return response(null,Response::HTTP_NOT_FOUND);
        }
        // if ($requestForm->status <= 1){
        //    $requestForm->delete();
        //    return response(null,Response::HTTP_CREATED);
        // }else{
        //    return response(null,Response::HTTP_NOT_FOUND);
        // }
    }
}
