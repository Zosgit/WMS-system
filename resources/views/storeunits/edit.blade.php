@extends('layouts.app')
@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-cube"></i>
                    &nbsp; <b>Edytuj rodzaj opakowania</b>
                </div>
                <form action="{{ route('storeunits.store') }}" class="forms-sample" method="POST">
                    @csrf
                {{--szablon StoreUnitTypes--}}
                <div class="card-body"><canvas id="myBarChart" width="100%" height="10"></canvas>
                    <div class="row p-2 mt-0">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="code">Rodzaj opakowania</label>
                                <select name="storeunittype_id" class="form-select form-control @error('storeunittype_id') is-invalid @enderror" id="storeunittype_id" required>
                                    <option value="">Wybierz</option>
                                    @foreach ($store_unit_types as $store_unit_type)
                                        <option value="{{ $store_unit_type->id }}"
                                            @if (isset($storeunit))
                                            {{ $storeunit->storeunittype_id == $store_unit_type->id ? 'selected' : old($storeunit->storeunittype_id) }}
                                    @endif>
                                    {{ $store_unit_type->code }}</option>
                                    @endforeach

                                        @error('storeunittype_id')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror

                                    </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="code">Kod kreskowy:</label></br>
                                <strong>AUTONUMER</strong>
                            </div>
                        </div>

                    </div>
                    <div class="row p-4">
                        <div class="col-md-6">
                            <div class="form-check form-switch">
                                <label class="form-check-label" for="su_multi">Czy multi</label>
                                <input class="form-check-input" type="checkbox" role="switch" id="su_multi" name="su_multi">
                            </div>
                        </div>
                    </div>

                    <div class="row p-1">
                        <div class="col-md-6 p-2">
                            <button type="submit" class="btn btn-primary mr-4">Potwierdź</button>
                            <a href="{{ route('storeunits.index') }}" class="btn btn-light">Anuluj</a>
                        </div>
                        <div class="col-md-6 p-2">
                            <a href="#"  data-coreui-toggle="modal" data-coreui-target="#delete{{ $storeunit->id }}"
                                class="btn btn-danger float-end text-white px-4 ">Usuń
                            </a>
                        </div>
                    </div>
                </div>
                </form>
                @include("storeunits.delete")
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
