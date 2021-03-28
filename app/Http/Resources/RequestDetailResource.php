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
        return [
            'id' => $this->id,
            'request_form_id' => $this->request_form_id,
            'order' => $this->order,
            'type' => $this->type,
            'request_detail' => $this->request_detail,
            'description' => $this->description
        ];
    }
}
