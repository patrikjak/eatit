
    <div class="nav">
        <div class="menu-btn">
            <span id="bar1"></span>
            <span id="bar2"></span>
            <span id="bar3"></span>
        </div>
        <div class="row">
            <ul class="left left-more">
                @guest
                    <li><a href="{{url('/')}}#home"><i class="fas fa-home"></i>&nbsp;&nbsp;Domov</a></li>
                    <li><a href="{{url('/')}}#about"><i class="fas fa-book-open"></i>&nbsp;&nbsp;O aplikácii</a></li>
                @else
                    @if(\Illuminate\Support\Facades\Auth::user()->role == 'admin')
                        <li><a href="{{url('/admin')}}"><i class="fas fa-users-cog"></i>&nbsp;&nbsp;Admin</a></li>
                        <li><a href="{{url('/domov')}}"><i class="fas fa-home"></i>&nbsp;&nbsp;Aplikácia</a></li>
                    @else
                        <li><a href="{{url('/domov')}}"><i class="fas fa-home"></i>&nbsp;&nbsp;Domov</a></li>
                        <li><a href="{{url('/recepty/vytvorit')}}"><i class="far fa-edit"></i>&nbsp;&nbsp; Vytvoriť recept</a></li>
                        <li><a href="{{url('/recepty/')}}"><i class="fas fa-search"></i>&nbsp;&nbsp;Vyhľadať recept</a></li>
                        <li><a href="{{url('/sprava')}}"><i class="fas fa-cogs"></i>&nbsp;&nbsp;Spravovať recepty</a></li>
                        <li><a href="{{url('/chladnicka/')}}"><i class="fas fa-door-closed"></i>&nbsp;&nbsp;Moja chladnička</a></li>
                    @endif
                @endguest
            </ul>
            <ul class="right right-less">
                @guest
                    <li><a href="{{route('login')}}"><i class="fas fa-user"></i>&nbsp;&nbsp;Prihlásiť sa</a></li>
                    @if(Route::has('register'))
                        <li><a href="{{route('register')}}"><i class="fas fa-user-plus"></i>&nbsp;&nbsp;Registrovať sa</a></li>
                    @endif
                @else
                    @if(Auth::user()->profile_photo != 'none')
                        <li id="profile-photo"><img src="{{asset('storage/'.Auth::user()->id.'/'.Auth::user()->profile_photo)}}" alt="profile-photo"></li>
                        <li class="user-name" id="user-name-with-img"><a href="{{url('profil/')}}">{{Auth::user() -> name}}</a></li>
                    @else
                        <li class="user-name"><a href="{{url('profil/')}}"><i class="fas fa-user"></i>&nbsp;&nbsp;{{Auth::user() -> name}}</a></li>
                    @endif
                    <li class="logout"><a href="{{route('logout')}}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Odhlásiť sa
                    </a></li>
                    <form id="logout-form" action="{{route('logout')}}" method="POST" style="display: none">
                        @csrf
                    </form>
                @endguest
            </ul>
        </div>
    </div>
