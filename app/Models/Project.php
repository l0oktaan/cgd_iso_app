<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'project_name',
        'system_id',
        'vendor_id',
        'contract_no',
        'contract_date',
        'start_date',
        'end_date',
        'description',
        'status'
    ];
    public function system(){
        return $this->belongsTo(System::class);
    }
    public function group(){
        return $this->belongsTo(Group::class);
    }
}
