@extends('layout.app')

@section('content')

    <div id="manage-page">
        <h1>Správa receptov</h1>
        <div class="row">
            <div class="col-2">
                <div class="manage-page-card">
                    <label for="recipe-name-search">Vyhľadaj si recept, ktorý chcete editovať alebo zmazať</label>
                    <input type="text" id="recipe-name-search" placeholder="napr. Guľáš" autofocus>
                </div>
            </div>
            <div class="col-2">
                <div class="manage-page-card">
                    <p>Celkový počet receptov</p>
                    <p><span>{{count($recipes)}}</span></p>
                </div>
            </div>
        </div>
        <table>
            <thead>
            <tr>
                <th id="recipe-name">Názov receptu</th>
                <th id="recipe-edit"></th>
                <th id="recipe-delete"></th>
            </tr>
            </thead>
            <tbody>
            @if(count($recipes) > 0)
                @foreach($recipes as $recipe)
                    <tr>
                        <td class="recipe-name"><a href="{{url('recepty/'.$recipe->id)}}">{{$recipe->title}}</a></td>
                        <td class="recipe-edit"><a href="{{url('recepty/'.$recipe->id.'/editovat')}}">Editovať</a></td>
                        <td class="recipe-delete">
                            <form action="{{action('RecipeController@destroy', $recipe->id)}}" method="POST" class="delete-confirm">
                                @method('DELETE')
                                @csrf
                                <input type="submit" value="Zmazať">
                            </form>
                        </td>
                    </tr>
                @endforeach
            @else
                <tr>
                    <td class="recipe-name">Zatiaľ nemáte uložený žiaden recept</td>
                </tr>
            @endif
            </tbody>
        </table>
    </div>

@endsection
