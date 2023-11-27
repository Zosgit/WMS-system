<?php

namespace App\Http\Controllers;
use App\Models\ShipmentDetail;
use App\Models\Shipment;
use App\Models\Product;
use App\Models\LogicalArea;
use App\Models\Status;
use Illuminate\Http\Request;

class ShipmentDetailController extends Controller
{
    public function index(Shipment $shipment)
    {
        dd($shipment);
        $status_id = $shipment->status_id;
        $ship_id = $shipment->id;

        if ($status_id <> 401)
        {
            abort(404);
        }


        $shipmentdetails = ShipmentDetail::where('ship_id',$ship_id)->get();
       dd($shipmentdetails);

        return view('shipmentdetails.index');
    }

    public function create(Shipment $shipment)
    {
        $products = Product::getShipment();
        $logicalareas = LogicalArea::orderBy('code')->get();

        return view('shipmentdetails.create', ['products' => $products,
                                                'logicalareas'=> $logicalareas,
                                                'shipment' => $shipment]);
    }

    public function store(Request $request,Shipment $shipment)
    {
        $validatedAttributes = $request->validate ([
            'product_id' => 'required',
            'logical_area_id' => 'required',
            'quantity' => 'required',
            'expiration_at' => '',
            'serial_nr' => '',
        ]);

        $validatedAttributes['ship_id'] = $shipment->id;

        dd($validatedAttributes);

        ShipmentDetail::create($validatedAttributes);
        //dd($validatedAttributes);
        //Product::updateOrCreate(['id' => $request->id], $request->except('id'));
        return redirect()->route('shipmentdetails.index');
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
