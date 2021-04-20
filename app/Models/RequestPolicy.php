<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestPolicy extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'request_detail_id',
        'policy_name',
        'updated_date',
        'description'
    ];
    public function request_policy_details(){
        return $this->hasMany(RequestPolicyDetail::class);
    }

    public function request_detail(){
        return $this->belongsTo(RequestDetail::class);
    }
}
