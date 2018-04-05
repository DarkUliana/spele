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

Route::get('/', function () {

    $reviews = \App\Reviews::all();
    $articles = \App\Articles::where('active', 1)->get();
    $coords = \App\Сoordinates::all();

    return view('index', compact('reviews', 'articles', 'coords'));


});
