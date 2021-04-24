<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\PolicyController;
use App\Http\Controllers\UserDetailController;
use App\Http\Controllers\AssetPeopleController;
use App\Http\Controllers\RequestFileController;
use App\Http\Controllers\RequestFormController;
use App\Http\Controllers\PolicyDetailController;
use App\Http\Controllers\RequestDetailController;
use App\Http\Controllers\RequestStatusController;
use App\Http\Controllers\AssetEquipmentController;
use App\Http\Controllers\RequestPolicyDetailController;

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
    '/user_details' => UserDetailController::class,
    '/request_forms' => RequestFormController::class,
    '/request_forms/{request_form}/request_details' => RequestDetailController::class,
    '/request_forms/{request_form}/request_status' => RequestStatusController::class,
    // '/request_forms/{request_form}/request_details/{request_detail}/request_policies' => RequestPolicyController::class,
    '/request_forms/{request_form}/request_details/{request_detail}/request_policy_details' => RequestPolicyDetailController::class,
    '/request_forms/{request_form}/request_files' => RequestFileController::class,
    '/groups' => GroupController::class,
    '/groups/{group}/asset_equipments' => AssetEquipmentController::class,
    '/groups/{group}/asset_peoples' => AssetPeopleController::class,
    '/groups/{group}/policies' => PolicyController::class,
    '/groups/{group}/policies/{policy}/policy_details' => PolicyDetailController::class,
]);
