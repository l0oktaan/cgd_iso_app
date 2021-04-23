<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestPolicyDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'request_detail_id',
        'source',
        'destination',
        'service_port',
        'tags'

    ];


    public function request_detail(){
        return $this->belongsTo(RequesDetail::class);
    }
}
