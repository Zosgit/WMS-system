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
    public static function getNumber($doc)
    {
        $date = date("Ymd");

        switch ($doc) {
           case 'DOSTAWA':
                $type = 'D';
                $counter = 2;
                break;
           case 'WYDANIE':
                $type = 'W';
                $counter = 3;
                break;
           break;
        default: $type = '';
        $counter = 0;
        }
        $number = Counter::getCounter($counter);

        return $type.'_'.$date.'_'.$number;

    }
}
