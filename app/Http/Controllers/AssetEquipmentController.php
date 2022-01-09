<?php

namespace App\Http\Controllers;

use App\Models\Group;
use Illuminate\Http\Request;
use App\Models\AssetEquipment;
use App\Http\Resources\GroupResource;
use App\Http\Resources\AssetEquipmentResource;
use Symfony\Component\HttpFoundation\Response;

class AssetEquipmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Group $group)
    {
        return AssetEquipmentResource::collection($group->asset_equipments()->get());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Group $group)
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Group $group,Request $request)
    {
        $equip = new AssetEquipment(($request->all()));
        $group->asset_equipments()->save($equip);
        return response([
            'data' => new AssetEquipmentResource($equip)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AssetEquipment  $assetEquipment
     * @return \Illuminate\Http\Response
     */
    public function show(Group $group,AssetEquipment $assetEquipment)
    {
        return AssetEquipmentResource::collection($assetEquipment);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssetEquipment  $assetEquipment
     * @return \Illuminate\Http\Response
     */
    public function edit(AssetEquipment $assetEquipment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssetEquipment  $assetEquipment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Group $group, AssetEquipment $assetEquipment)
    {
        if ($group->id == $assetEquipment->group_id){
            $assetEquipment->update($request->all());
            return new AssetEquipmentResource($assetEquipment);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssetEquipment  $assetEquipment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Group $group,AssetEquipment $assetEquipment)
    {
        if ($group->id == $assetEquipment->group_id){
            $assetEquipment->delete();
            return response(null,Response::HTTP_CREATED);
        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
