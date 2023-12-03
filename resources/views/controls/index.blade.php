@extends('layouts.app')
@section('content')

    <div class="card mb-4">
        <div class="card-body">
            <div class="table-responsive-sm table-striped mt-2">
                <table class="table table-striped ">
                    <thead>
                    <tr>
                        <th>Indeks</th>
                        <th>Numer dokumentu</th>
                        <th>Data wystawienia</th>
                        <th>Status dostawy</th>
                        <th>Miejsce</th>
                        <th>Status kontroli</th>
                        <th> </th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach($shipments as $shipment)
                        <tr>
                            <td>{{ $shipment->id }}</td>
                            <td>{{ $shipment->nr_doc }}</td>
                            <td>{{ $shipment->updated_at }}</td>
                            <td>{{ $shipment->st_ship}}</td>
                            <td>{{ $shipment->ean ?? '' }} </td>
                            <td>{{ $shipment->st_control ?? '' }} </td>
                            <td>
                                @if (isset($shipment->st_control))
                                    <a href="{{ route('control.create',['id'=>$shipment->id])}}">
                                        <svg class="icon icon-lg">
                                        <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-right') }}"></use>
                                    </svg>
                                @else
                                    <a href="{{ route('control.show',['id'=>$shipment->id])}}">
                                        <svg class="icon icon-lg">
                                        <use xlink:href="{{ asset('icons/coreui.svg#cil-print') }}"></use>
                                    </svg>
                                @endif

                            </a>
                        </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

@endsection
