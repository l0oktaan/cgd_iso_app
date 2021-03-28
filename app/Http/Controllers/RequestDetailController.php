<?php

namespace App\Http\Controllers;

use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Models\RequestDetail;
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
        $request_detail = new RequestDetail($request->all());
        $request_form->request_details()->save($request_detail);
        return response([
            'data' => new RequestDetailResource($request_detail)
        ],Response::HTTP_CREATED);
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
    public function update(Request $request, RequestDetail $requestDetail)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestDetail  $requestDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestDetail $requestDetail)
    {
        //
    }
}
