<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\Status;
use App\Models\Firm;
use App\Models\User;

class Order extends Model
{
    use HasFactory;
    protected $table = 'orders';
    protected $fillable = ['external_nr', 'order_nr', 'remarks','owner_id',
                        'firm_id', 'realization_at', 'progress', 'status_id','created_by' ];

    public function getCustomer(): BelongsTo
    {
        return $this->belongsTo(Firm::class, 'firm_id', 'id');
    }

    public function getHolder(): BelongsTo
    {
        return $this->belongsTo(Firm::class, 'owner_id', 'id');
    }

    public function status(): BelongsTo
    {
        return $this->belongsTo(Status::class, 'status_id', 'id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }


    public static function booted(){

        static::creating(function($model)
            {
            $model->created_by = auth()->id();
            $model->status_id = 501;
            });
        }
}
