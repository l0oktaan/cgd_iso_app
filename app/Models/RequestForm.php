<?php

namespace App\Models;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestForm extends Model
{
    // use HasFactory;
    // protected $table = "request_forms";
    protected $fillable = [
        'id',
        'user_id',
        'user_name',
        'group_id',
        'group_code',
        'year',
        'order_no',
        'created_date',
        'request_no',
        'change_type',
        'request_title',
        'request_reason',
        'document_relate',
        'person_relate',
        'system_relate',
        'env_impact',
        'system_impact',
        'level_impact',
        'begin_date',
        'end_date',
        'begin_time',
        'end_time',
        'status',
        'description',
        'camunda_id',
        'updated_date',
        'alert_expire'
    ];
    public function request_details(){
        return $this->hasMany(RequestDetail::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function document(){
        return $this->hasOne(Document::class);
    }
    public function request_files(){
        return $this->hasMany(RequestFile::class);
    }
    public function request_status(){
        return $this->hasMany(RequestStatus::class);
    }
    public function request_operate_7(){
        return $this->request_status()->where('forward_to','LIKE','%7%');
    }
}
