<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecipeIngredient extends Model
{
    // table name
    protected $table = 'ingredients';

    // primary key
    public $primaryKey = 'id';

    // timestamp
    public $timestamps = true;

    public function user() {
        return $this->belongsTo('App\User');
    }

    public function recipe() {
        return $this->belongsTo('\App\Recipe', 'recipe_id');
    }

}
