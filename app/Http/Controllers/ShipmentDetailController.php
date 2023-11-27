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
        //dd($shipment);
        $status_id = $shipment->status_id;
        $ship_id = $shipment->id;

        if ($status_id <> 401)
        {
            abort(404);
        }
        $products = Product::getShipment();
        $logicalareas = LogicalArea::orderBy('code')->get();
        $shipmentdetails = ShipmentDetail::where('ship_id',$ship_id)->get();
       // dd($shipmentdetails);

        return view('shipmentdetails.index',compact('shipment','products','logicalareas','shipmentdetails'));
    }

    public function create(Shipment $shipment)
    {
        $status_id = $shipment->status_id;
        //$nr_doc = $shipment->$nr_doc;
        $products = Product::getShipment();
        $logicalareas = LogicalArea::orderBy('code')->get();

        if ($status_id <> 401)
        {
            abort(404);
        }

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
        $product = Product::findOrFail($validatedAttributes['product_id']);

        $validatedAttributes['ship_id'] = $shipment->id;
        $validatedAttributes['prod_code'] = $product->code;
        $validatedAttributes['prod_desc'] = $product->longdesc;

        ShipmentDetail::create($validatedAttributes);
        //dd($validatedAttributes);
        return redirect()->route('shipmentdetail.index', ['shipment' => $shipment]);
    }

    public function show(string $id)
    {
        //
    }

    public function edit(Shipment $shipment, ShipmentDetail $shipmentdetails)
    {
        return view('shipmentdetails.edit', ['products' => $products,
                                            'logicalareas'=> $logicalareas,
                                            'shipment' => $shipment,
                                            'shipmentdetails'=>$shipmentdetails]);
    }

    public function update(Request $request,Shipment $shipment)
    {
        $validatedAttributes = $request->validate ([
            'product_id' => 'required',
            'logical_area_id' => 'required',
            'quantity' => 'required',
            'expiration_at' => '',
            'serial_nr' => '',
        ]);
        $product = Product::findOrFail($validatedAttributes['product_id']);

        $validatedAttributes['ship_id'] = $shipment->id;
        $validatedAttributes['prod_code'] = $product->code;
        $validatedAttributes['prod_desc'] = $product->longdesc;

        ShipmentDetail::update($validatedAttributes);
        //dd($validatedAttributes);
        return redirect()->route('shipmentdetail.index', ['shipment' => $shipment]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
