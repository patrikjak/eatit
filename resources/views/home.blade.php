@extends('layout.app')

@section('content')

    <div class="dashboard">
        <div class="row">
            <div class="card" id="create">
                <h1>Vytvoriť<br>recept</h1>
                <i class="far fa-edit"></i>
                <a href="{{url('/recepty/vytvorit')}}" class="button">Vytvoriť</a>
            </div>
            <div class="card" id="search">
                <h1>Vyhľadať<br>recept</h1>
                <i class="fas fa-search"></i>
                <a href="{{url('recepty/')}}" class="button">Vyhľadať</a>
            </div>
            <div class="card" id="manage">
                <h1>Spravovať<br>recepty</h1>
                <i class="fas fa-cogs"></i>
                <a href="{{url('sprava')}}" class="button">Spravovať</a>
            </div>
            <div class="card" id="fridge">
                <h1>Moja<br>chladnička</h1>
                <i class="fas fa-door-closed"></i>
                <a href="{{url('chladnicka/')}}" class="button">Otvoriť</a>
            </div>
            <div class="card" id="fridge">
                <h1>Všetky<br>recepty</h1>
                <i class="fas fa-door-closed"></i>
                <a href="{{url('verejne/')}}" class="button">Otvoriť</a>
            </div>
        </div>
    </div>


@endsection
