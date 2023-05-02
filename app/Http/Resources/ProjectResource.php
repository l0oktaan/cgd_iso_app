<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProjectResource extends JsonResource
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
            'project_name' => $this->project_name,
            'system_id' => $this->system_id,
            'system_name' => $this->system->system_name,
            'group_id' => $this->system->group_id,
            'group_name' => $this->system->group->group_name,
            'vendor_id' => $this->vendor_id,
            'contract_no' => $this->contract_no,
            'contract_date' => $this->contract_date,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'description' => $this->description,
            'status' => $this->status
        ];
    }
}
