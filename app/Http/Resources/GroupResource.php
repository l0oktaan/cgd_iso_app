<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GroupResource extends JsonResource
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
            'group_name' => $this->group_name,
            'group_name_short' => $this->group_name_short,
            'group_type' => $this->group_type,
            'ip_address' => $this->ip_address,
            'group_tags' => $this->group_tags,
            'description' => $this->description
        ];
    }
}
