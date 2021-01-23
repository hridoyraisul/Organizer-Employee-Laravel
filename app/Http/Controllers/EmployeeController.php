<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class EmployeeController extends Controller
{
    //LOGIN Functionality
    public function loginEmployee(Request $request){
        if ($employee = Employee::where('email',$request->email)->first()) {
            if(Hash::check($request->password, $employee->password)) {
                 session([
                     'employee_id' => $employee->id,
                     'email'=> $employee->email,
                     'emp_dept'=> $employee->dept_id,
                     'emp_role'=> $employee->role
                 ]);
                return view('dept_check');
            }
            else {
                return response()->json([
                    'message','Wrong Password'], 200);
            }
        }
        else {
            return response()->json([
                'message','Please give the valid information'], 200);
        }
    }
    //Selecting department
    public function deptSelect(Request $request){
        $deptInfo = Department::where('id',session('dept'))->first();
        $deptRole = session('role');
        return view('home',compact('deptRole','deptInfo'));
    }
}
