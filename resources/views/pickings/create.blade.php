@extends('layouts.app')
@section('content')
<a class="big" href="{{ route('pickings.index') }}"><svg class="icon">
    <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-left') }}"></use>
  </svg>&nbsp;Lista wydań</a></br></br>
<div class="container">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <div>Wydanie nr: <strong>{{$order->order_nr}}</strong></div>
        </div>
        <div class="card-body">
            <div class="row mb-4 ml-4">
            <div class="col-sm-4">
                <h6 class="mb-3">Szczegóły:</h6>
                <div>Dok. wydania: <strong>{{ $order->external_nr}}</strong></div>
                <div>Data przyjęcia: <strong>{{ $order->created_at}}</strong></div>
                <div>Status: <strong>{{ $order->status->code}}</strong></div>
                <div>Uwagi: {{ $order->remarks}}</div>
                <div>Miejsce: {{ $order->location->ean ?? '' }}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Właściciel:</h6>
                <div><strong>{{ $order->getHolder->code  ?? '' }}</strong></div>
                <div>{{ $order->getHolder->longdesc  ?? '' }}</div>
                <div>{{ $order->getHolder->postcode  ?? '' }} - {{ $order->getHolder->city  ?? '' }}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Odbiorca:</h6>
                <div><strong>{{ $order->getCustomer->code  ?? '' }}</strong></div>
                <div>{{ $order->getCustomer->longdesc  ?? '' }}</div>
                <div>{{ $order->getCustomer->postcode  ?? '' }} - {{ $order->getCustomer->city  ?? '' }}</div>
            </div>
            </div>

            <div class="container">
                <div class="card">
                    <div class="card-body">
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
                                    @foreach($orderdetails as $orderdetail)
                                        <tr>
                                            <td>{{ $orderdetail->product->code }}</td>
                                            <td>{{ $orderdetail->serial_nr }}</td>
                                            <td>{{ $orderdetail->expiration_at}}</td>
                                            <td>{{ $orderdetail->logical_area_id}}</td>
                                            <td>{{ $orderdetail->product->producttype->code ?? '' }}</td>
                                            <td>{{ $orderdetail->quantity}}</td>
                                            {{-- <td><a href="{{ route('orderdetail.edit',['order' => $order, 'orderdetail' => $orderdetail]) }}">
                                                <svg class="icon icon-lg">
                                                    <use xlink:href="{{ asset('icons/coreui.svg#cil-color-border') }}"></use>
                                                </svg>
                                                </a>
                                            </td> --}}
                                        </tr>
                                    @endforeach
                                    </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
