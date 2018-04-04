<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\Reviews;
use App\Http\Requests\CreateReviewsRequest;
use App\Http\Requests\UpdateReviewsRequest;
use Illuminate\Http\Request;
use App\Http\Controllers\Traits\FileUploadTrait;


class ReviewsController extends Controller {

	/**
	 * Display a listing of reviews
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $reviews = Reviews::all();

		return view('admin.reviews.index', compact('reviews'));
	}

	/**
	 * Show the form for creating a new reviews
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    
	    
	    return view('admin.reviews.create');
	}

	/**
	 * Store a newly created reviews in storage.
	 *
     * @param CreateReviewsRequest|Request $request
	 */
	public function store(CreateReviewsRequest $request)
	{
	    $request = $this->saveFiles($request);
		Reviews::create($request->all());

		return redirect()->route(config('quickadmin.route').'.reviews.index');
	}

	/**
	 * Show the form for editing the specified reviews.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$reviews = Reviews::find($id);
	    
	    
		return view('admin.reviews.edit', compact('reviews'));
	}

	/**
	 * Update the specified reviews in storage.
     * @param UpdateReviewsRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateReviewsRequest $request)
	{
		$reviews = Reviews::findOrFail($id);

        $request = $this->saveFiles($request);

		$reviews->update($request->all());

		return redirect()->route(config('quickadmin.route').'.reviews.index');
	}

	/**
	 * Remove the specified reviews from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		Reviews::destroy($id);

		return redirect()->route(config('quickadmin.route').'.reviews.index');
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
            Reviews::destroy($toDelete);
        } else {
            Reviews::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.reviews.index');
    }

}
