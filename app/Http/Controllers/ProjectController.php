<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Group;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\ProjectResource;
use App\Http\Resources\GroupProjectResource;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private function getUser(){
        try {
            if (Auth::check()){
                $tmp = User::with('user_detail')->where('id',Auth::id())->get();
                $auth = $tmp[0];
                return $tmp[0];

                // $user = (object)[
                //     'id' => $auth->id,
                //     'name' => $auth->name,
                //     'group_id' => $auth->user_detail->group_id
                // ];
                // return $user;
            }
        } catch (\Throwable $th) {
            return $th;
        }

    }
    public function index()
    {
        
        try {
            $user = $this->getUser();
            
            if (in_array('admin',json_decode($user->user_detail->roles))){
                    return ProjectResource::collection(Project::orderBy('system_id','asc')->get());
            }else{                    
                $group = Group::where('id',$user->user_detail->group_id)->get();
                return GroupProjectResource::collection($group);              
                
                
                // return ProjectResource::collection($project);
            }
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Project $project)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Project $project)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $project)
    {
        //
    }
}
