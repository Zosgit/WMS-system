@extends('layouts.app')
@section('title') {{ 'Strona główna' }} @endsection

@section('content')
    @include('dashboard')
    <div class="card mb-4">
        <div class="card-header">
          <strong>  Zapas  magazynu </strong>
        </div>
        <div class="card-body">

        </div>
    </div>
@endsection
