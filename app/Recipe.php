<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    protected $table = 'recipes';
    public $primaryKey = 'id';
    public $timestamps = true;


    public function user() {
        return $this->belongsTo('App\User');
    }

    public function ingredients() {
        return $this->hasMany('App\RecipeIngredient', 'recipe_id');
    }
}
