<!DOCTYPE html>
<html lang="sk">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>EATIT | @yield('title')</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,700&display=swap" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-image: url("/eatit/public/images/error.jpg");
                background-size: cover;
                color: #626d71;
                font-family: 'Rubik', sans-serif;
                font-weight: 300;
                height: 100vh;
                margin: 0;
                padding: 0;
            }
            .error {
                width: 50%;
                text-align: center;
                float: left;
            }
            .error h1 {
                font-size: 100px;
                font-weight: 300;
                margin-top: 20%;
            }
            .error h2 {
                font-size: 35px;
            }
            .error a {
                display: inline-block;
                margin-top: 20%;
                color: #ffffff;
                text-decoration: none;
                font-size: 23px;
                padding: 2% 5%;
                background-color: #b38867;
                border-radius: 50px;
                transition-duration: .5s;
            }
            .error a:hover {
                transform: translateY(-5px);
            }
            @media only screen and (max-width: 575.98px) {
                html, body {
                    background-image: url("eatit/public/images/mobile/error-mobile.jpg");
                    background-size: contain;
                }
                .error {
                    width: 100%;
                    float: none;
                }
                .error h1 {
                    font-size: 70px;
                }
                .error h2 {
                    font-size: 25px;
                    margin: 3% 5%;
                }
                .error a {
                    font-size: 16px;
                    padding: 3% 5%;
                }
            }
        </style>
    </head>
    <body>
        <div class="error">
            <h1>Error @yield('code')</h1>
            <h2 style="font-weight: 300;">Prepáčte, @yield('message') :(</h2>
            @if(\Illuminate\Support\Facades\Auth::check())
                <a href="{{url('/domov')}}">Vrátiť sa na domovskú stránku</a>
            @else
                <a href="{{url('/')}}">Vrátiť sa na domovskú stránku</a>
            @endif
        </div>
    </body>
</html>
