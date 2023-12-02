<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LogicalArea extends Model
{
    use HasFactory;
    protected $table = 'logical_areas';
    protected $fillable = ['code', 'longdesc'];
}
