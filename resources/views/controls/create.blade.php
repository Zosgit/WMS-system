@extends('layouts.app')
@section('content')
<a class="big" href="{{ route('controls.index') }}"><svg class="icon">
    <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-left') }}"></use>
  </svg>&nbsp;Lista dostaw</a></br></br>
<div class="container">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <div>Dostawa nr: <strong>{{$shipment->nr_doc}}</strong></div>
        </div>
        <div class="card-body">
            <div class="row mb-4 ml-4">
            <div class="col-sm-4">
                <h6 class="mb-3">Szczegóły:</h6>
                <div>Dok. dostawy: <strong>{{ $shipment->name_doc}}</strong></div>
                <div>Data przyjęcia: <strong>{{ $shipment->created_at}}</strong></div>
                <div>Status: <strong>{{ $shipment->status->code}}</strong></div>
                <div>Uwagi: {{ $shipment->remarks}}</div>
                <div>Miejsce: {{ $shipment->remarks}}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Dostarczył:</h6>
                <div><strong>{{ $shipment->supplier->code  ?? '' }}</strong></div>
                <div>{{ $shipment->supplier->longdesc  ?? '' }}</div>
                <div>{{ $shipment->supplier->postcode  ?? '' }} - {{ $shipment->supplier->city  ?? '' }}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Właściciel:</h6>
                <div><strong>{{ $shipment->holder->code  ?? '' }}</strong></div>
                <div>{{ $shipment->holder->longdesc  ?? '' }}</div>
                <div>{{ $shipment->holder->postcode  ?? '' }} - {{ $shipment->holder->city  ?? '' }}</div>
            </div>
            </div>

            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <div class="row mb-4 ml-4 p-2">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="location_id">Lokalizacja</label></br>
                                    <select name="location_id" class="form-select form-control @error('location_id') is-invalid @enderror" id="location_id" required>
                                        <option value="">Wybierz</option>
                                        @foreach ($locations as $location)
                                        <option value="{{ $location->id }}"
                                            @if (isset($control))
                                            {{ $control->location_id == $location->id ? 'selected' : '' }}
                                        @endif>
                                        {{ $location->ean.' || '.$location->storearea_id}}</option>
                                        @endforeach

                                        @error('location_id')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="remarks">Komentarz</label>
                                    <textarea type="text" name="remarks"
                                        value="{{ isset($shipment) ? $shipment->remarks : '' }}" class="form-control" id="remarks" rows="1" ></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <a href="{{ route('controls.create') }}"
                            class="btn btn-primary mb-1">Wybierz opakowanie</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
