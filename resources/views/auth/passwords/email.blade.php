@extends('layout.app')

@section('content')
    <div class="login page">
        <div class="row">
            <div class="right">
                <h1>Obnova hesla</h1>
                <img src="{{asset('images/logo.png')}}" alt="logo">
            </div>
            <div class="left">
                <form method="POST" action="{{route('password.email')}}">
                    @csrf
                    <label for="email">E-mailová adresa</label>
                    <input type="email" id="email" class="@error('email') invalid-input @enderror" name="email" value="{{old('email')}}" autocomplete="email" placeholder="E-mailová adresa..." autofocus>
                    @error('email')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <button type="submit">Odoslať link pre obnovu hesla</button>
                </form>
                @if(session('status'))
                    <p id="email-status">{{session('status')}}</p>
                @endif
            </div>
        </div>
    </div>
@endsection
