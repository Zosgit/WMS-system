<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Status extends Model
{
    use HasFactory;

    protected $table = 'status';
    protected $fillable = ['code','objectname'];

    public static function getObject($type)
    {
        return static::where('objectname', $type)->get();
    }

}
