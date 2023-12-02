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

        $shipments = Shipment::all();
        return view('controls.index', compact('shipments'));
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
