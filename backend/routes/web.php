<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CategoryController;
use Illuminate\Support\Facades\Route;

Route::get('/', [AdminController::class,"login"])->name("admin.login");
Route::post('admin/auth', [AdminController::class,"auth"])->name("admin.auth");

Route::prefix("admin")->middleware("admin")->group(function(){
    Route::get('dashboard', [AdminController::class,"index"])->name("admin.index");
    Route::post('logout', [AdminController::class,"logout"])->name("admin.logout");

    // Categories routes is here Categories routes is here Categories routes is here Categories routes is here Categories routes is here 

    Route::resource("categories",CategoryController::class,[
        'names' => [
            'index' => 'admin.categories.index',
            'create' => 'admin.categories.create',
            'store' => 'admin.categories.store',
            'edit' => 'admin.categories.edit',
            'update' => 'admin.categories.update',
            'destroy' => 'admin.categories.destroy'
        ]
    ]);


    // Brands routes is here Brands routes is here Brands routes is here Brands routes is here Brands routes is here Brands routes is here 

    Route::resource("brands",BrandController::class,[
        'names' => [
            'index' => 'admin.brands.index',
            'create' => 'admin.brands.create',
            'store' => 'admin.brands.store',
            'edit' => 'admin.brands.edit',
            'update' => 'admin.brands.update',
            'destroy' => 'admin.brands.destroy'
        ]
    ]);

});
