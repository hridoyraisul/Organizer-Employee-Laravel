<?php

namespace App\Providers;
use Illuminate\Support\Facades\View;
use App\Models\Employee;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('*', function ($view){
        $employeeInfo = Employee::where('id',session('employee_id'))->first();
        $view->with('employeeInfo',$employeeInfo);
//        $view->with('department', $employeeInfo->dept_id);
//        $view->with('role', $employeeInfo->role);
        });
    }
}
