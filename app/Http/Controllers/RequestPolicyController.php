<?php

namespace App\Http\Controllers;

use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestDetail;
use App\Models\RequestPolicy;
use App\Http\Resources\RequestPolicyResource;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Resources\RequestPolicyCollection;

class RequestPolicyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(RequestForm $requestForm,RequestDetail $requestDetail)
    {
        if ($requestForm->id == $requestDetail->request_form_id){
            $policy = $requestDetail->request_policies()->get();
            return new RequestPolicyResource($policy);
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
    public function store(RequestForm $requestForm,RequestDetail $requestDetail,Request $request)
    {
        if ($requestForm->id == $requestDetail->request_form_id){
            $policy = new RequestPolicy($request->all());
            
            return new RequestPolicyResource($policy);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestPolicy  $requestPolicy
     * @return \Illuminate\Http\Response
     */
    public function show(RequestForm $requestForm,RequestDetail $requestDetail,RequestPolicy $requestPolicy)
    {
        if ($requestForm->id == $requestDetail->request_form_id && $requestDetail->id == $requestPolicy->request_detail_id){

            return new RequestPolicyCollection($requestPolicy);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestPolicy  $requestPolicy
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestPolicy $requestPolicy)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestPolicy  $requestPolicy
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RequestForm $requestForm,RequestDetail $requestDetail,RequestPolicy $requestPolicy)
    {
        if ($requestForm->id == $requestDetail->request_form_id && $requestDetail->id == $requestPolicy->request_detail_id){
            $requestPolicy->update($request->all());
            return new RequestPolicyCollection($requestPolicy);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestPolicy  $requestPolicy
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $requestForm,RequestDetail $requestDetail,RequestPolicy $requestPolicy)
    {
        if ($requestForm->id == $requestDetail->request_form_id && $requestDetail->id == $requestPolicy->request_detail_id){
            $requestPolicy->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
