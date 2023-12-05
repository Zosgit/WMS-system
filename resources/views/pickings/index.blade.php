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
                        <th>Miejsce????????</th>
                        <th>Status kontroli</th>
                        <th> </th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach($orders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>
                            <td>{{ $order->order_nr }}</td>
                            <td>{{ $order->updated_at }}</td>
                            <td>{{ $order->st_order}}</td>
                            <td>{{ $order->ean ?? '' }} </td>
                            <td>{{ $order->st_pick ?? '' }} </td>
                            <td>
                                @if (isset($order->st_pick))
                                    <a href="{{ route('picking.create',['id'=>$order->id])}}">
                                        <svg class="icon icon-lg">
                                        <use xlink:href="{{ asset('icons/coreui.svg#cil-check-alt') }}"></use>
                                    </svg>
                                @else
                                    <a href="{{ route('picking.show',['id'=>$order->id])}}">
                                        <svg class="icon icon-lg">
                                        <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-right') }}"></use>
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
