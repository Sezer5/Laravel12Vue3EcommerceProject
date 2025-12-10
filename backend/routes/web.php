<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ColorController;
use App\Http\Controllers\Admin\SizeController;
use App\Models\Size;
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


    //Colors routes is here Colors routes is here Colors routes is here Colors routes is here Colors routes is here Colors routes is here 

    Route::resource("colors",ColorController::class,[
        'names' => [
            'index' => 'admin.colors.index',
            'create' => 'admin.colors.create',
            'store' => 'admin.colors.store',
            'edit' => 'admin.colors.edit',
            'update' => 'admin.colors.update',
            'destroy' => 'admin.colors.destroy'
        ]
    ]);

    //Size routes is here Size routes is here Size routes is here Size routes is here Size routes is here Size routes is here Size routes is here 

    Route::resource("sizes",SizeController::class,[
        'names' => [
            'index' => 'admin.sizes.index',
            'create' => 'admin.sizes.create',
            'store' => 'admin.sizes.store',
            'edit' => 'admin.sizes.edit',
            'update' => 'admin.sizes.update',
            'destroy' => 'admin.sizes.destroy'
        ]
    ]);
});
