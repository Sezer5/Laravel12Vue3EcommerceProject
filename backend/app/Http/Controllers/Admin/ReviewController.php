<?php

namespace App\Http\Controllers\Admin;

use App\Models\Review;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ReviewController extends Controller
{
    //
    //Display the list of review

    public function index(){
        $reviews=Review::latest()->get();
        return view('admin.reviews.index')->with([
            'reviews' => $reviews
        ]);
    }

    // Approve or disapprove review

    public function toggleApproveStatus(Review $review,$status){
        $review->update([
            'approved' => $status
        ]);

        return redirect()->route('admin.reviews.index')->with([
            'success' => 'Review updated successfully'
        ]);
    }

    // Delete reviews

    public function delete(Review $review){
        $review->delete();

        return redirect()->route('admin.reviews.index')->with([
            'success' => 'Review deleted successfully'
        ]);
    }
}
