<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class System extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'system_name',
        'group_id',
        'description'        
    ];
    public function group(){
        return $this->belongsTo(Group::class);
    }
}
