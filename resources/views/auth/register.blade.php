@extends('layout.app')

@section('content')

    <div class="login page">
        <div class="row">
            <div class="right">
                <h1>Registrácia</h1>
                <img src="{{asset('images/logo.png')}}" alt="logo">
            </div>
            <div class="left">
                <form method="POST" action="{{route('register')}}">
                    @csrf
                    <label for="name">Meno</label>
                    <input type="text" id="name" class="@error('name') invalid-input @enderror" name="name" value="{{old('name')}}" autocomplete="name" autofocus placeholder="Meno...">
                    @error('name')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="email">E-mailová adresa</label>
                    <input type="email" id="email" class="@error('email') invalid-input @enderror" name="email" value="{{old('email')}}" autocomplete="email" placeholder="E-mailová adresa...">
                    @error('email')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="password">Heslo</label>
                    <input type="password" id="password" class="@error('password') invalid-input @enderror" name="password" autocomplete="new-password" placeholder="Heslo...">
                    @error('password')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="password_confirmation">Potvrdenie hesla</label>
                    <input type="password" id="password_confirmation" class="@error('password_confirmation') invalid-input @enderror" name="password_confirmation" autocomplete="new-password" placeholder="Potvrdenie hesla...">
                    @error('password_confirmation')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <button type="submit">Registrovať sa</button>
                </form>
            </div>
        </div>
    </div>

@endsection