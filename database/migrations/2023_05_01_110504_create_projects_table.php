<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->string('project_name',500);
            $table->foreignId('system_id')->constrained('systems')->onDelete('cascade');                  
            $table->foreignId('vendor_id')->constrained('groups')->onDelete('cascade');    
            $table->string('contract_no',250)->nullable();
            $table->date('contract_date')->nullable();
            $table->date('start_date')->nullable(); 
            $table->date('end_date')->nullable(); 
            $table->string('description',500)->nullable();
            $table->tinyInteger('status')->nullable();
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
        Schema::dropIfExists('projects');
    }
}
