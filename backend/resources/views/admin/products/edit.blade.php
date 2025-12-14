@extends('admin.layouts.app')

@section('title')
    Edit Product   
@endsection

@section('content')
    <div class="row">
        @include('admin.layouts.sidebar')
        <div class="col-md-9">
            <div class="card-header bg-white">
                        <h3 class="mt-2">Edit Product</h3>
                        
                    </div>
                    <hr>
                    <div class="card-body">
                        <div class="row">
                            <div class="row-md-6 mx-auto">
                                <form action="{{route('admin.products.update',$product->slug)}}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name*</label>
                                        <input
                                            type="text"
                                            class="form-control @error('name') is-invalid @enderror"
                                            name="name"
                                            id="name"
                                            aria-describedby="helpId"
                                            value="{{$product->name,old('name')}}"
                                            placeholder="Name*"
                                        />
                                        @error('name')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>


                                    <div class="mb-3">
                                        <label for="name" class="form-label">Quantity*</label>
                                        <input
                                            type="number"
                                            class="form-control @error('qty') is-invalid @enderror"
                                            name="qty"
                                            id="qty"
                                            aria-describedby="helpId"
                                            value="{{$product->qty,old('qty')}}"
                                            placeholder="Quantity*"
                                        />
                                        @error('qty')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="name" class="form-label">Price*</label>
                                        <input
                                            type="text"
                                            class="form-control @error('price') is-invalid @enderror"
                                            name="price"
                                            id="price"
                                            aria-describedby="helpId"
                                            value="{{$product->price,old('price')}}"
                                            placeholder="Price*"
                                        />
                                        @error('price')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="category_id" class="form-label">Category*</label>
                                        <select
                                            
                                            class="form-control @error('category_id') is-invalid @enderror"
                                            name="category_id"
                                            id="category_id">
                                            <option value="" selected disabled>Choose a category</option>
                                            @foreach ($categories as $category)
                                                
                                                   <option value="{{$category->id}}" @if ($product->category_id==$category->id) selected @endif>{{$category->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('category_id')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>


                                    <div class="mb-3">
                                        <label for="brand_id" class="form-label">Brands*</label>
                                        <select
                                            
                                            class="form-control @error('brand_id') is-invalid @enderror"
                                            name="brand_id"
                                            id="brand_id">
                                            <option value="" selected disabled>Choose a brand</option>
                                            @foreach ($brands as $brand)
                                                
                                                   <option value="{{$brand->id}}" @if  ($product->brand_id==$brand->id) selected @endif>{{$brand->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('brand_id')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="color_id" class="form-label">Colors*</label>
                                        <select
                                            
                                            class="form-control @error('color_id') is-invalid @enderror"
                                            name="color_id[]"
                                            id="color_id"
                                            multiple
                                            >
                                            
                                            @foreach ($colors as $color)
                                                
                                                   <option value="{{$color->id}}" @if ($product->colors->contains($color->id)) selected @endif>{{$color->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('color_id')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>


                                    <div class="mb-3">
                                        <label for="size_id" class="form-label">Sizes*</label>
                                        <select
                                            
                                            class="form-control @error('size_id') is-invalid @enderror"
                                            name="size_id[]"
                                            id="size_id"
                                            multiple
                                            >
                                            
                                            @foreach ($sizes as $size)
                                                
                                                   <option value="{{$size->id}}" @if ($product->sizes->contains($size->id)) selected @endif>{{$size->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('size_id')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="desc" class="form-label ">Description*</label>
                                        <textarea class="form-control @error('desc') is-invalid @enderror summernote" name="desc" id="desc" rows="3">{{$product->desc,old('desc')}}</textarea>
                                        @error('desc')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>



                                    <div class="mb-3">
                                        <label for="thumbnail" class="form-label">Thumbnail*</label>
                                        <input
                                            type="file"
                                            class="form-control @error('thumbnail') is-invalid @enderror"
                                            name="thumbnail"
                                            id="thumbnail"
                                        />
                                        <div class="mt-2">
                                            <img src="{{asset($product->thumbnail)}}" id="thumbnail_preview"
                                            class="img-fluid rounded mb-2"
                                            height="100"
                                            width="100">
                                        </div>
                                        @error('thumbnail')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>


                                    <div class="mb-3">
                                        <label for="first_image" class="form-label">First Image*</label>
                                        <input
                                            type="file"
                                            class="form-control @error('first_image') is-invalid @enderror"
                                            name="first_image"
                                            id="first_image"
                                        />
                                        <div class="mt-2">
                                            <img src="{{asset($product->first_image)}}" id="first_image_preview"
                                            class="@if(!$product->first_image) d-none @endif img-fluid rounded mb-2"
                                            height="100"
                                            width="100">
                                        </div>
                                        @error('first_image')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="second_image" class="form-label">Second Image*</label>
                                        <input
                                            type="file"
                                            class="form-control @error('second_image') is-invalid @enderror"
                                            name="second_image"
                                            id="second_image"
                                        />
                                        <div class="mt-2">
                                            <img src="{{asset($product->second_image)}}" id="second_image_preview"
                                            class="@if(!$product->second_image) d-none @endif img-fluid rounded mb-2"
                                            height="100"
                                            width="100">
                                        </div>
                                        @error('second_image')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        <label for="third_image" class="form-label">Third Image*</label>
                                        <input
                                            type="file"
                                            class="form-control @error('third_image') is-invalid @enderror"
                                            name="third_image"
                                            id="third_image"
                                        />
                                        <div class="mt-2">
                                            <img src="{{asset($product->second_image)}}" id="second_image_preview"
                                            class="@if(!$product->third_image) d-none @endif img-fluid rounded mb-2"
                                            height="100"
                                            width="100">
                                        </div>
                                        @error('third_image')
                                            <span class="invalid-feedback">
                                                <strong>
                                                    {{$message}}
                                                </strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" id="status" value="1" @checked($product->status==TRUE)/>
                                        <label class="form-check-label" for="status"> In Stock </label>
                                    </div>
                                    <div class="form-check">
                                        <input
                                            class="form-check-input"
                                            type="radio"
                                            name="status"
                                            id="status"
                                            value="0" @checked($product->status==FALSE)
                                        
                                        />
                                        <label class="form-check-label" for="">
                                            Out Of Stock
                                        </label>
                                    </div>
                                    





                                    <button
                                        type="submit"
                                        class="btn btn-sm btn-dark mb-5"
                                    >
                                        Submit
                                    </button>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
        </div>
    </div>
@endsection