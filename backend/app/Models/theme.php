<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class theme extends Model
{
    use HasFactory;
    protected $table = 'themes';
     protected $fillable = [
         'nom'

     ];

}
