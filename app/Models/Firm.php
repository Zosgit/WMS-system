<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Firm extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'firms';
    protected $fillable = ['code', 'longdesc', 'tax', 'street',
                         'postcode', 'city', 'notes', 'shipment',
                         'holder', 'customer', 'created_by'];

    public static function getHolder($holders)
    {
        return static::where('holder', $holders)->get();
    }
    public static function getSupplier($suppliers)
    {
        return static::where('shipment', $suppliers)->get();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public static function booted(){

        static::creating(function($model)
        {
            $model->created_by = auth()->id();
        });
    }
}
