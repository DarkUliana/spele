<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class Reviews extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'reviews';
    
    protected $fillable = [
          'name',
          'text',
          'photo'
    ];
    

    public static function boot()
    {
        parent::boot();

        Reviews::observe(new UserActionsObserver);
    }
    
    
    
    
}