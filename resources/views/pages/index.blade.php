@extends('layout.app')

@section('content')

    <div class="home" id="home">
        <div class="row">
            <div class="left">
                <img src="{{asset('images/logo-border.png')}}" alt="logo">
                <p>Pridaj a nájdi svoj chutný recept</p>
                <div class="log-buttons">
                    <a href="{{route('register')}}"><i class="fas fa-user-plus"></i>&nbsp;&nbsp;Registrovať sa</a>
                    <a href="{{route('login')}}"><i class="fas fa-user"></i>&nbsp;&nbsp;Prihlásiť sa</a>
                </div>
            </div>
            <div class="right">
                <a class="button" href="#about" id="about-btn"><i class="fas fa-arrow-down"></i>&nbsp;&nbsp;Čítaj viac</a>
            </div>
        </div>
    </div>
    <div class="about" id="about">
        <div class="row">
            <div class="col-2">
                <h1>Si hladný ?</h1>
                <p>a nevieš čo jesť ?</p>
                <p>Zaregistruj sa, prihlás sa a jedz</p>
            </div>
            <div class="col-2">
                <img src="{{asset('images/chef.svg')}}" alt="kuchar">
            </div>
        </div>
    </div>
    <div class="how-to-use">
        <div class="row" id="create-recipe">
            <div class="col-2">
                <img src="{{asset('images/create_recipe.svg')}}" alt="vytvoriť recept">
            </div>
            <div class="col-2">
                <p>Na vytvorenie receptu stačí</p>
                <p><span>5 krokov</span></p>
                <p>Zadaj názov, fotku, ingrediencie a postup</p>
                <p>a tvoj recept je hotový</p>
            </div>
        </div>
        <div class="row" id="search-recipe">
            <div class="col-2">
                <p>Vyhľadaj si jeden zo svojich receptov</p>
                <p>pomocou</p>
                <p><span>názvu</span></p>
                <p><span>ingrediencií</span></p>
                <p><span>kategórie</span></p>
                <p><span>alebo vyber si náhodný recept</span></p>
            </div>
            <div class="col-2">
                <img src="{{asset('images/search_recipe.svg')}}" alt="vyhľadávať">
            </div>
        </div>
        <div class="row" id="fridge-index">
            <div class="col-2">
                <img src="{{asset('images/fridge.svg')}}" alt="chladnička">
            </div>
            <div class="col-2">
                <p><span>Zisti aké suroviny máš doma</span></p>
                <p>stačí si evidovať ingrediencie</p>
                <p>a pri recepte hneď uvidíš čo ti chýba</p>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy;EATIT | by Patrik Jakab</p>
    </div>


@endsection
