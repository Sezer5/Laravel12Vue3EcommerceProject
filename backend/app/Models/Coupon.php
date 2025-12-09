<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;

/**
 * This Funtion converts data to the uppercase
 * 
 * 
 */

class Coupon extends Model
{
    //
    protected $fillable = ["name","discount","valid_until"];

    public function setNameAttribute($value){
        $this->attributes['name']= Str::upper($value);
    }

/**
* We will check the coupon date is this valid or not
*/

    public function checkIfValid(){
        if($this->valid_until > Carbon::now()){
            return true;
        }else{
            return false;
        };
    }
    
}
