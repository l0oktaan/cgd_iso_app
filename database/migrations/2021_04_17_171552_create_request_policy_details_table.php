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
            $table->foreignId('request_policy_id')->constrained('request_policies');
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
