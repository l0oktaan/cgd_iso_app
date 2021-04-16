<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserDetailResource extends JsonResource
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
            'ldap' => $this->ldap,
            'firstname' => $this->firstname,
            'lastname' => $this->lastname,
            'group_id' => $this->group_id,
            'group_name' => $this->group->group_name,
            'roles' => $this->roles,
            'last_logon' => $this->last_logon,
            'status' => $this->status
        ];
    }
}
