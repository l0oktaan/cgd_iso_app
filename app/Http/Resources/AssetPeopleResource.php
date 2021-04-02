<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AssetPeopleResource extends JsonResource
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
            'ip_address' => $this->ip_address,
            'people_name' => $this->people_name,
            'people_type' => $this->people_type,
            'group_id' => $this->group_id,
            'people_tags' => $this->people_tags,
            'description' => $this->description

        ];
    }
}
