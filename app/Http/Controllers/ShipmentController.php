<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Shipment;
use App\Models\Firm;
use App\Models\Status;

class ShipmentController extends Controller
{
    public function index()
    {
        return view('shipments.index',['status_id' => Status::getObject('LOC'),//ZMIENIC NA TE W BAZIE!!!
                                        'holder_id' => Firm::getObject1('1'),
                                        'supplier_id' => Firm::getObject2('1')]);

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
