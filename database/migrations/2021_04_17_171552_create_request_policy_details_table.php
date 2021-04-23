<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequestPolicyDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('request_policy_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedSmallInteger('request_detail_id');
            $table->foreign('request_detail_id')->references('id')->on('request_details')->onDelete('cascade');
            $table->json('source')->nullable();
            $table->json('destination')->nullable();
            $table->json('service_port')->nullable();
            $table->json('tags')->nullable();
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
        Schema::dropIfExists('request_policy_details');
    }
}
