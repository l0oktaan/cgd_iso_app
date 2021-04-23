<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestDetail extends Model
{
    // use HasFactory;
    protected $fillable = [
        'id',
        'request_form_id',
        'type',
        'request_detail',
        'description'

    ];

    public function request_form(){
        return $this->belongsTo(RequestForm::class);
    }
    public function request_policy_details(){
        return $this->hasMany(RequestPolicyDetail::class);
    }
}
