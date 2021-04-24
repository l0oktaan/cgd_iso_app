<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Group as MyGroup;
use App\Http\Resources\GroupResource;
use Symfony\Component\Console\Input\Input;
use Symfony\Component\HttpFoundation\Response;

class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            if ($request->has('type')){
                $type = $request->type;
                $group = MyGroup::where('group_type',$type)
                    ->get();

            }else{
                $group = MyGroup::all();
            }
            return GroupResource::collection($group);
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
        try {
            $group = new MyGroup($request->all());
            $group->save();
            return new GroupResource($group);
        } catch (\Throwable $th) {
            return $th;
        }


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function show(MyGroup $group)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function edit(MyGroup $group)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MyGroup $group)
    {
        $group->update($request->all());
        return new GroupResource($group);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function destroy(MyGroup $group)
    {
        if ($group->asset_equipments()->count() > 0 || $group->asset_peoples()->count() > 0){
            return response(null,Response::HTTP_NOT_FOUND);
        }else{
            $group->delete();
            return response(null,Response::HTTP_CREATED);
        }


    }
}
