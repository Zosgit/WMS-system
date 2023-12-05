<?php

namespace App\Http\Controllers;
use App\Models\OrderDetail;
use App\Models\Order;
use App\Models\Status;
use App\Models\Location;
use App\Models\Picking;
use Illuminate\Http\Request;
use DB;

class PickingController extends Controller
{
    public function index()
    {
        $orders = DB::table('v_list_pickings')->orderby('updated_at','desc')->paginate();
        return view('pickings.index', compact('orders'));
    }

    public function create($id)
    {
        $order = Order::findorfail($id);
        $status_id = $order->status_id;
        $order_id = $order->id;
        $picking = Picking::getPicking($order_id);

        if ($status_id <> 503)
        {
            abort(404);
        }
        $orderdetails = OrderDetail::where('order_id', $order_id)->get();

        return view('pickings.create',compact('order','orderdetails','picking'));
    }

    public function store(Request $request,$id)
    {
        $validatedAttributes = $request->validate ([
            'location_id' => 'required',
            'remarks' => ''
        ]);

        $validatedAttributes['order_id'] = $id;

        Picking::create($validatedAttributes);
        return redirect()->route('pickings.index')->with('success', 'Kontrahent dodany poprawnie!');
    }

    public function show($id)
    {
        $order = Order::findorfail($id);
        $status_id = $order->status_id;
        $order_id = $order->id;
        $locations = Location::getLocationPick();

        if ($status_id <> 503)
        {
            abort(404);
        }
        $orderdetails = OrderDetail::where('order_id',$order_id)->get();
        return view('pickings.show',compact('order','orderdetails', 'locations'));
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
