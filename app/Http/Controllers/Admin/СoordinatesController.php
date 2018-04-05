<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\Сoordinates;
use App\Http\Requests\CreateСoordinatesRequest;
use App\Http\Requests\UpdateСoordinatesRequest;
use Illuminate\Http\Request;



class СoordinatesController extends Controller {

	/**
	 * Display a listing of Сoordinates
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $Сoordinates = Сoordinates::all();

		return view('admin.Сoordinates.index', compact('Сoordinates'));
	}

	/**
	 * Show the form for creating a new Сoordinates
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    
	    
	    return view('admin.Сoordinates.create');
	}

	/**
	 * Store a newly created Сoordinates in storage.
	 *
     * @param CreateСoordinatesRequest|Request $request
	 */
	public function store(CreateСoordinatesRequest $request)
	{
	    
		Сoordinates::create($request->all());

		return redirect()->route(config('quickadmin.route').'.Сoordinates.index');
	}

	/**
	 * Show the form for editing the specified Сoordinates.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$Сoordinates = Сoordinates::find($id);
	    
	    
		return view('admin.Сoordinates.edit', compact('Сoordinates'));
	}

	/**
	 * Update the specified Сoordinates in storage.
     * @param UpdateСoordinatesRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateСoordinatesRequest $request)
	{
		$Сoordinates = Сoordinates::findOrFail($id);

        

		$Сoordinates->update($request->all());

		return redirect()->route(config('quickadmin.route').'.Сoordinates.index');
	}

	/**
	 * Remove the specified Сoordinates from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		Сoordinates::destroy($id);

		return redirect()->route(config('quickadmin.route').'.Сoordinates.index');
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
            Сoordinates::destroy($toDelete);
        } else {
            Сoordinates::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.Сoordinates.index');
    }

}
