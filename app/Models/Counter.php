<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Counter extends Model
{
    use HasFactory;
    protected $fillable = ['code', 'amount'];

    public static function getCounter($type)
    {
        // pobieram dane...
        $temp = static::findOrFail($type);
        $number =  $temp->amount;
        $number++;
        $temp->amount = $number;
        $temp->update();
        return $number++;
    }
}
