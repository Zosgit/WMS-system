@extends('layouts.app')
@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-cube"></i>
                    &nbsp; <b>Nowa dostawa</b>
                </div>

                <form action="{{ route('shipments.store') }}" class="forms-sample" method="POST">
                    @csrf
                <div class="card-body"><canvas id="myBarChart" width="100%" height="10"></canvas>
                    <div class="row p-2">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="code">Numer dokumentu:</label></br>
                                <strong>AUTONUMER</strong>
                            </div>
                            <div class="col-md-12 pt-4">
                                <div class="form-group">
                                    <label for="amount">Dokument przyjęcia</label>
                                    <input type="number" min="0" name="amount"
                                        value="{{ isset($metric) ? $metric->amount : '' }}" class="form-control" id="amount" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="longdesc">Komentarz</label>
                                <textarea type="text" name="longdesc"value="{{ isset($metric) ? $metric->longdesc : '' }}" class="form-control" id="longdesc" rows="4" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row p-2 pt-2">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="supplier_id">Dostawca</label>
                                    <select name="supplier_id" class="form-select form-control @error('supplier_id') is-invalid @enderror" id="supplier_id" required>
                                        <option value="">Wybierz</option>
                                        @foreach ($suppliers as $supplier)
                                                <option value="{{ $supplier->id }}"
                                                    @if (isset($shipment))
                                                    {{ $shipment->supplier_id == $supplier->id ? 'selected' : '' }}
                                            @endif>
                                            {{ $supplier->code }}</option>
                                            @endforeach
                                                @error('supplier_id')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="holder_id">Właściciel</label>
                                    <select name="holder_id" class="form-select form-control @error('holder_id') is-invalid @enderror" id="holder_id" required>
                                        <option value="">Wybierz</option>
                                        @foreach ($holders as $holder)
                                        <option value="{{ $holder->id }}"
                                            @if (isset($shipment))
                                            {{ $shipment->holder_id == $holder->id ? 'selected' : '' }}
                                    @endif>
                                    {{ $holder->code }}</option>
                                    @endforeach

                                        @error('holder_id')
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
                        <a href="{{ route('products.index') }}" class="btn btn-light">Anuluj</a>
                        <a href="{{ route('shipmentdetails.index') }}" class="btn btn-light">details</a>
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
