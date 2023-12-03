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
                        <th>Status</th>
                        <th> </th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach($shipments as $shipment)
                        <tr>
                            <td>{{ $shipment->id }}</td>
                            <td>{{ $shipment->nr_doc }}</td>
                            <td>{{ $shipment->created_at }}</td>
                            <td>{{ $shipment->status->code }}</td>
                            <td><a href="{{ route('control.show',['shipment'=>$shipment])}}">
                                <svg class="icon icon-lg">
                                    <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-right') }}"></use>
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

@endsection
