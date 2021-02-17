<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('pages.index');
});

Route::get('/sprava', 'ManageController@index');
Route::get('/profil', 'ProfileController@index');
Route::put('/profil/{id}', 'ProfileController@update_profile_image');
Route::delete('/profil/{id}', 'ProfileController@delete_profile_image');
Route::patch('/profil/', 'ProfileController@change_password');
Route::resource('recepty', 'RecipeController');
Route::resource('chladnicka', 'FridgeController');

Auth::routes();

Route::get('/domov', 'HomeController@index')->name('home');

Route::get('admin/', 'AdminController@index')->name('admin');


