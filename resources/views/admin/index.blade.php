@extends('layout.app')

@section('content')

    <div class="admin">
        <div class="row">
            <div class="col-2">
                @include('_inc.admin-panel')
            </div>
            <div class="col-2">
                <h1>Základné informácie</h1>
                <div class="information">
                    <div class="row">
                        <div class="col-3">
                            <div class="admin-card">
                                <h1>Počet všetkých používateľov</h1>
                                <i class="fas fa-users"></i>
                                <p class="bigger-text">{{$users_count}}</p>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="admin-card">
                                <h1>Posledný traja používatelia</h1>
                                <i class="fas fa-user-plus"></i>
                                <div class="user-group">
                                    @foreach($last_users as $user)
                                        <p>{{$user->name}}</p>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="admin-card">
                                <h1>Počet všetkých receptov</h1>
                                <i class="fas fa-utensils"></i>
                                <p class="bigger-text">{{$recipes_count}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
