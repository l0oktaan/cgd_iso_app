<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Policy;
use Illuminate\Http\Request;
use App\Http\Resources\PolicyResource;
use App\Http\Resources\PolicyCollection;
use Symfony\Component\HttpFoundation\Response;

class PolicyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Group $group)
    {

        $policy = new Policy;
        $policy = $group->policies()->with("policy_details")
            ->orderBy('updated_date','desc')
            ->get();


            return PolicyResource::collection($policy);


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
    public function store(Group $group,Request $request)
    {
        $policies = new Policy($request->all());
        $group->policies()->save($policies);
        return new PolicyResource($policies);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Policy  $policy
     * @return \Illuminate\Http\Response
     */
    public function show(Group $group,Policy $policy)
    {

            if ($group->id == $policy->group_id){
                $p = policy::with("policy_details")
                ->where('id',$policy->id)
                ->get();
                return PolicyCollection::collection($p);
            }else{
                return response(null,Response::HTTP_NOT_FOUND);
            }


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Policy  $policy
     * @return \Illuminate\Http\Response
     */
    public function edit(Policy $policy)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Policy  $policy
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Group $group, Policy $policy)
    {
        if ($group->id == $policy->group_id){
            $policy->update($request->all());
            return new PolicyResource($policy);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Policy  $policy
     * @return \Illuminate\Http\Response
     */
    public function destroy(Group $group,Policy $policy)
    {
        if ($group->id == $policy->group_id){
            $policy->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
