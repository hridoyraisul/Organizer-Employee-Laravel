<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;
    protected $table = 'employees';
    protected $fillable = [
        'id',
        'name',
        'email',
        'password',
        'dept_id',
        'role'
    ];
    protected $casts = [
        'dept_id'=>'array',
        'role'=>'array'
    ];

}
