@extends('layout.app')

@section('content')
    <div class="login page">
        <div class="row">
            <div class="right">
                <h1>Prihlásenie</h1>
                <img src="{{asset('images/logo.png')}}" alt="logo">
            </div>
            <div class="left">
                <form method="POST" action="{{route('login')}}">
                    @csrf
                    <label for="email">E-mailová adresa</label>
                    <input type="email" id="email" class="@error('email') invalid-input @enderror" name="email" value="{{old('email')}}" autocomplete="email" placeholder="E-mailová adresa..." autofocus>
                    @error('email')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="password">Heslo</label>
                    <input type="password" id="password" class="@error('password') invalid-input @enderror" name="password" autocomplete="current-password" placeholder="Heslo...">
                    @error('password')
                    <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <button type="submit">Prihlásiť sa</button>
                    @if(Route::has('password.request'))
                        <a class="button" href="{{route('password.request')}}" id="forgot-password">Zabudli ste si heslo ?</a>
                    @endif
                </form>
            </div>
        </div>
    </div>
@endsection
