<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssetPeople extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'ip_address',
        'people_name',
        'people_type',
        'group_id',
        'people_tags',
        'description'
    ];
    public function group(){
        return $this->belongsTo(Group::class);
    }
}
