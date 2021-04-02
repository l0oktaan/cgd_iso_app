<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequestFormsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('request_forms', function (Blueprint $table) {
            $table->id();
            $table->string('group_code',5);
            $table->smallInteger('year');
            $table->tinyInteger('order_no')->nullable();
            $table->date('created_date');
            $table->string('request_no')->nullable();
            $table->tinyInteger('change_type')->nullable();
            $table->string('request_title',300)->nullable();
            $table->string('request_reason',300)->nullable();
            $table->json('document_relate')->nullable();
            $table->json('person_relate')->nullable();
            $table->json('system_relate')->nullable();
            $table->json('env_impact')->nullable();
            $table->json('system_impact')->nullable();
            $table->tinyInteger('level_impact')->nullable();
            $table->date('begin_date')->nullable();
            $table->date('end_date')->nullable();
            $table->time('begin_time')->nullable();
            $table->time('end_time')->nullable();
            $table->tinyInteger('status');
            $table->text('description')->nullable();
            $table->date('updated_date')->nullable();
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
        Schema::dropIfExists('request_forms');
    }
}
