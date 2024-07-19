//
<?php
 
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
 
return new class extends Migration
{
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('nom');
            $table->string('prenom');

            $table->string('email')->unique();;
            $table->string('password');
            $table->string('status');
            $table->string('photo');
            $table->timestamps();
        });
    }
 
    public function down()
    {
        Schema::dropIfExists('users');
    }
};