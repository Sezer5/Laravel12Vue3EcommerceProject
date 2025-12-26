<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\AuthUserRequest;
use App\Http\Requests\StoreUserRequest;

class UserController extends Controller
{
    //Store new user Store new user Store new user Store new user Store new user Store new user Store new user Store new user Store new user 
    
    public function store(StoreUserRequest $request){

        if($request->validated()){
            User::create($request->validated());
            return response()->json([
                'message' => 'Account created successfully'
            ]);
        }
    }

    // Login user Login user Login user Login user Login user Login user Login user Login user Login user Login user Login user Login user 

    public function auth(AuthUserRequest $request){
        if($request->validated()){
            $user = User::whereEmail($request->email->first());
            if(!$user || !Hash::check($request->password,$user->password)){
                return response()->json([
                    'message' => 'These credentials do not match any of records'
                ]);
            }else{
                return response()->json([
                    'user' => UserResource::make($user),
                    'access_token' => $user->createToken('new_user')->plainTextToken,
                    'message' => 'Logged in succesfully'
                ]);
            }
        }
    }

    // Logout user  Logout user  Logout user  Logout user  Logout user  Logout user  Logout user  Logout user  Logout user  Logout user  Logout user 

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->json([
                'message' => 'Logged out successfully'
        ]);
    }

    // Update user info's Update user info's Update user info's Update user info's Update user info's Update user info's Update user info's Update user info's 

    public function UpdateUserProfile(Request $request){
        $request->validated([
            'profile_image' => 'image|mimes:png,jpg,jpeg,webp|max:2048'
        ]);
        if($request->has('profile_image')){
            // check if old image exists and remove it check if old image exists and remove it check if old image exists and remove it check if old image exists and remove it 
            if(File::exists(asset($request->user()->profile_image))){
                File::delete(asset($request->user()->profile_image));
            };

            // Store the user profile image Store the user profile image Store the user profile image Store the user profile image Store the user profile image
            $file = $request->file('profile_image');
            $profile_image_name = time().'_'.$file->getClientOriginalName();
            $file->storeAs('images/users',$profile_image_name,'public');

            // Update the user profile image Update the user profile image Update the user profile image Update the user profile image Update the user profile image 

            $request->user()->update([
                'profile_image' => 'storage/images/users/'.$profile_image_name
            ]);
            // return the response
            return response()->json([
                'user' => UserResource::make($request->user()),
                'message' => 'Profile image has been updated successfully'
            ]);
        }else{
            $request->user()->update([
                'country' => $request->country,
                'city' => $request->city,
                'address' => $request->address,
                'zip_code' => $request->zip_code,
                'phone_number' => $request->phone_number,
                'profile_completed' => 1,
            ]);
            // return the response
            return response()->json([
                'user' => UserResource::make($request->user()),
                'message' => 'Profile has been updated successfully'
            ]);
        }
    }

}
