<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestPolicyDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'request_policy_id',
        'source',
        'destination',
        'service_port',
        'tags'

    ];


    public function request_policy(){
        return $this->belongsTo(RequesPolicy::class);
    }
}
