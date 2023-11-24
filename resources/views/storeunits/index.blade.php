@extends('layouts.app')
@section('content')

    <div class="card mb-4">
        <div class="card-header">
            <b>Lista opakowań</b>
                <a href="{{ route('storeunits.create') }}"
                    class="btn btn-primary float-end px-4 btn-sm">Dodaj</a>
        </div>

        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Rodzaj opakowania</th>
                    <th scope="col">EAN opakowania</th>
                    <th scope="col">Lokalizacja</th>
                    <th scope="col">status</th>
                    <th scope="col"> </th>
                </tr>
                </thead>
                <tbody>
                @foreach($storeunits as $storeunit)
                    <tr>
                        <td>{{ $storeunit->storeunittype->code ?? '' }}</td>
                        <td>{{ $storeunit->ean }}</td>
                        <td>{{ $storeunit->location->ean ?? '' }}</td>
                        <td>{{ $storeunit->status->code ?? '' }}</td>
                        <td><a href="{{ route('storeunits.edit', ['storeunit' => $storeunit]) }}">
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

        {{--
        <div class="card-footer">
            {{ $users->links() }}
        </div>
        --}}
    </div>

@endsection
