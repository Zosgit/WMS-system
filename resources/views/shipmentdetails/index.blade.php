@extends('layouts.app')
@section('content')
<div class="container">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <div>Dostawa nr: <strong>{{$shipment->nr_doc}}</strong></div>
            <a class="btn btn-sm btn-secondary ms-auto me-1 d-print-none" href="#" onclick="javascript:window.print();">
                <svg class="icon">
                    <use xlink:href="icons/coreui.svg#cil-print"></use>
                </svg> Print</a><a class="btn btn-sm btn-info me-1 d-print-none" href="#">
                <svg class="icon">
                    <use xlink:href="icons/coreui.svg#cil-save"></use>
                </svg> Save</a></div>
        <div class="card-body">
            <div class="row mb-4 ml-4">
            <div class="col-sm-4">
                <h6 class="mb-3">Szczegóły:</h6>
                <div>Dok. dostawy: <strong>{{ $shipment->name_doc}}</strong></div>
                <div>Data przyjęcia: <strong>{{ $shipment->created_at}}</strong></div>
                <div>Status: <strong>{{ $shipment->status->code}}</strong></div>
                <div>Uwagi: {{ $shipment->remarks}}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Dostarczył:</h6>
                <div><strong>{{ $shipment->firm->code  ?? '' }}</strong></div>
                <div>Firma Media Expert</div>
                <div>39-300 - Mielec</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Właściciel:</h6>
                <div><strong>X-KOM</strong></div>
                <div>Firma X-KOM</div>
                <div>39-300 - Mielec</div>
            </div>
            </div>

            <a href="{{ route('shipmentdetail.create',['shipment'=>$shipment]) }}" class="btn btn-primary float-start px-4 btn-sm">Dodaj pozycję</a>
            <div class="table-responsive-sm table-striped mt-2">
                <table class="table table-striped ">
                    <thead>
                    <tr>
                        <th>Indeks</th>
                        <th>Nr seryjny</th>
                        <th>Termin</th>
                        <th>Magazyn</th>
                        <th>Kategoria</th>
                        <th>Ilość</th>
                        <th>Operacje</th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach($shipmentdetails as $shipmentdetail)
                            <tr>
                                <td>{{ $shipmentdetail->product->code }}</td>
                                <td>{{ $shipmentdetail->serial_nr }}</td>
                                <td>{{ $shipmentdetail->expiration_at}}</td>
                                <td>{{ $shipmentdetail->logical_area_id}}</td>
                                <td>{{ $shipmentdetail->product->producttype->code ?? '' }}</td>
                                <td>{{ $shipmentdetail->quantity}}</td>
                                <td>{{ $shipmentdetail->remarks}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
