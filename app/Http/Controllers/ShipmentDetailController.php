<?php

namespace App\Http\Controllers;
use App\Models\ShipmentDetail;
use Illuminate\Http\Request;

class ShipmentDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        function generujNazweDokumentu($licznikID) {
            $data = date("Ymd");
            $nazwaDokumentu = 'D_' . $data . '_' . $licznikID;
            return $nazwaDokumentu;
        }
        $licznikID = 1;
        $nr_doc = generujNazweDokumentu($licznikID);
        //echo "Wygenerowana nazwa dokumentu: $nr_doc";
        $licznikID++;

        return view('shipmentdetails.index', compact('nr_doc'));
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
