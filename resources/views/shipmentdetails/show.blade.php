@extends('layouts.app')
@section('content')
<a class="big" href="{{ route('shipments.index') }}"><svg class="icon">
    <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-left') }}"></use>
  </svg>&nbsp;Lista dostaw</a></br></br>
<div class="container">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <div>Dostawa nr: <strong>{{$shipment->nr_doc}}</strong></div>
                <a class="btn btn-sm btn-secondary ms-auto me-1 d-print-none" href="#" onclick="javascript:window.print();">
                    <svg class="icon">
                        <use xlink:href="{{ asset('icons/coreui.svg#cil-print') }}"></use>
                    </svg> Drukuj</a>
                    <a class="btn btn-sm btn-info me-1 d-print-none" href="{{ route('shipmentdetail.send',['id' => $shipment->id]) }}"> Do kontroli</a>
            </div>
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
                <div><strong>{{ $shipment->supplier->code  ?? '' }}</strong></div>
                <div>{{ $shipment->supplier->longdesc  ?? '' }}</div>
                <div>{{ $shipment->supplier->postcode  ?? '' }} - {{ $shipment->supplier->city  ?? '' }}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Właściciel:</h6>
                <div><strong>{{ $shipment->holder->code  ?? '' }}</strong></div>
                <div>{{ $shipment->holder->longdesc  ?? '' }}</div>
                <div>{{ $shipment->holder->postcode  ?? '' }} - {{ $shipment->holder->city  ?? '' }}</div>
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
                        <th> </th>
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
                                <td><a href="{{ route('shipmentdetail.edit',['shipment' => $shipment, 'shipmentdetail' => $shipmentdetail]) }}">
                                    <svg class="icon icon-lg">
                                        <use xlink:href="{{ asset('icons/coreui.svg#cil-color-border') }}"></use>
                                    </svg>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
