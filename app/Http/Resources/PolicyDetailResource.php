<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PolicyDetailResource extends JsonResource
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
            'policy_id' => $this->policy_id,
            'source' => $this->source,
            'destination' => $this->destination,
            'service_port' => $this->service_port,
            'tags' => $this->tags,
            'updated_date' => $this->updated_date
        ];
    }
}
