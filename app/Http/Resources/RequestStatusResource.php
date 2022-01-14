<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RequestStatusResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'request_form_id' => $this->request_form_id,
	    'gruop_id' => $this->request_form->group_id,
            'ensure_status' => $this->ensure_status,
            'ensure_detail' => $this->ensure_detail,
            'ensure_by' => $this->ensure_by,
            'ensure_date' => $this->ensure_date,
            'consider_status' => $this->consider_status,
            'forward_to' => $this->forward_to,
            'consider_detail' => $this->consider_detail,
            'consider_date' => $this->consider_date,
            'consider_by' => $this->consider_by,
            'approve_status' => $this->approve_status,
            'approve_detail' => $this->approve_detail,
            'approve_date' => $this->approve_date,
            'approve_by' => $this->approve_by,
            'operate_status' => $this->operate_status,
            'operate_date' => $this->operate_date,
            'operator_name' => $this->operator_name,
            'operate_detail' => $this->operate_detail,
            'operate_save_date' => $this->operate_save_date,
            'operate_by' => $this->operate_by,
            'follow_status' => $this->follow_status,
            'follow_impact' => $this->follow_impact,
            'follow_detail' => $this->follow_detail,
            'follow_date' => $this->follow_date,
            'follow_by' => $this->follow_by,
            'check_status' => $this->check_status,
            'check_detail' => $this->check_detail,
            'check_date' => $this->check_date,
            'check_by' => $this->check_by,
        ];
    }
}
