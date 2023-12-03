<?php

namespace App\Http\Controllers;
use App\Models\ShipmentDetail;
use App\Models\Shipment;
use App\Models\Status;
use App\Models\Location;
use App\Models\Control;
use Illuminate\Http\Request;
use DB;

class ControlController extends Controller
{
    public function index()
    {
       // $shipments = Shipment::where('status_id', 403)->get();
        $shipments = DB::table('v_list_controls')->orderby('updated_at','desc')->paginate();
        return view('controls.index', compact('shipments'));
    }

    public function create($id)
    {
        $shipment = Shipment::findorfail($id);
        $status_id = $shipment->status_id;
        $ship_id = $shipment->id;
        $control = Control::getControl($ship_id);

        if ($status_id <> 403)
        {
            abort(404);
        }
        $shipmentdetails = ShipmentDetail::where('ship_id', $ship_id)->get();

        return view('controls.create',compact('shipment','shipmentdetails','control'));
    }

    public function store(Request $request,$id)
    {
        $validatedAttributes = $request->validate ([
            'location_id' => 'required',
            'remarks' => ''
        ]);

        $validatedAttributes['ship_id'] = $id;

        Control::create($validatedAttributes);
        return redirect()->route('controls.index')->with('success', 'Kontrahent dodany poprawnie!');



    }

    public function show($id)
    {
        $shipment = Shipment::findorfail($id);
        $status_id = $shipment->status_id;
        $ship_id = $shipment->id;
        $locations = Location::getLocationControl();

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
