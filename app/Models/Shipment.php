<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Status;
use App\Models\Firm;
use App\Models\ShipmentDetail;
use App\Models\ProductMetric;
use Illuminate\Database\Eloquent\SoftDeletes;

class Shipment extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['name_doc', 'nr_doc', 'remarks','holder_id',
                            'supplier_id', 'status_id', 'created_by' ];


    public function firm(): BelongsTo
    {
        return $this->belongsTo(Firm::class, 'supplier_id', 'id')->belongsTo(Firm::class, 'holder_id', 'id');
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
