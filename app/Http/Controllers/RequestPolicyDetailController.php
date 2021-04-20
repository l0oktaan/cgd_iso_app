<?php

namespace App\Http\Controllers;

use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestDetail;
use App\Models\RequestPolicy;
use App\Models\RequestPolicyDetail;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Resources\RequestPolicyDetailResource;

class RequestPolicyDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    public function store(RequestForm $requestForm,RequestDetail $requestDetail,RequestPolicy $requestPolicy,Request $request)
    {
        $policyDetail = new RequestPolicyDetail($request->all());
        $requestPolicy->request_policy_details()->save($policyDetail);
        return new RequestPolicyDetailResource($policyDetail);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestPolicyDetail  $requestPolicyDetail
     * @return \Illuminate\Http\Response
     */
    public function show(RequestPolicyDetail $requestPolicyDetail)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestPolicyDetail  $requestPolicyDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestPolicyDetail $requestPolicyDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestPolicyDetail  $requestPolicyDetail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,RequestForm $requestForm,RequestDetail $requestDetail,RequestPolicy $requestPolicy ,RequestPolicyDetail $requestPolicyDetail)
    {
        $requestPolicyDetail->update($request->all());
        return new RequestPolicyDetailResource($requestPolicyDetail);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestPolicyDetail  $requestPolicyDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $requestForm,RequestDetail $requestDetail,RequestPolicy $requestPolicy,RequestPolicyDetail $requestPolicyDetail)
    {
        if ($requestForm->id == $requestDetail->request_form_id && $requestDetail->id == $requestPolicy->request_detail_id){
            $requestPolicyDetail->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
