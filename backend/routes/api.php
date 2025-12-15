<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


// product routes product routes product routes product routes 

Route::get('product', [ProductController::class,'index']);
Route::get('product/{category}/category', [ProductController::class,'filterProductByCategory']);
Route::get('product/{brand}/brand', [ProductController::class,'filterProductByBrand']);
Route::get('product/{color}/color', [ProductController::class,'filterProductByColor']);
Route::get('product/{size}/size', [ProductController::class,'filterProductBySize']);
Route::get('product/{seacrhTerm}/find', [ProductController::class,'filterProductByTerm']);
Route::get('product/{product}/show', [ProductController::class,'show']);

    