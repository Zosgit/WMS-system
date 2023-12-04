@extends('layouts.app')
@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-cube"></i>
                    &nbsp; <b>Nowe wydanie</b>
                </div>
                <form action="{{ route('orders.store') }}" class="forms-sample" method="POST">
                    @csrf
                <div class="card-body"><canvas id="myBarChart" width="100%" height="10"></canvas>
                    <div class="row p-2">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="order_nr">Numer dokumentu:</label></br>
                                <strong>AUTONUMER</strong>
                            </div>
                            <div class="col-md-12 pt-4">
                                <div class="form-group">
                                    <label for="external_nr">Dokument wydania</label>
                                    <input type="text"  name="external_nr"
                                        value="{{ isset($order) ? $ordedr->external_nr : '' }}" class="form-control" id="external_nr" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="remarks">Komentarz</label>
                                <textarea type="text" name="remarks"
                                    value="{{ isset($order) ? $order->remarks : '' }}" class="form-control" id="remarks" rows="4" ></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row p-2 pt-2">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="firm_id">Odbiorca</label>
                                    <select name="firm_id" class="form-select form-control @error('firm_id') is-invalid @enderror" id="firm_id" required>
                                        <option value="">Wybierz</option>
                                        @foreach ($customers as $customer)
                                        <option value="{{ $customer->id }}"
                                            @if (isset($order))
                                            {{ $order->firm_id == $customer->id ? 'selected' : '' }}
                                    @endif>
                                    {{ $customer->code }}</option>
                                    @endforeach

                                        @error('firm_id')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="owner_id">Właściciel</label>
                                    <select name="owner_id" class="form-select form-control @error('owner_id') is-invalid @enderror" id="owner_id" required>
                                        <option value="">Wybierz</option>
                                        @foreach ($owners as $owner)
                                        <option value="{{ $owner->id }}"
                                            @if (isset($order))
                                            {{ $order->owner_id == $owner->id ? 'selected' : '' }}
                                    @endif>
                                    {{ $owner->code }}</option>
                                    @endforeach

                                        @error('owner_id')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 p-3">
                        <button type="submit" class="btn btn-primary mr-4">Potwierdź</button>
                        <a href="{{ route('orders.index') }}" class="btn btn-light">Anuluj</a>
                    </div>
                </div>
            </form>

            @push('scripts')
                <script src="{{ asset("plugins/select2/dist/js/select2.min.js")}}"></script>
                <script>
                    $(document).ready(function() {
                    $('.select_2').select2();
                    });
                </script>
            @endpush

            </div>
        </div>
    </div>
</div>
@endsection
