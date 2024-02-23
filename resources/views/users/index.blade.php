@extends('layouts.app')
@section('title') {{ 'Pracownicy' }} @endsection
@section('content')
    <div class="card mb-4">
        <div class="card-header">
            <b>Spis pracowników</b>
        </div>

        <div class="card-body">

            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="col">Imię</th>
                    <th scope="col">Nazwisko</th>
                    <th scope="col">Email</th>
                </tr>
                </thead>
                <tbody>
                @foreach($users as $user)
                    <tr>
                        <td>{{ $user->firstname }}</td>
                        <td>{{ $user->lastname }}</td>
                        <td>{{ $user->email }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            <p>
                Ilość: {{$users->count()}} z {{ $users->total() }} rekordów.
            </p>
        </div>

        {{--
        <div class="card-footer">
            {{ $users->links() }}
        </div>
        --}}
    </div>
@endsection
