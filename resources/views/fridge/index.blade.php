@extends('layout.app')

@section('content')

    <div class="fridge">
        <h1>Moja chladnička - moje ingrediencie</h1>
        <p id="easy-edit">Evidovanie igrediencií je jednoduché</p>
        <div class="instructions">
            <div class="row">
                <div class="col-3">
                    <i class="fas fa-search"></i>
                    <p>1. Nájdi si ingredienciu</p>
                </div>
                <div class="col-3">
                    <i class="far fa-hand-pointer"></i>
                    <p>2. Klikni na ingredienciu</p>
                </div>
                <div class="col-3">
                    <p id="fridge-ingredient-title">Ingrediencie</p>
                    <p id="available">zelenou farbou sú zaevidované ako dostupné v chladničke</p>
                    <p id="not-available">červenou farbou sú zaevidované ako nedostupné v chladničke</p>
                </div>
            </div>
        </div>
        @if(count($ingredients) > 0)
            <div class="fridge-ingredients animated">
                <div class="search-ingredient">
                    <label for="search-fridge-ingredient">Hľadať ingredienciu</label>
                    <input type="text" id="search-fridge-ingredient" placeholder="paradajky..." autofocus>
                </div>
                @foreach($ingredients as $ingredient)
                    <form action="{{action('FridgeController@update', ['id' => $ingredient->id])}}" method="POST" class="fridge-form">
                        @csrf
                        @method('PUT')
                        <input type="submit" value="{{$ingredient->ingredient}}" class="submit-ingredient @if($ingredient->in_fridge == 0) out-fridge @else in-fridge @endif">
                    </form>
                @endforeach
            </div>
        @else
            <p id="ingredients-not-found">Ingrediencie si môžete evidovať až po pridaní receptu</p>
        @endif
    </div>

@endsection
