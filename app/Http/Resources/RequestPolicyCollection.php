<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RequestPolicyCollection extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'request_detail_id' => $this->request_detail_id,
            'policy_name' => $this->policy_name,
            'updated_date' => $this->updated_date,
            'description' => $this->description,
            'request_policy_detail' => $this->request_policy_details

        ];
    }
}
