<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestStatus extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'request_form_id',
        'ensure_status',
        'ensure_detail',
        'ensure_by',
        'ensure_date',
        'consider_status',
        'forward_to',
        'consider_detail',
        'consider_date',
        'consider_by',
        'approve_status',
        'approve_detail',
        'approve_date',
        'approve_by',
        'operate_status',
        'operate_date',
        'operator_name',
        'operate_detail',
        'operate_save_date',
        'operate_by',
        'follow_status',
        'follow_impact',
        'follow_detail',
        'follow_date',
        'follow_by',
        'check_status',
        'check_detail',
        'check_date',
        'check_by',
    ];
    public function request_form(){
        return $this->belongsTo(RequestForm::class);
    }
}
