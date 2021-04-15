<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssetPeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asset_people', function (Blueprint $table) {
            $table->id();
            $table->json('ip_address');
            $table->string('people_name',100);
            $table->tinyInteger('people_type');
            $table->foreignId('group_id')->constrained('groups')->onDelete('cascade');
            $table->json('people_tags');
            $table->string('description',250);
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
        Schema::dropIfExists('asset_people');
    }
}
