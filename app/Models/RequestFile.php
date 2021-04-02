<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestFile extends Model
{
    // use HasFactory;
    protected $fillable = [
        'id',
        'request_id',
        'file_title',
        'file_name',
        'file_path',
        'updated_date'


    ];

    public function request_form(){
        return $this->belongsTo(RequestForm::class);
    }
}
