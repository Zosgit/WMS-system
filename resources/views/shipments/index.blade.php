@extends('layouts.app')
@section('content')

    <div class="card mb-4">
        <div class="card-header">
            <b>Lista opakowań</b>
                <a href="{{ route('shipments.create') }}"
                    class="btn btn-primary float-end px-4 btn-sm">Dodaj</a>
        </div>

        <div class="card-body">

        </div>
    </div>

@endsection
