<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequestStatusesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('request_statuses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('request_form_id')->constrained('request_forms');
            $table->tinyInteger('ensure_status')->nullable();
            $table->string('ensure_detail',300)->nullable();
            $table->string('ensure_by',100)->nullable();
            $table->date('ensure_date')->nullable();
            $table->tinyInteger('consider_status')->nullable();
            $table->tinyInteger('forward_to')->nullable();
            $table->string('consider_detail',300)->nullable();
            $table->date('consider_date')->nullable();
            $table->string('consider_by',100)->nullable();
            $table->tinyInteger('approve_status')->nullable();
            $table->string('approve_detail',300)->nullable();
            $table->date('approve_date')->nullable();
            $table->string('approve_by',100)->nullable();
            $table->tinyInteger('operate_status')->nullable();
            $table->date('operate_date')->nullable();
            $table->string('operator_name',50)->nullable();
            $table->string('operate_detail',300)->nullable();
            $table->date('operate_save_date')->nullable();
            $table->string('operate_by',100)->nullable();
            $table->tinyInteger('follow_status')->nullable();
            $table->tinyInteger('follow_impact')->nullable();
            $table->string('follow_detail',300)->nullable();
            $table->date('follow_date')->nullable();
            $table->string('follow_by',100)->nullable();
            $table->tinyInteger('check_status')->nullable();
            $table->string('check_detail',300)->nullable();
            $table->date('check_date')->nullable();
            $table->string('check_by',100)->nullable();
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
        Schema::dropIfExists('request_statuses');
    }
}
