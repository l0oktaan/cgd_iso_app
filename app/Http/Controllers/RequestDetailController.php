<?php

namespace App\Http\Controllers;

use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestDetail;
use App\Models\RequestPolicyDetail;
use App\Http\Resources\RequestDetailResource;
use Symfony\Component\HttpFoundation\Response;

class RequestDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(RequestForm $request_form)
    {
        $request_detail = $request_form->request_details()->get();
        // return $request_detail;
        return RequestDetailResource::collection($request_detail);
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
    public function store(RequestForm $request_form, Request $request)
    {
        // return $request->policy;
        try {
            $request_detail = new RequestDetail($request->all());
            $request_form->request_details()->save($request_detail);

            if ($request->has(['policy'])){
                $detail = $request->policy;
                for ($i=0;$i<count($detail);$i++){
                    $policy = new RequestPolicyDetail;
                    $policy->source = $detail[$i]["source"];
                    $policy->destination = $detail[$i]["destination"];
                    $policy->service_port = $detail[$i]["service_port"];
                    $policy->tags = $detail[$i]["tags"];
                    $request_detail->request_policy_details()->save($policy);
                }
            }
            return response([
                'data' => new RequestDetailResource($request_detail)
            ],Response::HTTP_CREATED);
        } catch (\Throwable $th) {
            return $th;
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestDetail  $requestDetail
     * @return \Illuminate\Http\Response
     */
    public function show(RequestForm $request_form,RequestDetail $requestDetail)
    {
        $detail = $request_form->request_details()
                    ->where('id',$requestDetail->id)
                    ->get();
        return new RequestDetailResource($requestDetail);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestDetail  $requestDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestDetail $requestDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestDetail  $requestDetail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,RequestForm $requestForm, RequestDetail $requestDetail)
    {
        $requestDetail->update($request->all());
        return new RequestDetailResource($requestDetail);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestDetail  $requestDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $requestForm,RequestDetail $requestDetail)
    {
        if ($requestDetail->request_form_id == $requestForm->id && $requestForm->status <= 1){
            $requestDetail->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
