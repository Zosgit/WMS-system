@extends('layouts.app')
@section('content')
<div class="container">
    <div class="card">
        <div class="card-header d-flex align-items-center"><div>Dostawa nr: <strong>D_20231125_65</strong></div><a class="btn btn-sm btn-secondary ms-auto me-1 d-print-none" href="#" onclick="javascript:window.print();">
            <svg class="icon">
                <use xlink:href="icons/coreui.svg#cil-print"></use>
            </svg> Print</a><a class="btn btn-sm btn-info me-1 d-print-none" href="#">
            <svg class="icon">
                <use xlink:href="icons/coreui.svg#cil-save"></use>
            </svg> Save</a></div>
        <div class="card-body">
            <div class="row mb-4">
            <div class="col-sm-4">
                <h6 class="mb-3">Szczegóły:</h6>
                <div>Dok: dostawy: <strong>zazaza</strong></div>
                <div>Data przyjęcia: <strong>2023-11-25 12:10:40</strong></div>
                <div>Status: <strong>Wprowadzony</strong></div>
                <div>Uwagi: zazaa</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Dostarczył:</h6>
                <div><strong>Media Expert</strong></div>
                <div>Firma Media Expert</div>
                <div>39-300 - Mielec</div>
            </div>
            <div class="col-sm-4">
                <h6 class="mb-3">Właściciel:</h6>
                <div><strong>X-KOM</strong></div>
                <div>Firma X-KOM</div>
                <div>39-300 - Mielec</div>
            </div>
            </div>

            <a href="#"
            class="btn btn-primary float-start px-4 btn-sm">Dodaj pozycję</a>
            <div class="table-responsive-sm">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Indeks</th>
                        <th>Nr seryjny</th>
                        <th>Termin</th>
                        <th>Magazyn</th>
                        <th>Kategoria</th>
                        <th class="center">Ilość</th>
                        <th class="center">Operacje</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
