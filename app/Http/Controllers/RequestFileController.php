<?php

namespace App\Http\Controllers;

use App\Models\RequestFile;
use App\Models\RequestForm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\RequestFileResource;
use Symfony\Component\HttpFoundation\Response;

class RequestFileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(RequestForm $requestForm)
    {
        $file = $requestForm->request_files()->get();
        return RequestFileResource::collection($file);
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
    public function store(RequestForm $requestForm,Request $request)
    {
        $file = $request->file;
        $request->validate([
            'file' => 'required|mimes:jpeg,png,pdf|max:10240'
        ]);

        usleep(10);
        $getTime = time();
        $filename = $getTime . "." . $file->getClientOriginalExtension();;
        $path = hash('sha256',time());
        if(Storage::disk('uploads')->put($filename, File::get($file))) {
            $requestFile = new RequestFile;
            $requestFile->file_title = $request->file_title;
            $requestFile->file_name = $filename;
            $requestFile->updated_date = date('Y-m-d H:i:s');
            $requestForm->request_files()->save($requestFile);
            return response([
                'data' => new RequestFileResource($requestFile)
            ],Response::HTTP_CREATED);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RequestFile  $requestFile
     * @return \Illuminate\Http\Response
     */
    public function show(RequestForm $requestForm,RequestFile $requestFile)
    {
        return response()->download(public_path('uploads\\' . $requestFile->file_name),'Test');
        if (Storage::disk('uploads')->exists($requestFile->file_name)) {
            $headers = array(
                'Content-Type: application/pdf',
            );
            $file =  Storage::disk('uploads')->get($requestFile->file_name);
            return response()->download($file, $requestFile->file_title, $headers);

            $headers = array(
                'Content-Type: application/pdf',
            );
            return response()->download($file, $requestFile->file_title, $headers);

        }else{
            return 'no';
        }

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RequestFile  $requestFile
     * @return \Illuminate\Http\Response
     */
    public function edit(RequestFile $requestFile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RequestFile  $requestFile
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RequestFile $requestFile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RequestFile  $requestFile
     * @return \Illuminate\Http\Response
     */
    public function destroy(RequestForm $requestForm,RequestFile $requestFile)
    {
        if ($requestFile->request_form_id == $requestForm->id){
            if (Storage::disk('uploads')->exists($requestFile->file_name)) {
                Storage::disk('uploads')->delete($requestFile->file_name);

                // File::delete(public_path('uploads/' . $requestFile->file_name));
                $requestFile->delete();
                return response(null,Response::HTTP_CREATED);
            }else{
                return response(null,Response::HTTP_NOT_FOUND);
            }


        }else{
            return response(null,Response::HTTP_NOT_FOUND);
        }
    }
}
