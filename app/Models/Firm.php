<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Firm extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['code', 'longdesc', 'tax', 'street',
                         'postcode', 'city', 'notes', 'shipment',
                         'holder', 'delivery', 'created_by'];

    public static function getObject1($holder_id)
    {
        return static::where('holder', $holder_id)->get();
    }
    public static function getObject2($supplier_id)
    {
        return static::where('delivery', $supplier_id)->get();
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
