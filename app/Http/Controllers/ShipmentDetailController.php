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
    public function index()
    {
        //
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

        $shipmentdetails = ShipmentDetail::create($validatedAttributes);
        //dd($validatedAttributes);
        return redirect()->route('shipmentdetail.show', ['shipment' => $shipment, 'shipmentdetails' => $shipmentdetails]);
    }

    public function show(Shipment $shipment)
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
       //dd($shipmentdetails);

        return view('shipmentdetails.show',compact('shipment','products','logicalareas','shipmentdetails'));
    }

    public function edit(Shipment $shipment, ShipmentDetail $shipmentdetail)
    {
        $status_id = $shipment->status_id;

        if ($status_id <> 401) {
            abort(404);
        }

        $products = Product::getShipment();
        $logicalareas = LogicalArea::orderBy('code')->get();

        return view('shipmentdetails.edit', ['products' => $products,
                                            'logicalareas' => $logicalareas,
                                            'shipment' => $shipment,
                                            'shipmentdetail' => $shipmentdetail]);
    }

    public function update(Request $request, Shipment $shipment, ShipmentDetail $shipmentdetail)
    {
        $status_id = $shipment->status_id;

        if ($status_id <> 401) {
            abort(404);
        }

        $validatedAttributes = $request->validate([
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

        $shipmentdetail->update($validatedAttributes);

        return redirect()->route('shipmentdetail.show', ['shipment' => $shipment, 'shipmentdetails' => $shipmentdetail]);
    }

    public function destroy(Shipment $shipment, ShipmentDetail $shipmentdetail)
    {
        $status_id = $shipment->status_id;

        if ($status_id <> 401) {
            abort(404);
        }

        $shipmentdetail->delete();
        return redirect()->route('shipmentdetail.show', ['shipment' => $shipment])->with('success', 'Shipment Detail deleted successfully');
    }

    public function sendcontrol($id)
    {
        $shipment = Shipment::findorfail($id);
        $data = [
            'status_id' => 403,
        ];
        $shipment->update($data);
        return redirect()->route('controls.index')->with('success', 'Dokument przekazany do kontroli :)');


    }

}
