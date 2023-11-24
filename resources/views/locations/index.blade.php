@extends('layouts.app')
@section('content')

    <div class="card mb-4">
        <div class="card-header">
            <b>Lokalizacja</b>
                <div class="float-end">
                    <a href="{{ route('locations.createmulti') }}"
                        class="btn btn-primary px-4 btn-sm ">Dodaj wiele</a>
                    <a href="{{ route('locations.create') }}"
                        class="btn btn-primary px-4 btn-sm">Dodaj jedną</a>

                </div>
        </div>

        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Strefa magazynu</th>
                    <th scope="col">Status</th>
                    <th scope="col">Etykieta</th>
                    <th scope="col">Regał</th>
                    <th scope="col">Rząd</th>
                    <th scope="col">Piętro</th>
                    <th scope="col"> </th>
                </tr>
                </thead>
                <tbody>
                @foreach($locations as $location)
                    <tr>
                        <td>{{ $location->store_area->code  ?? '' }}</td>
                        <td>{{ $location->status->code  ?? '' }}</td>
                        <td>{{ $location->ean }}</td>
                        <td>{{ $location->pos_x }}</td>
                        <td>{{ $location->pos_y }}</td>
                        <td>{{ $location->pos_z }}</td>
                        <td><a href="{{ route('locations.edit', ['location' => $location]) }}">
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
@endsection
