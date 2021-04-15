<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PolicyResource extends JsonResource
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
            'group_id' => $this->group_id,
            'policy_name' => $this->policy_name,
            'updated_date' => $this->updated_date,
            'updated_by' => $this->updated_by,
            'description' => $this->description
        ];
    }
}
