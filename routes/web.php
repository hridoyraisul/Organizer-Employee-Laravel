<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::post('/login',[\App\Http\Controllers\EmployeeController::class,'loginEmployee']);
Route::post('/dept-check/',[\App\Http\Controllers\EmployeeController::class,'deptSelect']);

//---Logout Functionality-----//
Route::get('/logout',function (){
    session()->forget(['employee_id','email','emp_dept','emp_role','dept','role']);
    return redirect('/');
});

