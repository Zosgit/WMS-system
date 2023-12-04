<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Shipment;
use App\Models\Firm;
use App\Models\Status;
use App\Models\Counter;

class ShipmentController extends Controller
{
    public function index()
    {
        $shipments = Shipment::all();
        return view('shipments.index', compact('shipments'));
    }

    public function create()
    {
        return view('shipments.create',[ 'status' => Status::getObject('SHIPMENT'),
                                        'suppliers' => Firm::getSupplier('1'),
                                        'holders' => Firm::getHolder('1')]);
    }

    public function store(Request $request)
    {
        $validatedAttributes = $request->validate ([
            'holder_id' => 'required',
            'supplier_id' => 'required',
            'name_doc' => 'required|max:50',
            'remarks' => ''
        ]);
        $validatedAttributes['nr_doc'] = Counter::getNumber('DOSTAWA');
        $shipment = Shipment::create($validatedAttributes);
        //dd($shipment);
        return redirect()->route('shipmentdetail.create',['shipment'=>$shipment]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Shipment $shipment)
    {
        dd($shipment);
        return view('shipments.index');
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
