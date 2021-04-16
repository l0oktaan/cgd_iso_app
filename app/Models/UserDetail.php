<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'ldap',
        'firstname',
        'lastname',
        'group_id',
        'roles',
        'last_logon',
        'status'
    ];
    public function group(){
        return $this->belongsTo(Group::class);
    }
}
