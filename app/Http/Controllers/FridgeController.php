<?php

namespace App\Http\Controllers;

use App\RecipeIngredient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class FridgeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user_id = Auth::id();
        $ingredients = DB::table('ingredients')->select('id', 'ingredient', 'in_fridge')->where('user_id', $user_id)->orderBy('ingredient')->get();

        return view('fridge.index') -> with('ingredients', $ingredients);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $ingredient = RecipeIngredient::find($id);
        if ($ingredient->in_fridge == 0) {
            $status = 1;
            $ingredient->in_fridge = $status;
            $same_ingredients = DB::table('ingredients')->select('*')
                ->where('ingredient', '=', $ingredient->ingredient)
                ->where('in_fridge', '=', 0)->update([
                    'in_fridge' => $status]);
        }
        else {
            $status = 0;
            $ingredient->in_fridge = $status;
            $same_ingredients = DB::table('ingredients')->select('*')
                ->where('ingredient', '=', $ingredient->ingredient)
                ->where('in_fridge', '=', 1)->update([
                    'in_fridge' => $status]);
        }
        $ingredient->save();

        return \response()->json([
            'status' => $status,
            'data' => $same_ingredients
        ]);
    }

}
