<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PolicyDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'policy_id',
        'source',
        'destination',
        'service_port',
        'tags',
        'updated_date'
    ];
    public function policy(){
        return $this->belongsTo(Policy::class);
    }
}
