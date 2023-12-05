@extends('layouts.app')
@section('content')
<a class="big" href="{{ route('pickings.index') }}"><svg class="icon">
    <use xlink:href="{{ asset('icons/coreui.svg#cil-arrow-left') }}"></use>
  </svg>&nbsp;Lista wydań</a></br></br>
<div class="container">
    <div class="card">
        <div class="card-header d-flex align-items-center">
            <div>Wydanie nr: <strong>{{$order->order_nr}}</strong></div>
        </div>
        <div class="card-body">
            <div class="row mb-4 ml-4">
            <div class="col-sm-4">
                <h6 class="mb-3">Szczegóły:</h6>
                <div>Dok. wydania: <strong>{{ $order->external_at}}</strong></div>
                <div>Data przyjęcia: <strong>{{ $order->created_at}}</strong></div>
                <div>Status: <strong>{{ $order->status->code}}</strong></div>
                <div>Uwagi: {{ $order->remarks}}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Właściciel:</h6>
                <div><strong>{{ $order->getHolder->code  ?? '' }}</strong></div>
                <div>{{ $order->getHolder->longdesc  ?? '' }}</div>
                <div>{{ $order->getHolder->postcode  ?? '' }} - {{ $order->getHolder->city  ?? '' }}</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Odbiorca:</h6>
                <div><strong>{{ $order->getCustomer->code  ?? '' }}</strong></div>
                <div>{{ $order->getCustomer->longdesc  ?? '' }}</div>
                <div>{{ $order->getCustomer->postcode  ?? '' }} - {{ $order->getCustomer->city  ?? '' }}</div>
            </div>
            </div>

            <div class="container">
                <div class="card">
                    <form action="{{ route('picking.store',['id' => $order->id]) }}" class="forms-sample" method="POST">

                        @csrf
                        <div class="card-body">
                            <div class="row mb-4 ml-4 p-2">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="location_id">Lokalizacja</label></br>
                                        <select name="location_id" class="form-select form-control @error('location_id') is-invalid @enderror" id="location_id" required>
                                            <option value="">Wybierz</option>
                                            @foreach ($locations as $location)
                                            <option value="{{ $location->id }}"
                                                @if (isset($picking))
                                                {{ $picking->location_id == $location->id ? 'selected' : '' }}
                                            @endif>
                                            {{ $location->ean}}</option>
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
                                            value="" class="form-control" id="remarks" rows="1" ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 p-3">
                                <button type="submit" class="btn btn-primary mr-4">Potwierdź</button>
                                <a href="{{ route('pickings.index') }}"
                                        class="btn btn-light">Anuluj</a>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
