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

    public function create(Order $order)
    {
        //dd($order);
        $status_id = $order->status_id;
        $products = Product::getCustomer();
        $logicalareas = LogicalArea::orderBy('code')->get();

        if ($status_id <> 501)
        {
            abort(404);
        }

        return view('orderdetails.create', ['products' => $products,
                                            'logicalareas'=> $logicalareas,
                                            'order' => $order]);
    }

    public function store(Request $request, Order $order)
    {
        //dd($order);
        $validatedAttributes = $request->validate ([
            'product_id' => 'required',
            'logical_area_id' => 'required',
            'quantity' => 'required',
            'expiration_at' => '',
            'serial_nr' => '',
        ]);
        $product = Product::findOrFail($validatedAttributes['product_id']);

        $validatedAttributes['order_id'] = $order->id;
        $validatedAttributes['prod_code'] = $product->code;
        $validatedAttributes['prod_desc'] = $product->longdesc;

        $orderdetails = OrderDetail::create($validatedAttributes);
        //dd($validatedAttributes);
        return redirect()->route('orderdetail.show', ['order' => $order, 'orderdetails' => $orderdetails]);
    }

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

    public function sendPicking($id)
    {
        $order = Order::findorfail($id);
        $data = [
            'status_id' => 503,
        ];
        $order->update($data);
        return redirect()->route('pickings.index')->with('success', 'Dokument przekazany do kompletacji :)');

    }
}
