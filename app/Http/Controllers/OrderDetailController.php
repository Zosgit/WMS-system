<?php

namespace App\Http\Controllers;
use App\Models\Status;
use App\Models\LogicalArea;
use App\Models\Product;
use App\Models\User;
use App\Models\OrderDetail;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderDetailController extends Controller
{
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        //dd($order);
        $status_id = $order->status_id;
        $order_id = $order->id;

        if ($status_id <> 501)
        {
            abort(404);
        }

        $orderdetails = OrderDetail::where('order_id',$order_id)->get();
        return view('orderdetails.show',compact('order','orderdetails'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
