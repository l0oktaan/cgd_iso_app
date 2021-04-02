<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    //use HasFactory;
    protected $fillable = [
        'id',
        'request_id',
        'group_code',
        'year',
        'order_no',
        'updated_date'
    ];

    public function request_form(){
        return $this->belongsTo(RequestForm::class);
    }
}
