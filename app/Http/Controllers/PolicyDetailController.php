<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Policy;
use App\Models\PolicyDetail;
use Illuminate\Http\Request;
use App\Http\Resources\PolicyDetailResource;
use Symfony\Component\HttpFoundation\Response;

class PolicyDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Group $group,Policy $policy)
    {

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
    public function store(Group $group,Policy $policy,Request $request)
    {

        try {
            $policy_detail = new PolicyDetail($request->all());
            $policy->policy_details()->save($policy_detail);
            return new PolicyDetailResource($policy_detail);
        } catch (\Throwable $th) {
            return $th;
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PolicyDetail  $policyDetail
     * @return \Illuminate\Http\Response
     */
    public function show(Policy $policy,PolicyDetail $policyDetail)
    {
        return new PolicyDetailResource($policyDetail);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PolicyDetail  $policyDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(PolicyDetail $policyDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PolicyDetail  $policyDetail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Group $group,Policy $policy, PolicyDetail $policyDetail)
    {

        try {
            if ($policy->id == $policyDetail->policy_id){
                $policyDetail->update($request->all());
                return new PolicyDetailResource($policyDetail);
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
     * @param  \App\Models\PolicyDetail  $policyDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(Group $group,Policy $policy,PolicyDetail $policyDetail)
    {
        if ($policy->id == $policyDetail->policy_id){
            $policyDetail->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
