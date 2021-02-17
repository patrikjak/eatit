@extends('layout.app')

@section('content')

    <div class="profile">
        <div class="row">
            <div class="col-2">
                <div class="profile-photo">
                    @if($user->profile_photo === 'none')
                        <img src="{{asset('images/user-none.svg')}}" alt="profile-image" id="none-photo">
                    @else
                        <img src="{{url('/')}}/storage/{{\Illuminate\Support\Facades\Auth::id()}}/{{$user->profile_photo}}" alt="profile-image">
                    @endif
                        @error('profile-photo')
                        <p class="error-log">{{$message}}</p>
                        @enderror
                </div>
                <div class="photo-forms">
                    <form action="{{action('ProfileController@update_profile_image', ['id' => $user->id])}}" method="POST" enctype="multipart/form-data" id="change-photo-form">
                        @csrf
                        @method('PUT')
                        <div class="upload-btn">
                            <input type="file" name="profile-photo" id="change-photo" accept="image/*">
                            <button type="button">Nahrať fotku</button>
                        </div>
                    </form>
                    <form action="{{action('ProfileController@delete_profile_image', ['id' => $user->id])}}" method="POST" id="delete-profile-photo">
                        @csrf
                        @method('DELETE')
                        <input type="submit" value="Odstrániť fotku" id="delete-photo" class="button">
                    </form>
                </div>
            </div>
            <div class="col-2">
                <div class="profile-info">
                    <h1>{{$user->name}}</h1>
                    <p>E-mailová adresa: {{$user->email}}</p>
                    <button type="button" id="change-pass">Zmeniť heslo</button>
                    @if(session('error'))
                        <p>{{session('error')}}</p>
                    @endif
                </div>
            </div>
        </div>

        <div class="overlay">
            <div class="change-password">
                <img src="{{asset('images/logo.png')}}" alt="logo">
                <form method="POST" action="{{action('ProfileController@change_password')}}" autocomplete="off">
                    @csrf
                    @method('PATCH')
                    <label for="old-password">Aktuálne heslo</label>
                    <input type="password" name="old-password" id="old-password">
                    @error('old-password')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="new-pass">Nové heslo</label>
                    <input type="password" name="new-pass" id="new-pass">
                    @error('new-pass')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <label for="new-pass-repeat">Zadajte znova nové heslo</label>
                    <input type="password" name="new-pass-repeat" id="new-pass-repeat">
                    @error('new-pass-repeat')
                        <p class="error-log"><small>{{$message}}</small></p>
                    @enderror
                    <input type="submit" value="Zmeniť heslo" class="button" id="change-password">
                </form>
                <button type="button" id="close-change-pass">Zatvoriť</button>
            </div>
        </div>
    </div>

@endsection
