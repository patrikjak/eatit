<?php

namespace App\Http\Controllers;

use App\Recipe;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'admin']);
    }

    /**
     * show homepage for admin
     **/

    public function index()
    {
        $all_users = User::all();
        $users_count = count($all_users);
        $last_users = DB::table('users')->select('*')->latest()->limit(3)->get();
        $all_recipes = Recipe::all();
        $recipes_count = count($all_recipes);

        return view('admin.index')->with(array(
            'users_count' => $users_count,
            'last_users' => $last_users,
            'recipes_count' => $recipes_count,
        ));
    }
}
