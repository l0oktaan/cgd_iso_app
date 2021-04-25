<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RequestFormResource extends JsonResource
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
            'user_id' => $this->user_id,
            'group_id' => $this->group_id,
            'group_code' => $this->group_code,
            'year' => $this->year,
            'order_no' => $this->order_no,
            'created_date' => $this->created_date,
            'request_no' => $this->request_no,
            'change_type' => $this->change_type,
            'request_title' => $this->request_title,
            'request_reason' => $this->request_reason,
            'document_relate' => $this->document_relate,
            'person_relate' => $this->person_relate,
            'system_relate' => $this->system_relate,
            'env_impact' => $this->env_impact,
            'system_impact' => $this->system_impact,
            'level_impact' => $this->level_impact,
            'begin_date' => $this->begin_date,
            'end_date' => $this->end_date,
            'begin_time' => $this->begin_time,
            'end_time' => $this->end_time,
            'status' => $this->status,
            'description' => $this->description,
            'camunda_id' => $this->camunda_id,
            'updated_date' => $this->updated_date
        ];
    }
}
