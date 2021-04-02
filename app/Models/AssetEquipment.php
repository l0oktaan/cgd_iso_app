<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssetEquipment extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'ip_address',
        'equip_name',
        'service_port',
        'equip_tags',
        'group_id',
        'description'
    ];
    public function group(){
        return $this->belongsTo(Group::class);
    }
}
