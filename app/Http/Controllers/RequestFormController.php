<?php

namespace App\Http\Controllers;

use App\Models\RequestForm;
use Illuminate\Http\Request;
use App\Http\Resources\RequestFormResource;

class RequestFormController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return RequestFormResource::collection(RequestForm::all());
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
        return new RequestFormResource($requestForm);
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
    public function update(Request $request, RequestForm $requestForm)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestForm  $requestForm
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $requestForm)
    {
        //
    }
}
