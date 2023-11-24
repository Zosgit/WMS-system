@extends('layouts.app')
@section('content')

    <div class="card mb-4">
        <div class="card-header">
            <b>Lista produktów</b>{{ ' - '.$productCount}}
                <a href="{{ route('products.create') }}"
                    class="btn btn-primary float-end px-4 btn-sm">Dodaj</a>
        </div>

        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Nazwa</th>
                    <th scope="col">Opis</th>
                    <th scope="col">Typ produktu</th>
                    <th scope="col">EAN</th>
                    <th scope="col">JM</th>
                    <th scope="col"> </th>
                </tr>
                </thead>
                <tbody>
                @foreach($products as $product)
                    <tr>
                        <td>{{ $product->code }}</td>
                        <td>{{ $product->longdesc }}</td>
                        <td>{{ $product->producttype->code ?? '' }}</td>
                        <td>{{ $product->ean }}</td>
                        <td>{{ $product->productmetric->code ?? '' }}</td>
                        <td><a href="{{ route('products.edit', ['product' => $product]) }}">
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
        </div> --}}

    </div>

@endsection

@push('scripts')
<script>
    //$(document).ready(function() {
    //$('#data_table').DataTable();
    //});

    var table = new DataTable('#data_table', {
    language: {
        url: '{{asset("plugins/DataTables/pl.json")}}',
    },
});
</script>
@endpush
