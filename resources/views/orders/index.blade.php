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
                        @foreach($orders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>
                            <td>{{ $order->order_nr }}</td>
                            <td>{{ $order->created_at }}</td>
                            <td>{{ $order->status->code }}</td>
                            <td><a href="#">
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
