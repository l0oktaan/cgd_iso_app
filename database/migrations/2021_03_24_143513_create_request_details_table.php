<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequestDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('request_details', function (Blueprint $table) {
            $table->smallIncrements('id');
            $table->unsignedSmallInteger('request_form_id')->unsigned()->index();
            $table->foreign('request_form_id')->references('id')->on('request_forms')->onUpdate('cascade')->onDelete('cascade');
            $table->tinyInteger('order');
            $table->tinyInteger('type');
            $table->text('request_detail');
            $table->string('description',300);
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
        Schema::dropIfExists('request_details');
    }
}
