<?php

namespace App\Http\Controllers\Api;

use App\Models\Size;
use App\Models\Brand;
use App\Models\Color;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    //User get all products User get all products User get all products User get all products User get all products 
    //User get all products User get all products User get all products User get all products User get all products 
    //User get all products User get all products User get all products User get all products User get all products 
    //User get all products User get all products User get all products User get all products User get all products 
    //User get all products User get all products User get all products User get all products User get all products 

    public function index(){
        return ProductResource::collection(
            Product::with(['colors','sizes','category','brand'])->latest()->get()
        )->additional([
            'colors' =>Color::has('products')->get(),
            'sizes' =>Size::has('products')->get(),
            'brands' =>Brand::has('products')->get(),
            'categories' =>Category::has('products')->get(),
        ]);
    }

    // Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug 
    // Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug 
    // Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug 
    // Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug 
    // Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug  Get product by slug 

    public function show(Product $product){

        if(!$product){
            abort(404);
        };

        return ProductResource::collection(
            $product->load(['colors','sizes','reviews','category','brand'])
        );
    }

    // Filter product by category Filter product by category Filter product by category Filter product by category 
    // Filter product by category Filter product by category Filter product by category Filter product by category 
    // Filter product by category Filter product by category Filter product by category Filter product by category 
    // Filter product by category Filter product by category Filter product by category Filter product by category 
    // Filter product by category Filter product by category Filter product by category Filter product by category 


    public function filterProductByCategory(Category $category){

        return ProductResource::collection(
            $category->prodcuts()->with(['colors','sizes','category','brand'])->latest()->get()
        )->additional([
            'colors' =>Color::has('products')->get(),
            'sizes' =>Size::has('products')->get(),
            'brands' =>Brand::has('products')->get(),
            'categories' =>Category::has('products')->get(),
            'filter' => $category->name,
        ]);
    }


    // Filter product by brands  Filter product by brands  Filter product by brands  Filter product by brands 
    // Filter product by brands  Filter product by brands  Filter product by brands  Filter product by brands 
    // Filter product by brands  Filter product by brands  Filter product by brands  Filter product by brands 
    // Filter product by brands  Filter product by brands  Filter product by brands  Filter product by brands 
    // Filter product by brands  Filter product by brands  Filter product by brands  Filter product by brands 

    public function filterProductByBrand(Brand $brand){

        return ProductResource::collection(
            $brand->prodcuts()->with(['colors','sizes','category','brand'])->latest()->get()
        )->additional([
            'colors' =>Color::has('products')->get(),
            'sizes' =>Size::has('products')->get(),
            'brands' =>Brand::has('products')->get(),
            'categories' =>Category::has('products')->get(),
            'filter' => $brand->name,
        ]);
    }


    // Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color 
    // Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color 
    // Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color 
    // Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color 
    // Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color Filter Product By Color 

    public function filterProductByColor(Color $color){

        return ProductResource::collection(
            $color->prodcuts()->with(['colors','sizes','category','brand'])->latest()->get()
        )->additional([
            'colors' =>Color::has('products')->get(),
            'sizes' =>Size::has('products')->get(),
            'brands' =>Brand::has('products')->get(),
            'categories' =>Category::has('products')->get(),
            'filter' => $color->name,
        ]);
    }

    // Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size 
    // Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size 
    // Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size 
    // Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size 
    // Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size Filter Product By Size 

    public function filterProductBySize(Size $size){

        return ProductResource::collection(
            $size->prodcuts()->with(['colors','sizes','category','brand'])->latest()->get()
        )->additional([
            'colors' =>Color::has('products')->get(),
            'sizes' =>Size::has('products')->get(),
            'brands' =>Brand::has('products')->get(),
            'categories' =>Category::has('products')->get(),
            'filter' => $size->name,
        ]);
    }

    // Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term 
    // Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term 
    // Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term 
    // Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term 
    // Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term Filter Product By Term 

    public function filterProductByTerm($searchTerm){

        return ProductResource::collection(
           Product::where('name','LIKE','%'.$searchTerm.'%')->with(['colors','sizes','category','brand'])->latest()->get()
        )->additional([
            'colors' =>Color::has('products')->get(),
            'sizes' =>Size::has('products')->get(),
            'brands' =>Brand::has('products')->get(),
            'categories' =>Category::has('products')->get(),
            
        ]);
    }
}
