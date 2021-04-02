<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AssetEquipmentResource extends JsonResource
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
            'equip_name' => $this->equip_name,
            'service_port' => $this->service_port,
            'equip_tags' => $this->equip_tags,
            'group_id' => $this->group_id,
            'description' => $this->description,

        ];
    }
}
