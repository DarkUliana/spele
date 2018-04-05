<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class Сoordinates extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'Сoordinates';
    
    protected $fillable = [
          'title',
          'lat',
          'lng'
    ];
    

    public static function boot()
    {
        parent::boot();

        Сoordinates::observe(new UserActionsObserver);
    }
    
    
    
    
}