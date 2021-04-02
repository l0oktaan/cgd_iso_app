<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RequestFileResource extends JsonResource
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
            'file_title' => $this->file_title,
            'file_name' => $this->file_name,
            'updated_date' => $this->updated_date
        ];
    }
}
