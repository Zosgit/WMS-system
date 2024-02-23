@extends('layouts.app')

@section('content')
    <div class="card mb-4">
        <div class="card-header">
            Mój profil
        </div>

        <form action="{{ route('profile.update') }}" method="POST">
            @csrf
            @method('PUT')

            <div class="card-body">

                @if ($message = Session::get('success'))
                    <div class="alert alert-success" role="alert">{{ $message }}</div>
                @endif

                <div class="input-group mb-3"><span class="input-group-text">
                    <svg class="icon">
                      <use xlink:href="{{ asset('icons/coreui.svg#cil-user') }}"></use>
                    </svg></span>
                    <input class="form-control" type="text" name="firstname" placeholder="{{ __('Imię') }}"
                           value="{{ old('firstname', auth()->user()->firstname) }}" required>
                    @error('firstname')
                    <span class="invalid-feedback">
                            {{ $message }}
                        </span>
                    @enderror
                </div>

                <div class="input-group mb-3"><span class="input-group-text">
                    <svg class="icon">
                      <use xlink:href="{{ asset('icons/coreui.svg#cil-user') }}"></use>
                    </svg></span>
                    <input class="form-control" type="text" name="lastname" placeholder="{{ __('Nazwisko') }}"
                           value="{{ old('lastname', auth()->user()->lastname) }}" required>
                    @error('lastname')
                    <span class="invalid-feedback">
                            {{ $message }}
                        </span>
                    @enderror
                </div>

                <div class="input-group mb-3"><span class="input-group-text">
                    <svg class="icon">
                      <use xlink:href="{{ asset('icons/coreui.svg#cil-envelope-open') }}"></use>
                    </svg></span>
                    <input class="form-control" type="text" name="email" placeholder="{{ __('Email') }}"
                           value="{{ old('email', auth()->user()->email) }}" required>
                    @error('email')
                    <span class="invalid-feedback">
                            {{ $message }}
                        </span>
                    @enderror
                </div>

                <div class="input-group mb-3"><span class="input-group-text">
                    <svg class="icon">
                      <use xlink:href="{{ asset('icons/coreui.svg#cil-lock-locked') }}"></use>
                    </svg></span>
                    <input class="form-control @error('password') is-invalid @enderror" type="password"
                           name="password" placeholder="Nowe hasło" required>
                    @error('password')
                    <span class="invalid-feedback">
                            {{ $message }}
                        </span>
                    @enderror
                </div>

                <div class="input-group mb-4"><span class="input-group-text">
                    <svg class="icon">
                      <use xlink:href="{{ asset('icons/coreui.svg#cil-lock-locked') }}"></use>
                    </svg></span>
                    <input class="form-control @error('password_confirmation') is-invalid @enderror" type="password"
                           name="password_confirmation" placeholder="Potwierdź nowe hasło" required>
                </div>

            </div>

                <div class="col-mt-6 p-3">
                    <button type="submit" class="btn btn-primary mr-4">Potwierdź</button>

                </div>

        </form>

    </div>
@endsection
