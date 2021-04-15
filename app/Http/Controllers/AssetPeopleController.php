<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\AssetPeople;
use Illuminate\Http\Request;
use App\Http\Resources\AssetPeopleResource;
use Symfony\Component\HttpFoundation\Response;

class AssetPeopleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Group $group)
    {

        return AssetPeopleResource::collection($group->asset_peoples()->get());
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
        $people = new AssetPeople(($request->all()));
        $group->asset_peoples()->save($people);
        return response([
            'data' => new AssetPeopleResource($people)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AssetPeople  $assetPeople
     * @return \Illuminate\Http\Response
     */
    public function show(AssetPeople $assetPeople)
    {
        return AssetPeopleResource::collection($assetPeople);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssetPeople  $assetPeople
     * @return \Illuminate\Http\Response
     */
    public function edit(AssetPeople $assetPeople)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssetPeople  $assetPeople
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Group $group, AssetPeople $assetPeople)
    {
        if ($group->id == $assetPeople->group_id){
            $assetPeople->update($request->all());
            return new AssetPeopleResource($assetPeople);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssetPeople  $assetPeople
     * @return \Illuminate\Http\Response
     */
    public function destroy(Group $group,AssetPeople $assetPeople)
    {
        if ($group->id == $assetPeople->group_id){
            $assetPeople->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
