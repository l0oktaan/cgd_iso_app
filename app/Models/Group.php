<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'group_name',
        'group_name_short',
        'group_type',
        'ip_address',
        'group_tags',
        'description'
    ];
    public function asset_peoples(){
        return $this->hasMany(AssetPeople::class);
    }

    public function asset_equipments(){
        return $this->hasMany(AssetEquipment::class);
    }

}
