@extends('layout.app')

@section('content')

    <div class="recipe">
        <div class="row">
            <div class="col-2">
                @if($recipe->photo != 'none')
                    <div class="image-overlay">
                        <a id="original-photo" href="{{asset('storage/'.\Illuminate\Support\Facades\Auth::id().'/'.$recipe->photo)}}" data-width="{{$image_width}}" data-height="{{$image_height}}">
                            <img src="{{asset('storage/'.\Illuminate\Support\Facades\Auth::id().'/'.$recipe->photo_cropped)}}" alt="{{$recipe->photo_cropped}}" class="recipe-preview-photo">
                        </a>
                        <div class="overlay" id="full-screen-overlay">
                            <img src="{{asset('images/icons/full-screen.svg')}}" alt="full-screen" id="full-screen">
                        </div>
                    </div>
                @else
                     <div class="image-overlay">
                         <img src="{{asset('images/none-photo-square.jpg')}}" alt="none-photo" class="recipe-preview-photo">
                     </div>
                @endif
            </div>
            <div class="overlay animated" id="overlay-with-img">
                <div class="exit-btn">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="col-2">
                <h1>{{$recipe->title}}</h1>
                <p id="description">{{$recipe->description}}</p>
                <div class="line"></div>
                <div class="recipe-info row">
                    <div class="col-4">
                        <div class="info-group">
                            <img src="{{asset('images/icons/folder.svg')}}" alt="category">
                            <h2 class="definition">Kategória</h2>
                            <p>{{$recipe->category}}</p>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="info-group">
                            @switch($recipe->difficulty)
                                @case('ľahká')
                                <img src="{{asset('images/icons/bar-1.svg')}}" alt="difficulty">
                                @break
                                @case('mierne náročná')
                                <img src="{{asset('images/icons/bar-2.svg')}}" alt="difficulty">
                                @break
                                @case('ťažká')
                                <img src="{{asset('images/icons/bar-3.svg')}}" alt="difficulty">
                                @break
                                @default
                                <img src="{{asset('images/icons/bars.svg')}}" alt="difficulty">
                            @endswitch
                                <h2 class="definition">Obťažnosť</h2>
                            <p>{{$recipe->difficulty}}</p>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="info-group">
                            <img src="{{asset('images/icons/stopwatch.svg')}}" alt="time">
                            <h2 class="definition">Čas na prípravu</h2>
                            <p><span id="time">{{$recipe->time}}</span> <span id="time-text">minút</span></p>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="info-group">
                            <img src="{{asset('images/icons/users.svg')}}" alt="portions">
                            <h2 class="definition">Porcie</h2>
                            <p>{{$recipe->portions}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="recipe-2">
        <div class="row">
            <div class="col-2">
                <div class="ingredients">
                    <h1>Ingrediencie</h1>
                    <div class="list-of-ingredients">
                        @foreach($ingredients as $ingredient)
                            <div class="ingredient-group">
                                @if($ingredient->in_fridge == 1)
                                    @if($ingredient->quantity === NULL)
                                        <p class="available">{{$ingredient -> ingredient}}</p>
                                    @else
                                        <p class="available">{{$ingredient -> quantity}}, {{$ingredient -> ingredient}}</p>
                                    @endif
                                    <img src="{{asset('images/icons/good.svg')}}" alt="Dostupné">
                                @else
                                    @if($ingredient->quantity === NULL)
                                        <p class="not-available">{{$ingredient -> ingredient}}</p>
                                    @else
                                        <p class="not-available">{{$ingredient -> quantity}}, {{$ingredient -> ingredient}}</p>
                                    @endif
                                    <img src="{{asset('images/icons/bad.svg')}}" alt="Nedostupné">
                                @endif
                            </div>
                        @endforeach
                    </div>
                    <div class="explanation">
                        <div class="line"></div>
                        <p class="available">Dostupné v chladničke</p>
                        <p class="not-available">Nedostupné v chladničke</p>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="process">
                    <h1>Postup</h1>
                    <p>{{$recipe->process}}</p>
                </div>
                <div class="actions">
                    <div class="row">
                        <div class="col-3">
                            <a href="{{url('recepty/'.$recipe->id.'/editovat')}}" class="button">Editovať recept</a>
                        </div>
                        <div class="col-3">
                            <form action="{{action('RecipeController@destroy', $recipe->id)}}" method="POST" class="delete-confirmation">
                                @method('DELETE')
                                @csrf
                                <input type="submit" value="Zmazať recept">
                            </form>
                        </div>
                        <div class="col-3">
                            <p>Tento recept bol vytvorený {{date('d.m.Y', strtotime($recipe->created_at))}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection
