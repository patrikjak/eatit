@extends('layout.app')

@section('content')

    <div class="find-recipe">
        <div class="row">
            <div class="search-panel">
                <h1>Vyhľadajte si recept</h1>
                <p>podľa</p>
                <div class="filter">
                    <div class="row">
                        <div class="col-2">
                            <button id="recipe-title" class="selected">názvu</button>
                        </div>
                        <div class="col-2">
                            <button id="recipe-ingredients">ingrediencií</button>
                        </div>
                    </div>
                    <input type="text" id="search-recipe-title" placeholder="napr. guľáš" autocomplete="off" autofocus>
                </div>
                <p>alebo</p>
                <button type="button" id="choose-random">Vybrať náhodný recept</button>
                <p>alebo vyfiltrujte si kategóriu</p>
                <div class="choose-category">
                    <button id="predjedlo">
                        <img src="{{asset('images/icons/pre-food.svg')}}" alt="fork" class="dark-icon">
                        <img src="{{asset('images/icons/pre-food-white.svg')}}" alt="fork" class="white-icon">
                        Predjedlá
                    </button>
                    <button id="polievka">
                        <img src="{{asset('images/icons/soup.svg')}}" alt="soup" class="dark-icon">
                        <img src="{{asset('images/icons/soup-white.svg')}}" alt="soup" class="white-icon">
                        Polievky
                    </button>
                    <button id="hlavne-jedlo">
                        <img src="{{asset('images/icons/main-dish.svg')}}" alt="meat" class="dark-icon">
                        <img src="{{asset('images/icons/main-dish-white.svg')}}" alt="meat" class="white-icon">
                        Hlavné jedlá
                    </button>
                    <button id="dezert">
                        <img src="{{asset('images/icons/cake.svg')}}" alt="cake" class="dark-icon">
                        <img src="{{asset('images/icons/cake-white.svg')}}" alt="cake" class="white-icon">
                        Dezerty
                    </button>
                </div>
            </div>
            <div class="recipes">
                <div class="overlay animated">
                    <div class="row">
                        <div class="col-2">
                            <div class="exit-btn">
                                <button>Zatvoriť</button>
                            </div>
                        </div>
                        <div class="col-2">
                            <h1>Dobrú chuť !</h1>
                        </div>
                    </div>
                </div>
                @if(count($recipe_infos) > 0)
                    @foreach($recipe_infos as $recipe)
                        <div class="recipe-card animated">
                            <div class="recipe-card-inner">
                                <div class="recipe-card-front">
                                    @if($recipe->photo != 'none')
                                        <a href="{{url('recepty/'.$recipe->id)}}">
                                            <img src="{{url('/')}}/storage/{{\Illuminate\Support\Facades\Auth::id()}}/{{$recipe->photo_cropped}}" alt="{{$recipe->photo}}">
                                        </a>
                                    @else
                                        <a href="{{url('recepty/'.$recipe->id)}}">
                                            <img src="{{asset('images/none-photo.min.jpg')}}" alt="none">
                                        </a>
                                    @endif
                                    <div class="recipe-title">
                                        <h1><a href="{{url('recepty/'.$recipe->id)}}">{{$recipe->title}}</a></h1>
                                    </div>
                                    <p class="recipe-category">{{$recipe->category}}</p>
                                    <button class="show-ingredients-btn">Ukázať ingrediencie</button>
                                </div>
                                <div class="recipe-card-back">
                                    <div class="recipe-ingredients-list">
                                        <ul class="recipe-ingredients">
                                            @foreach($recipe_ingredients as $recipe_ingredient)
                                                @if($recipe->id == $recipe_ingredient->recipe_id)
                                                    <li>{{$recipe_ingredient->ingredient}}</li>
                                                @endif
                                            @endforeach
                                        </ul>
                                    </div>
                                    <button class="show-ingredients-btn" id="back">Späť</button>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <h1 class="recipe-not-found">Nemáte uložené žiadne recepty</h1>
                @endif
            </div>
        </div>
    </div>

@endsection
