<?php

namespace App\Http\Controllers;
use App\Models\ShipmentDetail;
use App\Models\Shipment;
use App\Models\Status;
use App\Models\Location;
use App\Models\Control;
use Illuminate\Http\Request;

class ControlController extends Controller
{
    public function index(Shipment $shipment)
    {
        $shipments = Shipment::where('status_id', 403)->get();
        return view('controls.index', compact('shipments'));
    }

    public function create(Shipment $shipment)
    {
        $status_id = $shipment->status_id;
        $ship_id = $shipment->id;
        $locations = Location::getLocationFree();

        if ($status_id <> 403)
        {
            abort(404);
        }
        $shipmentdetails = ShipmentDetail::where('ship_id', $ship_id)->get();
        return view('controls.create',compact('shipment','shipmentdetails', 'locations'));
    }

    public function store(Request $request)
    {
        //
    }

    public function show(Shipment $shipment)
    {
        $status_id = $shipment->status_id;
        $ship_id = $shipment->id;
        $locations = Location::getLocationFree();

        if ($status_id <> 403)
        {
            abort(404);
        }
        $shipmentdetails = ShipmentDetail::where('ship_id',$ship_id)->get();
        return view('controls.show',compact('shipment','shipmentdetails', 'locations'));
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
