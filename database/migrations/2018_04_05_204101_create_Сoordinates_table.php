<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Eloquent\Model;

class CreateСoordinatesTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Model::unguard();
        Schema::create('Сoordinates',function(Blueprint $table){
            $table->increments("id");
            $table->string("title");
            $table->string("lat");
            $table->string("lng");
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('Сoordinates');
    }

}