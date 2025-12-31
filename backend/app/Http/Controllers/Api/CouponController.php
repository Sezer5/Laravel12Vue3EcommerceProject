<?php

namespace App\Http\Controllers\Api;

use App\Models\Coupon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CouponController extends Controller
{
    //Apply Coupon Apply Coupon Apply Coupon Apply Coupon Apply Coupon Apply Coupon Apply Coupon 

    public function applyCoupon(Request $request){
        $coupon = Coupon::whereName($request->name)->first();
        if($coupon && $coupon->checkIfValid()){ // if coupon exist and valid
            return response()->json([
                'message' => 'Coupon applied successfully',
                'coupon' => $coupon
            ]);
        }else{
            return response()->json([
                'message' => 'Invalid or expired coupon',
            ]);
        }
    }
}
