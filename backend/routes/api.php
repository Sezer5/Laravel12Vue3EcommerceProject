<?php

use App\Http\Controllers\Api\CouponController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ReviewController;
use App\Http\Controllers\Api\UserController;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function(){
    Route::get('user',function (Request $request){
        return [                                                     // We can take current user and access_token
        'user' => UserResource::make($request->user()),             // We can take current user and access_token
        'access_token' => $request->bearerToken()                  // We can take current user and access_token
        ];
    });
    Route::post('user/logout',[UserController::class,'logout']);
    Route::put('user/update/profile',[UserController::class,'UpdateUserProfile']);

    // Coupon Route 

    Route::post('apply/coupon',[CouponController::class,'applyCoupon']);

    // Order routes
    Route::post('store/order',[OrderController::class,'storeUserOrders']);
    Route::post('pay/order',[OrderController::class,'payOrdersByStripe']);

    // Reviews routes
    Route::post('store/review',[ReviewController::class,'store']);
    Route::put('update/review',[ReviewController::class,'update']);
    Route::post('delete/review',[ReviewController::class,'delete']);
});


// product routes product routes product routes product routes product routes product routes product routes product routes product routes product routes 

Route::get('product', [ProductController::class,'index']);
Route::get('product/{category}/category', [ProductController::class,'filterProductByCategory']);
Route::get('product/{brand}/brand', [ProductController::class,'filterProductByBrand']);
Route::get('product/{color}/color', [ProductController::class,'filterProductByColor']);
Route::get('product/{size}/size', [ProductController::class,'filterProductBySize']);
Route::get('product/{seacrhTerm}/find', [ProductController::class,'filterProductByTerm']);
Route::get('product/{product}/show', [ProductController::class,'show']);

// User Routes User Routes User Routes User Routes User Routes User Routes User Routes User Routes User Routes User Routes User Routes User Routes User Routes 

Route::post('user/register',[UserController::class,'store']);
Route::post('user/login',[UserController::class,'auth']);