@extends('layout.app')

@section('content')

    <div class="create">
        <div class="create-form">
            <div class="logo-circle">
                <img src="{{asset('images/logo.png')}}" alt="logo">
            </div>
            <h1>Zmena receptu</h1>
            <form method="post" action="{{action('RecipeController@update', ['id' => $recipe->id])}}" autocomplete="off" id="edit-form" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="tab">
                    <label for="title">Názov receptu</label>
                    @error('title')
                    <p class="error-notification">{{$message}}</p>
                    @enderror
                    <input type="text" name="title" id="title" placeholder="napr. Segedínsky guľáš" class="@error('title') invalid-input @enderror" value="{{$recipe->title}}">
                    <label for="description">Popis receptu</label>
                    <input type="text" name="description" id="description" placeholder="napr. Recept od babičky" value="{{$recipe->description}}">
                </div>
                <div class="tab" id="second-tab">
                    <div class="col-3">
                        <h2>Kategória</h2>
                        <div class="radio">
                            <input id="radio-1" name="category" type="radio" value="predjedlo" @if($recipe->category == 'predjedlo') checked @endif>
                            <label for="radio-1" class="radio-label">Predjedlo</label>
                        </div>
                        <div class="radio">
                            <input id="radio-2" name="category" type="radio" value="polievka" @if($recipe->category == 'polievka') checked @endif>
                            <label for="radio-2" class="radio-label">Polievka</label>
                        </div>
                        <div class="radio">
                            <input id="radio-3" name="category" type="radio" value="hlavné jedlo" @if($recipe->category == 'hlavné jedlo') checked @endif >
                            <label for="radio-3" class="radio-label">Hlavné jedlo</label>
                        </div>
                        <div class="radio">
                            <input id="radio-4" name="category" type="radio" value="dezert" @if($recipe->category == 'dezert') checked @endif>
                            <label for="radio-4" class="radio-label">Dezert</label>
                        </div>
                    </div>
                    <div class="col-3">
                        <h2>Obtiažnosť</h2>
                        <div class="radio">
                            <input id="radio-5" name="difficulty" type="radio" value="ľahká" @if($recipe->difficulty == 'ľahká') checked @endif>
                            <label for="radio-5" class="radio-label">Ľahká</label>
                        </div>
                        <div class="radio">
                            <input id="radio-6" name="difficulty" type="radio" value="mierne náročná" @if($recipe->difficulty == 'mierne náročná') checked @endif>
                            <label for="radio-6" class="radio-label">Mierne náročná</label>
                        </div>
                        <div class="radio">
                            <input id="radio-7" name="difficulty" type="radio" value="ťažká" @if($recipe->difficulty == 'ťažká') checked @endif>
                            <label for="radio-7" class="radio-label">Ťažká</label>
                        </div>
                    </div>
                    <div class="col-3">
                        <h2 id="upload-photo-h">Pridať alebo zmeniť fotku jedla</h2>
                        @error('photo')
                        <p class="error-notification">{{$message}}</p>
                        @enderror
                        <div class="upload-btn">
                            <input type="file" name="photo" id="recipe-photo" accept="image/*">
                            <button type="button">Nahrať fotku</button>
                        </div>
                    </div>
                </div>
                <div class="tab" id="third-tab">
                    <div class="row">
                        <div class="col-2">
                            <label for="time" class="circle-label">Čas na prípravu (v minútach)</label>
                            <div class="circle">
                                <input type="text" name="time" id="time" placeholder="napr. 35" value="{{$recipe->time}}">
                            </div>
                            @error('time')
                            <p class="error-notification time-err">{{$message}}</p>
                            @enderror
                        </div>
                        <div class="col-2">
                            <label for="portions" class="circle-label">Porcie</label>
                            <div class="circle">
                                <input type="text" name="portions" id="portions" placeholder="napr. 4" value="{{$recipe->portions}}">
                            </div>
                            @error('portions')
                            <p class="error-notification portions-err">{{$message}}</p>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="tab" id="create-ingredients">
                <div class="row">
                        <div class="col-2">
                            <label for="ingredient">Ingrediencia</label>
                            @error('ingredient')
                            <p class="error-notification">{{$message}}</p>
                            @enderror
                            <input type="text" id="ingredient" placeholder="napr. kapusta" class="@error('ingredient') invalid-input @enderror">
                            <label for="quantity">Množstvo</label>
                            <input type="text" id="quantity" placeholder="napr. 500g" class="@error('quantity') invalid-input @enderror">
                            <button type="button" id="add-ingredient-edit"><i class="fas fa-plus"></i> Pridať</button>
                        </div>
                        <div class="col-2">
                            <div class="ingredient-list">
                                <p id="list-info">Máte tu:</p>
                                <table id="ingredient-list-table">
                                    @foreach($ingredients as $ingredient)
                                        <tr>
                                            @if($ingredient->quantity == NULL)
                                                <td class="ingredient"><span class="quantity-text" style="display: none">{{$ingredient->quantity}}</span><span class="ingredient-text">{{$ingredient->ingredient}}</span></td>
                                            @else
                                                <td class="ingredient"><span class="quantity-text">{{$ingredient->quantity}}</span>, <span class="ingredient-text">{{$ingredient->ingredient}}</span></td>
                                            @endif
                                            <td style="display: none" id="ingredient-availability">{{$ingredient->in_fridge}}</td>
                                            <td class="edit-button"><a class="edit-ingredient">Zmeniť</a></td>
                                            <td class="delete-button"><a class="delete-ingredient">Zmazať</a></td>
                                        </tr>
                                    @endforeach
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab" id="create-process">
                    <label for="process">Postup</label>
                    @error('process')
                    <p class="error-notification">{{$message}}</p>
                    @enderror
                    <textarea id="process" name="process" placeholder="Do hrnca nalejeme vodu...." rows="12" class="@error('process') invalid-input @enderror">{{$recipe->process}}</textarea>
                </div>
            </form>
            <div class="navigation">
                <button type="button" id="prevBtn"><i class="fas fa-chevron-left"></i>&nbsp;Späť</button>
                <button type="button" id="nextBtn">Ďalej&nbsp;<i class="fas fa-chevron-right"></i></button>
            </div>
            <div class="indicators">
                <div class="row">
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                </div>
            </div>
        </div>
    </div>
@endsection
