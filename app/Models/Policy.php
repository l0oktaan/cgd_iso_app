<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Policy extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'group_id',
        'policy_name',
        'updated_date',
        'updated_by',
        'description'
    ];
    public function policy_details(){
        return $this->hasMany(PolicyDetail::class);
    }
}
