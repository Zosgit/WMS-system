<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ShipmentDetail extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['ship_id', 'product_id', 'prod_code', 'prod_desc',
                            'serial_nr', 'expiration_at', 'logical_area_id',
                            'quantity', 'remarks', 'status_id', 'created_by'];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id', 'id')->belongsTo(Firm::class, 'prod_code', 'id');
    }
    public function status(): BelongsTo
    {
        return $this->belongsTo(Status::class, 'status_id', 'id');
    }
}
