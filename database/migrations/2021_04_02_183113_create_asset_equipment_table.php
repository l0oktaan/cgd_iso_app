<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssetEquipmentTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asset_equipment', function (Blueprint $table) {
            $table->id();
            $table->json('ip_address');
            $table->string('equip_name',100);
            $table->json('service_port')->nullable();
            $table->json('equip_tags')->nullable();
            $table->foreignId('group_id')->constrained('groups')->onDelete('cascade');
            $table->string('description',250)->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('asset_equipment');
    }
}
