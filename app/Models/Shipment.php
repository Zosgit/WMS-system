<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Status;
use App\Models\Firm;
use App\Models\Control;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Shipment extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['name_doc', 'nr_doc', 'remarks','holder_id',
                            'supplier_id', 'status_id','created_by' ];


    // public function firm(): BelongsTo
    // {
    //     return $this->belongsTo(Firm::class, 'supplier_id', 'id')->belongsTo(Firm::class, 'holder_id', 'id');
    // }
    public function supplier(): BelongsTo
    {
        return $this->belongsTo(Firm::class, 'supplier_id', 'id');
    }

    public function holder(): BelongsTo
    {
        return $this->belongsTo(Firm::class, 'holder_id', 'id');
    }

    public function shipcontrol(): HasMany
    {
        return $this->belongsTo(Control::class, 'ship_id', 'id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }
    public function status(): BelongsTo
    {
        return $this->belongsTo(Status::class, 'status_id', 'id');
    }

    public static function booted(){

    static::creating(function($model)
        {
        $model->created_by = auth()->id();
        $model->status_id = 401;
        });
    }
}
