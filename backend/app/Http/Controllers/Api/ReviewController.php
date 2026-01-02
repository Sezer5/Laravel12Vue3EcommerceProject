<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    /**
     * Store new Reviews From Here Store new Reviews From Here Store new Reviews From Here Store new Reviews From Here 
     */

    public function store(Request $request){
        $review = $this->checkIfTheUserAlreadyReviewedProduct($request->product_id,$request->user()->id);

        if($review){
            return response()->json([
                'error' => 'You have already reviewed this product'
            ]);
        }else{
            Review::create([
                'product_id' => $request->product_id,
                'user_id' => $request->user()->id,
                'title' => $request->title,
                'body' => $request->body,
                'rating' => $request->rating,
            ]);
            return response()->json([
                'message' => 'Your review has been added and will be published soon.'
            ]);
        }
    }

    /**
     * Update new Reviews From Here Update new Reviews From Here Update new Reviews From Here Update new Reviews From Here 
     */

    public function update(Request $request){
        $review = $this->checkIfTheUserAlreadyReviewedProduct($request->product_id,$request->user()->id);

        if($review){
           $review->update([
                'product_id' => $request->product_id,
                'user_id' => $request->user()->id,
                'title' => $request->title,
                'body' => $request->body,
                'rating' => $request->rating,
                'approved' => 0
            ]);
            return response()->json([
                'message' => 'Your review has been added and will be published soon.'
            ]);
        }else{
            
            return response()->json([
                'message' => 'Something went wrong try again later.'
            ]);
        }
    }

    /**
     * Delete Review Delete Review Delete Review Delete Review Delete Review Delete Review Delete Review Delete Review Delete Review 
     */

    public function delete(Request $request){
        $review = $this->checkIfTheUserAlreadyReviewedProduct($request->product_id,$request->user()->id);

        if($review){
           $review->delete();
            return response()->json([
                'message' => 'Your review has been deleted.'
            ]);
        }else{
            
            return response()->json([
                'message' => 'Something went wrong try again later.'
            ]);
        }
    }

    /**
     * Check if the user owner of the review
     */

    public function checkIfTheUserAlreadyReviewedProduct($productId,$userId){
        $review = Review::where([
            'product_id' => $productId,
            'user_id' => $userId
        ])->first();

        return $review;
    }
}
