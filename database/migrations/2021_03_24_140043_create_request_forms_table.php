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
            $table->smallIncrements('id');
            // $table->smallInteger('user_id')->unsigned()->index();
            $table->foreignId('user_id')->constrained('users')->onUpdate('cascade')->onDelete('cascade');
            $table->string('group_code',5);
            $table->smallInteger('year');
            $table->tinyInteger('order_no');
            $table->date('created_date');
            $table->string('request_no');
            $table->tinyInteger('change_type');
            $table->string('request_title',300);
            $table->string('request_reason',300);
            $table->string('document_relate',250);
            $table->string('person_relate',250);
            $table->string('system_relate',250);
            $table->string('env_impact',250);
            $table->string('system_impact',250);
            $table->string('level_impact',190);
            $table->date('begin_date');
            $table->date('end_date')->nullable();
            $table->time('begin_time')->nullable();
            $table->time('end_time')->nullable();
            $table->tinyInteger('status');
            $table->string('description',1000);
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
        Schema::dropIfExists('request_forms');
    }
}
