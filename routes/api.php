<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RequestFormController;
use App\Http\Controllers\RequestDetailController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::Resource('/request_forms', RequestFormController::class);
Route::apiResources([
    '/request_forms' => RequestFormController::class,
    '/request_forms/{request_form}/request_details' => RequestDetailController::class
]);
