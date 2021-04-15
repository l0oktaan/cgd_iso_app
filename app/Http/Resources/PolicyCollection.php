<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PolicyCollection extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $policy_detail = $this->whenLoaded('policy_details');
        return [
            'id' => $this->id,
            'group_id' => $this->group_id,
            'policy_name' => $this->policy_name,
            'policy_detail' => $policy_detail,
            'updated_date' => $this->updated_date,
            'description' => $this->description
        ];
    }
}
