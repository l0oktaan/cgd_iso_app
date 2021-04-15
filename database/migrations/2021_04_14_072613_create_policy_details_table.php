<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePolicyDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('policy_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('policy_id')->constrained('policies');
            $table->json('source');
            $table->json('destination');
            $table->json('service_port');
            $table->json('tags');
            $table->date('updated_date');
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
        Schema::dropIfExists('policy_details');
    }
}
