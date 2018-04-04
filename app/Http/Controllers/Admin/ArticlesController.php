<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\Articles;
use App\Http\Requests\CreateArticlesRequest;
use App\Http\Requests\UpdateArticlesRequest;
use Illuminate\Http\Request;
use App\Http\Controllers\Traits\FileUploadTrait;


class ArticlesController extends Controller {

	/**
	 * Display a listing of articles
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $articles = Articles::all();

		return view('admin.articles.index', compact('articles'));
	}

	/**
	 * Show the form for creating a new articles
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    
	    
	    return view('admin.articles.create');
	}

	/**
	 * Store a newly created articles in storage.
	 *
     * @param CreateArticlesRequest|Request $request
	 */
	public function store(CreateArticlesRequest $request)
	{
	    $request = $this->saveFiles($request);
		Articles::create($request->all());

		return redirect()->route(config('quickadmin.route').'.articles.index');
	}

	/**
	 * Show the form for editing the specified articles.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$articles = Articles::find($id);
	    
	    
		return view('admin.articles.edit', compact('articles'));
	}

	/**
	 * Update the specified articles in storage.
     * @param UpdateArticlesRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateArticlesRequest $request)
	{
		$articles = Articles::findOrFail($id);

        $request = $this->saveFiles($request);

		$articles->update($request->all());

		return redirect()->route(config('quickadmin.route').'.articles.index');
	}

	/**
	 * Remove the specified articles from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		Articles::destroy($id);

		return redirect()->route(config('quickadmin.route').'.articles.index');
	}

    /**
     * Mass delete function from index page
     * @param Request $request
     *
     * @return mixed
     */
    public function massDelete(Request $request)
    {
        if ($request->get('toDelete') != 'mass') {
            $toDelete = json_decode($request->get('toDelete'));
            Articles::destroy($toDelete);
        } else {
            Articles::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.articles.index');
    }

}
