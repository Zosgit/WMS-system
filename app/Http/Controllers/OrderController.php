<?php

namespace App\Http\Controllers;
use App\Models\Status;
use App\Models\Firm;
use App\Models\User;
use App\Models\Order;
use App\Models\Counter;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::all();
        return view('orders.index', compact('orders'));
    }

    public function create()
    {
        return view('orders.create',[ 'status' => Status::getObject('ORDER'),
                                        'customers' => Firm::getCustomer('1'),
                                        'owners' => Firm::getHolder('1')]);
    }

    public function store(Request $request)
    {
        $validatedAttributes = $request->validate ([
            'owner_id' => 'required',
            'firm_id' => 'required',
            'external_nr' => 'required|max:50',
            'remarks' => ''
        ]);
        $validatedAttributes['order_nr'] = Counter::getNumber('WYDANIE');
        $order = Order::create($validatedAttributes);
        //dd($order);
        return redirect()->route('orderdetails.create',['order'=>$order]);
    }

    public function show(string $id)
    {
        //
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
