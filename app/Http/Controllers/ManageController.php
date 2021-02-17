<?php

namespace App\Http\Controllers;

use App\Recipe;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ManageController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show table with recipes to manage
     *
     */

    public function index() {

        $user_id = Auth::id();
        $recipes = DB::table('recipes')->select('id', 'title')->where('user_id', $user_id)->orderBy('id', 'desc')->get();
        return view('pages.manage') -> with('recipes', $recipes);

    }
}
