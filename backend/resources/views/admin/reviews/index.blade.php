@extends('admin.layouts.app')

@section('title')
    Reviews
@endsection

@section('content')
    <div class="row">
        @include('admin.layouts.sidebar')
        <div class="col-md-9">
            <div class="row mt-2">
                <div class="col-md-12">
                    <div class="card-header bg-white">
                        <h3 class="mt-2">
                            Reviews ({{ $reviews->count() }})
                        </h3>
                    </div>
                    <hr>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Title</td>
                                    <td>Body</td>
                                    <td>Rating</td>
                                    <td>Approved</td>
                                    <td>By</td>
                                    <td>Product</td>
                                    <td>Review Date</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($reviews as $key => $review)
                                    <tr>
                                        <td>{{ $key += 1 }}</td>
                                        <td>
                                            {{$review->title}}
                                        </td>
                                        <td>
                                            {{$review->body}}
                                        </td>
                                        <td>{{$review->rating}}</td>
                                        <td>
                                            @if ($review->approved)
                                                <span class="bg-success badge">
                                                    Yes
                                                </span>
                                            @else
                                                <span class="bg-danger badge">
                                                    No
                                                </span>
                                            @endif
                                        </td>
                                        <td>{{$review->user->name}}</td>
                                        <td>
                                            <img src="{{asset($review->product->thumbnail)}}" alt="{{$review->product->name}}" width="60" height="60" class="rounded">
                                        </td>
                                        <td>{{$review->created_at}}</td>
                                        
                                        <td></td>
                                        <td class="d-flex">
                                            @if ($review->approved)
                                                <a href="{{route('admin.reviews.update',['review'=>$review->id,'status'=>0])}}" class="btn btn-sm btn-warning">
                                                    <i class="fas fa-eye-slash"></i>
                                                </a>
                                            @else
                                                <a href="{{route('admin.reviews.update',['review'=>$review->id,'status'=>1])}}" class="btn btn-sm btn-success">
                                                    <i class="fas fa-check-double"></i>
                                                </a>
                                            @endif
                                            <a href="#" onclick="deleteItem({{$review->id}})" class="btn btn-sm btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                            <form id="{{$review->id}}" action="{{route('admin.reviews.delete',$review->id)}}" method="post">
                                                @csrf
                                                @method('DELETE')
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection