@extends('layouts.app')
@section('content')

<div class="card mb-4">
    <div class="card-header">
        <b>Lista dostaw</b>
    </div>

    <div class="card-body">
        <div class="table-responsive-sm table-striped mt-2">
            <table class="table table-striped ">
                <thead>
                <tr>
                    <th>Indeks</th>
                    <th> </th>
                </tr>
                </thead>
                <tbody>
                    @foreach($shipmentdetails as $shipmentdetail)
                    <tr>
                        <td>{{ $shipmentdetail->ship_id }}</td>

                    </tr>
                @endforeach

                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection
