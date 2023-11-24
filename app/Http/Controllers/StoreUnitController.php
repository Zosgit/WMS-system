<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\StoreUnit;
use App\Models\Location;
use App\Models\StoreUnitType;
use App\Models\Status;

class StoreUnitController extends Controller
{
    public function index()
    {
        $su = new StoreUnit();
        $su->CreateUnit(1);

        $storeunits = StoreUnit::whereNotNull('location_id')->get();
        return view('storeunits.index', compact('storeunits'));
    }

    public function create()
    {
        return view('storeunits.create',['store_unit_types' => StoreUnitType::all(),
                                        'locations' => Location::all(),
                                        'status' => Status::getObject('SU')]);
    }

    public function store(Request $request)
    {
        //dd($request);
        $validatedAttributes = $request->validate ([
            'storeunittype_id' => 'required',
            'location_id' => 'required',
            'status_id' => 'required'
        ]);
        $validatedAttributes['su_multi'] = $request->get('su_multi') == 'on' ? 1 : 0;

        StoreUnit::updateOrCreate(['id' => $request->id], $request->except('id'));
        return redirect()->route('storeunits.index')->with('success', 'Opakowanie dodane poprawnie!');

    }
    public function edit(Storeunit $storeunit)
    {
       // dd($products = Product::find($id));
        return view('storeunits.edit', ['storeunit' => $storeunit,
                                        'store_unit_types' => StoreUnitType::all(),
                                        'locations' => Location::all(),
                                        'status' => Status::getObject('SU')]);
    }
    public function update(Storeunit $storeunit, Request $request)
    {
       // dd($request);
       $validatedAttributes = $request->validate ([
        'storeunittype_id' => 'required',
        'location_id' => 'required',
        'status_id' => 'required'
    ]);
    $validatedAttributes['su_multi'] = $request->get('su_multi') == 'on' ? 1 : 0;

    StoreUnit::updateOrCreate(['id' => $request->id], $request->except('id'));
    return redirect()->route('storeunits.index')->with('success', 'Opakowanie edytowane poprawnie!');
    }
    public function destroy(Storeunit $storeunit)
    {
        $storeunit->delete();
        return redirect()->route('storeunits.index')->with('success', 'Opakowanie usunięte');
    }

}
