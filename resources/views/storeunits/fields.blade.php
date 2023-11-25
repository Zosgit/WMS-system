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
                            {{ $storeunit->storeunittype_id == $store_unit_type->id ? 'selected' : '' }}
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

    <div class="col-md-6 p-3">
        <button type="submit" class="btn btn-primary mr-4">Potwierdź</button>
        <a href="{{ route('storeunits.index') }}"
                    class="btn btn-light">Anuluj</a>
    </div>
</div>
</form>
