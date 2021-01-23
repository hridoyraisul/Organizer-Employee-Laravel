<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;
    protected $table = 'departments';
    protected $fillable = [
        'id',
        'name',
        'ceo',
        'coo',
        'general_manager',
        'manager',
        'supervisor',
        'staff'
    ];
    protected $casts = [
        'coo'=>'array',
        'general_manager'=>'array',
        'manager'=>'array',
        'supervisor'=>'array',
        'staff'=>'array'
    ];
}
