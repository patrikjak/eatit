<?php

namespace App\Http\Controllers;

use App\Recipe;
use App\RecipeIngredient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;
use Intervention\Image\ImageManagerStatic as Image;

class RecipeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $user_id = Auth::id();
        $recipe_info = DB::table('recipes')->where('user_id', '=', $user_id)->orderBy('id', 'desc')->get();
        $recipe_ingredients = DB::table('ingredients')->where('user_id', '=', $user_id)->get();

        return view('recipe.index') -> with(array(
            'recipe_infos' => $recipe_info,
            'recipe_ingredients' => $recipe_ingredients,
        ));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create()
    {
        return view('recipe.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        /*dd($request);*/
        $this->validate($request, [
            'title' => 'required|string|max:191',
            'description' => 'nullable|string|max:200',
            'category' => 'required',
            'difficulty' => 'required',
            'time' => 'numeric|nullable|min:0|max:65535',
            'portions' => 'numeric|nullable|min:0|max:255',
            'ingredient' => 'required',
            'quantity' => 'required',
            'process' => 'required|string|max:65535',
            'photo' => 'file|max:10240',
        ]);


        if (empty($request->input('time'))) {
            $time = 0;
        }
        else {
            $time = $request->input('time');
        }
        if (empty($request->input('portions'))) {
            $portions = 0;
        }
        else {
            $portions = $request->input('portions');
        }

        $title = strtolower(remove_accents(str_replace(' ', '-', $request->input('title'))));

        if ($request->hasFile('photo')) {
            $photo_name = date('YmdHis').'-'.$title;
            $photo_extension = $request->file('photo')->getClientOriginalExtension();
            $photo_name_to_store = $photo_name.'.'.$photo_extension;

            $photo_fitted_name = $photo_name.'-fitted.'.$photo_extension;

            if (!file_exists(storage_path('app/public/'.Auth::id()))) {
                mkdir(storage_path('app/public/'.Auth::id()), 0750, true);
            }

            $photo = Image::make($request->file('photo'));
            $photo->orientate();
            $photo->save(storage_path('app/public/'.Auth::id().'/').$photo_name_to_store, 95);
            $photo->fit(350);
            $photo->save(storage_path('app/public/'.Auth::id().'/').$photo_fitted_name);
        }
        else {
            $photo_name_to_store = 'none';
        }


        $recipe = new Recipe();
        $recipe->title = $request->input('title');
        $recipe->description = $request->input('description');
        $recipe->category = $request->input('category');
        $recipe->difficulty = $request->input('difficulty');
        $recipe->time = $time;
        $recipe->portions = $portions;
        $recipe->process = $request->input('process');
        $recipe->photo = $photo_name_to_store;
        if ($request->hasFile('photo')) {
            $recipe->photo_cropped = $photo_fitted_name;
            $recipe->photo_extension = $photo_extension;
        }
        $recipe->user_id = Auth::id();
        $recipe->save();


        for($i = 0; $i < count($request->input('ingredient')); $i++) {
            $recipe_ingredients = new RecipeIngredient();
            if (strlen($request->input('ingredient')[$i]) > 191) {
                throw ValidationException::withMessages(['ingredient' => 'Ingrediencia môže mať najviac 191 znakov']);
            }
            $recipe_ingredients->ingredient = $request->input('ingredient')[$i];
            if (strlen($request->input('quantity')[$i]) > 191) {
                throw ValidationException::withMessages(['quantity' => 'Množstvo môže mať najviac 191 znakov']);
            }
            $recipe_ingredients->quantity = $request->input('quantity')[$i];
            $recipe_ingredients->recipe_id = Recipe::latest()->first()->id;
            $recipe_ingredients->user_id = Auth::id();
            $recipe_ingredients->save();
        }

        return redirect('/recepty');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */

    public function show($id)
    {
        $user_id = Auth::id();
        $recipe = Recipe::where('user_id', $user_id)->findOrFail($id);
        $recipe_ingredients = DB::table('ingredients')->select('*')->where([['recipe_id', '=', $id], ['user_id', '=', $user_id]])->get();

        if ($recipe->photo != 'none') {
            $photo_data = exif_read_data(asset('storage/'.$user_id.'/'.$recipe->photo));
            $width = $photo_data['COMPUTED']['Width'];
            $height = $photo_data['COMPUTED']['Height'];
        }
        else {
            $width = 'none';
            $height = 'none';
        }

        return view('recipe.show') -> with(array(
            'recipe' => $recipe,
            'ingredients' => $recipe_ingredients,
            'image_width' => $width,
            'image_height' => $height,
        ));

    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit($id)
    {
        $recipe = DB::table('recipes')->find($id);
        $ingredients = DB::table('ingredients')->select('ingredient', 'quantity', 'in_fridge')->where('recipe_id', '=', $id)->get();
        return view('recipe.edit')->with(array(
            'recipe' => $recipe,
            'ingredients' => $ingredients,
        ));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|string|max:191',
            'description' => 'nullable|string|max:200',
            'category' => 'required',
            'difficulty' => 'required',
            'time' => 'numeric|nullable|min:0|max:65535',
            'portions' => 'numeric|nullable|min:0|max:255',
            'ingredient' => 'required',
            'quantity' => 'required',
            'process' => 'required|string|max:65535',
            'photo' => 'file|max:10240',
        ]);

        if (empty($request->input('time'))) {
            $time = 0;
        }
        else {
            $time = $request->input('time');
        }
        if (empty($request->input('portions'))) {
            $portions = 0;
        }
        else {
            $portions = $request->input('portions');
        }

        $title = strtolower(remove_accents(str_replace(' ', '-', $request->input('title'))));

        if ($request->hasFile('photo')) {
            $photo_name = date('YmdHis').'-'.$title;
            $photo_extension = $request->file('photo')->getClientOriginalExtension();
            $photo_name_to_store = date('YmdHis').'-'.$title.'.'.$photo_extension;

            if (!file_exists(storage_path('app/public/'.Auth::id()))) {
                mkdir(storage_path('app/public/'.Auth::id()), 0750, true);
            }

            $photo_fitted_name = $photo_name.'-fitted.'.$photo_extension;

            $img = Image::make($request->file('photo'));
            $img->orientate();
            $img->save(storage_path('app/public/'.Auth::id().'/').$photo_name_to_store, 95);
            $img->fit(350);
            $img->save(storage_path('app/public/'.Auth::id().'/').$photo_fitted_name);

        }

        $recipe = Recipe::find($id);
        $recipe->title = $request->input('title');
        $recipe->description = $request->input('description');
        $recipe->category = $request->input('category');
        $recipe->difficulty = $request->input('difficulty');
        $recipe->time = $time;
        $recipe->portions = $portions;
        $recipe->process = $request->input('process');
        if ($request->hasFile('photo')) {
            Storage::delete('public/'.Auth::id().'/'.$recipe->photo);
            Storage::delete('public/'.Auth::id().'/'.$recipe->photo_cropped);
            $recipe->photo = $photo_name_to_store;
            $recipe->photo_cropped = $photo_fitted_name;
            $recipe->photo_extension = $photo_extension;
        }
        $recipe->user_id = Auth::id();
        $recipe->save();

        $actual_ingredients = RecipeIngredient::where('recipe_id', $id);
        $actual_ingredients->delete();


        for($i = 0; $i < count($request->input('ingredient')); $i++) {
            $recipe_ingredients = new RecipeIngredient();
            if (strlen($request->input('ingredient')[$i]) > 191) {
                throw ValidationException::withMessages(['ingredient' => 'Ingrediencia môže mať najviac 191 znakov']);
            }
            $recipe_ingredients->ingredient = $request->input('ingredient')[$i];
            if (strlen($request->input('quantity')[$i]) > 191) {
                throw ValidationException::withMessages(['quantity' => 'Množstvo môže mať najviac 191 znakov']);
            }
            $recipe_ingredients->quantity = $request->input('quantity')[$i];
            if (!array_key_exists($i, $request->input('availability'))) {
                $recipe_ingredients->in_fridge = 0;
            }
            else {
                $recipe_ingredients->in_fridge = (int)$request->input('availability')[$i];
            }
            $recipe_ingredients->recipe_id = $id;
            $recipe_ingredients->user_id = Auth::id();
            $recipe_ingredients->save();
        }

        return redirect('/recepty');


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param int $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy(Request $request, $id)
    {
        $recipe = Recipe::find($id);
        $ingredients = RecipeIngredient::where('recipe_id', $id);
        if ($recipe->photo != 'none') {
            Storage::delete('public/'.Auth::id().'/'.$recipe->photo);
            Storage::delete('public/'.Auth::id().'/'.$recipe->photo_cropped);
        }
        $ingredients->delete();
        $recipe->delete();

        if ($request->ajax()) {
            return \response()->json([
                'success' => 'Vymazané'
            ]);
        }
        else {
            return redirect('/recepty');
        }
    }
}
