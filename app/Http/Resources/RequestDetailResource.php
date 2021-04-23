<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RequestDetailResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $policy_detail = $this->whenLoaded('request_policy_details');
        return [
            'id' => $this->id,
            'request_form_id' => $this->request_form_id,
            'type' => $this->type,
            'request_detail' => $this->request_detail,
            'request_policy_detail' => $this->request_policy_details,
            'description' => $this->description
        ];
    }
}
