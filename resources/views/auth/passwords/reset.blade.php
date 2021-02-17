@extends('layout.app')

@section('content')
    <div class="login page">
        <div class="row">
            <div class="right">
                <h1>Obnova hesla</h1>
                <img src="{{asset('images/logo.png')}}" alt="logo">
            </div>
            <div class="left">
                <form method="POST" action="{{route('password.update')}}">
                    @csrf
                    <input type="hidden" name="token" value="{{$token}}">
                    <label for="email">E-mailová adresa</label>
                    <input type="email" id="email" class="@error('email') invalid-input @enderror" name="email" value="{{$email ?? old(('email'))}}" autocomplete="email" placeholder="E-mailová adresa..." autofocus>
                    @error('email')
                     <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="password">Nové heslo</label>
                    <input type="password" id="password" class="@error('password') invalid-input @enderror" name="password" autocomplete="new-password" placeholder="Nové heslo...">
                    @error('password')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="password_confirmation">Potvrdenie hesla</label>
                    <input type="password" id="password_confirmation" class="@error('password_confirmation') invalid-input @enderror" name="password_confirmation" autocomplete="new-password" placeholder="Potvrdenie hesla...">
                    @error('password_confirmation')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <button type="submit">Obnoviť heslo</button>
                </form>
            </div>
        </div>
    </div>
{{--<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Reset Password') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('password.update') }}">
                        @csrf

                        <input type="hidden" name="token" value="{{ $token }}">

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Reset Password') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>--}}
@endsection
