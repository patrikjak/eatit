(function ($) {

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var win = $(window);

    win.on('load', function () {
       $('#loader-overlay').fadeOut(500);
    });

    /*
    * smooth scrolling from homepage
    */

    $('.menu-btn').on('click', function () {
        $(this).toggleClass('open');
        $(this).find('span').toggleClass('open');
        $(this).parent().find('.row').toggleClass('open');
    });

    $('.nav').find('li a').on('click', function (event) {
        var href = $(this).attr('href');
        if ($('#home').length) {
            if (href.indexOf('#') > -1) {
                event.preventDefault();
                var id = this.hash,
                offset = $(id).offset().top;
                $('html, body').animate({
                    scrollTop: offset
                }, 1000);
            }
        }
    });

    $('#about-btn').on('click', function () {
        var href = $(this).attr('href');
        if ($('#home').length) {
            if (href.indexOf('#') > -1) {
                event.preventDefault();
                var id = this.hash,
                    offset = $(id).offset().top;
                $('html, body').animate({
                    scrollTop: offset
                }, 1000);
            }
        }
    });

    /*
    * start 'pulsing' animation on hover on card
    */

    var card = $('.card');

    card.on('mouseover', function () {
        card.css({
            'transform': 'scale(.9,.9)',
            'opacity': '.5'
        });
        var currentCard = $(this);
        currentCard.css({
            'transform': 'scale(1.1,1.1)',
            'opacity' : '1'
        });
        currentCard.find('i').css({
            '-webkit-animation-play-state': 'running',
            'animation-play-state': 'running'
        });
    });
    card.on('mouseout', function () {
        card.css({
            'transform': 'scale(1,1)',
            'opacity': '1'
        });
        card.find('i').css({
            '-webkit-animation-play-state': 'paused',
            'animation-play-state': 'paused'
        })
    });

    var statusBar = $('.status-bar');

    if (statusBar.length) {
        setTimeout(function () {
            statusBar.fadeOut(1000);
        }, 5000);
    }

    /* check for this functionality */

    $('.close-btn').on('click', function () {
        var notification = $(this).parent();
        notification.fadeOut(500);
    });

    /*
    * add background color if image is selected
    * */

    $('#recipe-photo').on('change', function () {
        if ($('#recipe-photo').get(0).files.length === 0) {
            console.log("No files selected.");
        }
        else {
            $('.upload-btn button').addClass('uploaded');
        }
    });

    /*
    * create new hidden inputs -> ingredient and quantity
    * inputs must be filled
    * clear and focus on first input
    * */

    function addIngredient() {
        var ingredient = $('#ingredient'),
            quantity   = $('#quantity'),
            ingredientListItem;
        if (ingredient.val() === '' || quantity.val() === '') {
            $('#list-info').text('Je potrebné zadať ingredienciu a množstvo');
        }
        else {
            $('#list-info').text('Zatiaľ tu máte:');
            ingredientListItem = $('<p></p>').text(quantity.val()+", "+ingredient.val());
            $('.ingredient-list').append(ingredientListItem);
            $('<input>').attr({
                type: 'hidden',
                name: 'ingredient[]',
                value: ingredient.val()
            }).appendTo($('#create-ingredients'));
            $('<input>').attr({
                type: 'hidden',
                name: 'quantity[]',
                value: quantity.val()
            }).appendTo($('#create-ingredients'));
            ingredient.val('');
            quantity.val('');
            ingredient.focus();
        }
    }


    $('#add-ingredient').on('click', function () {
        addIngredient();
    });

    /*
    * make hidden inputs
    * get all ingredients, quantity and availability from ingredient list
    * */

    function ingredients() {
        $('.ingredient-list table .ingredient-text').each(function () {
            $('<input>').attr({
                type: 'hidden',
                name: 'ingredient[]',
                value: $(this).text()
            }).appendTo($('#create-ingredients'));
        });
        $('.ingredient-list table .quantity-text').each(function () {
            $('<input>').attr({
                type: 'hidden',
                name: 'quantity[]',
                value: $(this).text()
            }).appendTo($('#create-ingredients'));
        });
        $('.ingredient-list table #ingredient-availability').each(function () {
            var availability;
            if ($(this).text() === '1') {
                availability = 1;
            }
            else {
                availability = 0;
            }
            $('<input>').attr({
                type: 'hidden',
                name: 'availability[]',
                value: availability
            }).appendTo($('#create-ingredients'));
        });
    }

    var quantity_el, ingredient_el;
    var changingIngredient = false;
    var editIngredientBtn = $('#add-ingredient-edit');

    /*
    * change add button to edit button
    * get actual values to inputs -> ingredient and quantity
    * */

    $('.ingredient-list table').on('click', '.edit-ingredient', function () {
        editIngredientBtn.html('<i class="far fa-edit"></i> Zmeniť');
        quantity_el = $(this).parent().parent().find('td .quantity-text');
        ingredient_el = $(this).parent().parent().find('td .ingredient-text');
        $('#quantity').val(quantity_el.text());
        $('#ingredient').val(ingredient_el.text());
        changingIngredient = true;
    });

    /*
    * delete ingredient from list
    * */

    $('.ingredient-list table .delete-ingredient').on('click', function () {
        $(this).parent().parent().remove();
    });

    /*
    * changing ingredient or adding new
    * after editing, change edit button to add button
    * add new ingredient to ingredient list
    * inputs must be filled
    * */

    editIngredientBtn.on('click', function () {
        var quantity   = $('#quantity'),
            ingredient = $('#ingredient');
        if (changingIngredient) {
            if (ingredient.val() === '' || quantity.val() === '') {
                $('#list-info').text('Je potrebné zadať ingredienciu a množstvo');
            }
            else  {
                var newQuantity = quantity.val(),
                    newIngredient = ingredient.val();
                quantity_el.text(newQuantity);
                ingredient_el.text(newIngredient);
                quantity.val('');
                ingredient.val('');
                ingredient.focus();
                $(this).html('<i class="fas fa-plus"></i> Pridať');
                changingIngredient = false;
            }
        }
        else {
            if (ingredient.val() === '' || quantity.val() === '') {
                $('#list-info').text('Je potrebné zadať ingredienciu a množstvo');
            }
            else  {
                var ingredientListItem;
                ingredientListItem = $('<tr><td class="ingredient"><span class="quantity-text">'+quantity.val()+'</span>'+', '+'<span class="ingredient-text">'+ingredient.val()+'</span></td><td class="edit-button"><a class="edit-ingredient">Zmeniť</a></td><td class="delete-button"><a class="delete-ingredient">Zmazať</a></td></tr>');
                $('#ingredient-list-table').append(ingredientListItem);
                quantity.val('');
                ingredient.val('');
                ingredient.focus();
            }
        }
    });


    var num = 0,
        nextBtn = document.getElementById('nextBtn'),
        prevBtn = document.getElementById('prevBtn');

    var regNumber = new RegExp('\[0-9]\/editovat');
    var formId, submitForm;

    /*
    * start script only on create page or edit page
    * from edit form do not submit form */

    if (window.location.pathname === '/eatit/public/recepty/vytvorit' || regNumber.exec(window.location.pathname)) {
        showTab(num);
        if (regNumber.exec(window.location.pathname)) {
            formId = 'edit-form';
            submitForm = false;
        }
        else {
            formId = 'create-form';
            submitForm = true;
        }
    }

    /*
    * send arguments to function
    * */

    $('#nextBtn').click(function () {
        nextPrev(1);
    });
    $('#prevBtn').click(function () {
        nextPrev(-1);
    });

    /*
    * show tab
    * change next button to save button on last tab
    * */

    function showTab(number) {
        var tabs = document.getElementsByClassName('tab');
        tabs[number].style.display = 'block';
        if (number === 0) {
            prevBtn.style.display = 'none';
        }
        else {
            prevBtn.style.display = 'inline-block';
        }
        if (number === (tabs.length -1)) {
            nextBtn.innerHTML = 'Uložiť&nbsp;&nbsp;<i class="fas fa-save"></i>';
            nextBtn.id = 'saveBtn';
        }
        else {
            nextBtn.innerHTML = 'Ďalej&nbsp;<i class="fas fa-chevron-right"></i>';
            nextBtn.id = 'nextBtn';
        }
        indicators(number);
    }

    /*
    * mark indicator as finished
    * creating form -> submit form after clicking on save button
    * editing form -> submit form after ingredients and quantity inputs are created
    * */

    function nextPrev(number) {
        var tabs = document.getElementsByClassName('tab');
        document.getElementsByClassName('step')[num].className += ' finished';
        if (num === (tabs.length - 1) && number === 1) {
            tabs[num].style.display = 'block';
        }
        else {
            tabs[num].style.display = 'none';
        }
        num = num + number;
        if (num >= document.getElementsByClassName('tab').length) {
            if (submitForm) {
                document.getElementById(formId).submit();
                return false;
            }
            else {
                ingredients();
                document.getElementById(formId).submit();
                return false;
            }
        }
        else {
            showTab(num);
        }
    }

    /*
    * set indicator to active
    * */

    function indicators(number) {
        var i,
            indicators = document.getElementsByClassName('step');
        for (i = 0; i < indicators.length; i++) {
            indicators[i].className = indicators[i].className.replace(' active', '');
        }
        indicators[number].className += ' active';
    }

    var recipeCard = $('.recipe-card');

    /*
    * Accents remover (https://gist.github.com/alisterlf/3490957)
    * */

    function RemoveAccents(strAccents) {
        var strAccents = strAccents.split('');
        var strAccentsOut = new Array();
        var strAccentsLen = strAccents.length;
        var accents = 'ÀÁÂÃÄÅĄàáâãäåąßÒÓÔÕÕÖØŐòóôőõöøĎďDŽdžÈÉÊËĘèéêëęðÇçČčĆćÐÌÍÎÏìíîïÙÚÛÜŰùűúûüĽĹŁľĺłÑŇŃňñńŔŕŠŚšśŤťŸÝÿýŽŻŹžżź';
        var accentsOut = "AAAAAAAaaaaaaasOOOOOOOOoooooooDdDZdzEEEEEeeeeeeCcCcCcDIIIIiiiiUUUUUuuuuuLLLlllNNNnnnRrSSssTtYYyyZZZzzz";
        for (var y = 0; y < strAccentsLen; y++) {
            if (accents.indexOf(strAccents[y]) != -1) {
                strAccentsOut[y] = accentsOut.substr(accents.indexOf(strAccents[y]), 1);
            } else
                strAccentsOut[y] = strAccents[y];
        }
        strAccentsOut = strAccentsOut.join('');
        return strAccentsOut;
    }

    /*
    * recipe filter with removed accents
    * */

    var filter = $('.filter'),
        filterValue = 'recipe-title';

    var chooseButtons = $('.choose-category button'),
        categoryFilter;

    filter.find('button').on('click', function () {
        var selected = $(this).attr('id');
        var input = filter.find('input');
        input.attr('id', 'search-'+selected);
        filterValue = selected;
        input.focus();
        if (selected === 'recipe-title') {
            input.attr('placeholder', 'napr. guľáš');
            $('#recipe-ingredients').removeClass('selected');
            $('#recipe-title').addClass('selected');
        }
        else {
            input.attr('placeholder', 'napr. kuracie mäso');
            $('#recipe-title').removeClass('selected');
            $('#recipe-ingredients').addClass('selected');
        }
    });

    $('#search-'+filterValue).on('keyup', function () {
        var inputValue = RemoveAccents($(this).val().toLowerCase());
        chooseButtons.removeClass('active');
        chooseButtons.find('.white-icon').css('display', 'none');
        chooseButtons.find('.dark-icon').css('display', 'block');
        if (filterValue === 'recipe-title') {
            $('.recipe-card .recipe-title').filter(function () {
                $(this).parent().parent().parent().toggle(RemoveAccents($(this).text().toLowerCase()).indexOf(inputValue) > -1, 500);
            });
        }
        else {
            $(".recipe-card .recipe-ingredients").filter(function() {
                $(this).parent().parent().parent().parent().toggle(RemoveAccents($(this).text().toLowerCase()).indexOf(inputValue) > -1, 500);
            });
        }
        showNotFoundMessage();
    });

    /*
    * show information about not found recipes
    * */

    function showNotFoundMessage() {
        var allRecipesArray = [],
            stylesArray = [];

        recipeCard.each(function (index) {
            allRecipesArray[index] = $(this);
        });

        for (var i = 0; i < allRecipesArray.length; i++) {
            stylesArray[i] = allRecipesArray[i].css('display');
        }

        if (!stylesArray.includes('block')) {
            if (!$('.recipes').find('.recipe-not-found').length) {
                $('.recipes').append('<h1 class="recipe-not-found">Nenašiel sa žiaden recept</h1>');
            }

        }
        else {
            $('.recipes').find('.recipe-not-found').remove().fadeOut(500);
        }
        return stylesArray.length;
    }


    /*
    * choose random recipe and show in overlay
    * */

    $('#choose-random').on('click', function () {
        showNotFoundMessage();
        if (showNotFoundMessage() === 0) {
            $('.recipes').find('.recipe-not-found').text('Najprv si vytvorte recept');
        }
        else {
            var random = Math.floor(Math.random() * recipeCard.length);
            var randomRecipe = recipeCard.eq(random);
            var clonedRecipe = randomRecipe.clone();
            chooseButtons.removeClass('active');
            chooseButtons.find('.white-icon').css('display', 'none');
            chooseButtons.find('.dark-icon').css('display', 'block');
            clonedRecipe.attr('id', 'random-recipe');
            clonedRecipe.css('display', 'block');
            $('.recipe-card').css('display', 'block');
            clonedRecipe.prependTo($('.recipes .overlay .col-2:first-child'));
            $('.recipes .overlay').fadeIn(500).removeClass('bounceOutRight').addClass('bounceInLeft');
        }
    });

    /*
    * close overlay
    * */

    $('.recipes .overlay').find('.exit-btn').on('click', function () {
        $(this).parent().find('#random-recipe').remove();
        $('.recipes').find('.overlay').removeClass('bounceInLeft').addClass('bounceOutRight').fadeOut(500);
    });

    /*
    * flip recipe card
    * delegated - cloned recipe card
    * */

    $(document).on('click', '.show-ingredients-btn', function () {
        $(this).parent().parent().toggleClass('flipped');
    });

    /*
    * set button to active
    * if button is active, set this button to inactive
    * find activated button id -> categoryFilter
    * if active button id is 'hlavne-jedla', set this value to lowercase category name
    * if non of these button is active, categoryFilter is undefined, set value to '' to search all categories
    *
    * !! check buttons id with category name !!
    *
    */

    chooseButtons.on('click', function () {
        $('#search-'+filterValue).val('');
        chooseButtons.find('.white-icon').css('display', 'none');
        chooseButtons.find('.dark-icon').css('display', 'block');
        if (!$(this).hasClass('active')) {
            chooseButtons.removeClass('active');
            $(this).addClass('active');
            $(this).find('.dark-icon').css('display', 'none');
            $(this).find('.white-icon').css('display', 'block');
        }
        else if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $(this).find('.white-icon').css('display', 'none');
            $(this).find('.dark-icon').css('display', 'block');
        }
        categoryFilter = $(this).parent().find('.active').attr('id');
        if (categoryFilter === 'hlavne-jedlo') categoryFilter = 'hlavné jedlo';
        else if (categoryFilter === undefined) categoryFilter = '';
        $('.recipe-card .recipe-category').filter(function () {
            $(this).parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(categoryFilter) > -1);
        });
        showNotFoundMessage();
    });


    /*
    * slovak language
    * minutes and portions correction
    * */

    var minutes = parseFloat($('#time').text()),
        minutesText = $('#time-text');

    if (minutes === 1) minutesText.text('minúta');
    else if (minutes >= 2 && minutes <= 4) minutesText.text('minúty');
    else minutesText.text('minút');

    /*
    * show original recipe photo on overlay
    * */

    $('.image-overlay').on('click', function (event) {
        var recipeOverlay = $('.recipe #overlay-with-img');
        event.preventDefault();
        var width = $(this).find('a').attr('data-width'),
            height = $(this).find('a').attr('data-height'),
            orientationClass;
        if (width > height) {
            orientationClass = 'landscape'
        }
        else if (width < height) {
            orientationClass = 'portrait'
        }
        else {
            orientationClass = 'square'
        }
        var newImage = $('<img>', {
            src: $(this).find('a').attr('href'),
            alt: 'Fotka receptu',
            class: orientationClass
        });
        newImage.prependTo(recipeOverlay);
        recipeOverlay.fadeIn(500).removeClass('zoomOut').addClass('zoomIn');
    });

    /*
    * hide overlay with image
    * */

    $('.recipe .overlay i').on('click', function () {
        $(this).parent().parent().find('img').remove();
        $('.recipe #overlay-with-img').removeClass('zoomIn').addClass('zoomOut').fadeOut(500);
    });

    /*
    * search recipe - manage
    * */

    $('#recipe-name-search').on('keyup', function () {
        var inputValue = RemoveAccents($(this).val().toLowerCase());
        console.log(inputValue);
        $('.recipe-name').filter(function () {
            $(this).parent().toggle(RemoveAccents($(this).find('a').text().toLowerCase()).indexOf(inputValue) > -1, 500);
        });
    });


    /*
    * delete confirmation
    * delete recipe
    * ajax
    * */

    $('.delete-confirm').on('submit', function (event) {
        var confirmation = confirm('Naozaj chcete recept vymazať ?');
        if (confirmation === true) {
            event.preventDefault();
            var tr = $(this).parent().parent();
            $.ajax({
                url: $(this).attr('action'),
                type: 'DELETE',
                dataType: "JSON",
                data: $(this).serialize(),
                success: function () {
                    tr.fadeOut(1000, function () {
                        $(this).remove();
                        var recipesCountEl = $('.manage-page-card').find('span');
                        var recipesCountNum = recipesCountEl.text();
                        parseInt(recipesCountNum);
                        recipesCountNum--;
                        recipesCountEl.text(recipesCountNum);
                    });
                },
                error: function () {
                    tr.find('.recipe-name a').text("Nepodarilo sa vymazať, skúste to znova");
                }
            });
        }
        else event.preventDefault();
    });

    /*
    * not ajax request
    * */

    $('.delete-confirmation').on('click', function (event) {
        var confirmation = confirm('Naozaj chcete recept vymazať ?');
        if (confirmation === true) $(this).submit();
        else event.preventDefault();
    });

    /*
    * fridge ingredient filter
    * */

    $('#search-fridge-ingredient').on('keyup', function () {
        var inputValue = RemoveAccents($(this).val().toLowerCase());
        $('.fridge-form').find('.submit-ingredient').filter(function () {
            $(this).parent().toggle(RemoveAccents($(this).val().toLowerCase()).indexOf(inputValue) > -1, 500);
        });
    });

    /*
    * show only one ingredient when this ingredient is showed more times
    * show all ingredients after all duplicates are hidden
    * */

    setTimeout(function () {
        $('.fridge-ingredients').fadeIn(1000).addClass('zoomIn');
    }, 500);

    var allIngredients = $('.fridge-ingredients').find('.submit-ingredient');

    var ingredientsArray = [],
        duplicates = [];

    allIngredients.each(function (index) {
        ingredientsArray[index] = $(this);
    });

    ingredientsArray.sort();

    for (var i = 0; i < ingredientsArray.length - 1; i++) {
        if (ingredientsArray[i+1].val() === ingredientsArray[i].val()) {
            duplicates.push(ingredientsArray[i]);
        }
    }

    for (var i = 0; i < duplicates.length; i++) {
        duplicates[i].fadeOut(10);
    }


    /*
    * change in_fridge status in database
    * */

    $('.fridge-form').on('submit', function (e) {
        var submitButton = $(this).find('input[type="submit"]'),
            fridgeIngredients = $('.fridge-form input[type="submit"]'),
            sameIngredients = [];
        fridgeIngredients.each(function (index) {
            if ($(this).val() === submitButton.val()) {
                sameIngredients[index] = $(this);
            }
        });
        e.preventDefault();
        $.ajax({
            url: $(this).attr('action'),
            type: 'PUT',
            dataType: 'JSON',
            data: $(this).serialize(),
            success: function (response) {
                if (response.status === 1) {
                    sameIngredients.forEach(function (value) {
                        value.removeClass('out-fridge');
                        value.addClass('in-fridge');
                    });
                }
                else if (response.status === 0) {
                    sameIngredients.forEach(function (value) {
                        value.removeClass('in-fridge');
                        value.addClass('out-fridge');
                    });
                }
            },
            error: function () {
                // do something with error
                console.log('fuck');
            }
        });
    });


    /*
    * upload photo after select
    * */

    $('#change-photo').on('change', function () {
        $('#change-photo-form').submit();
    });

    /*
    * show and close change password form
    * */

    $('#change-pass').on('click', function () {
        $('.profile .overlay').fadeIn(500);
        $('.profile .change-password').fadeIn(500).removeClass('animated zoomOutLeft').addClass('animated zoomInRight');
    });

    function closeForm () {
        $('.profile .change-password').removeClass('animated zoomInRight').addClass('animated zoomOutLeft').fadeOut(500);
        $('.profile .overlay').fadeOut(500);
    }

    $('#close-change-pass').on('click', function() {
        closeForm();
    });

    /*
    * change password
    * */

    $('#change-password').on('click', function (event) {
        event.preventDefault();
        $.ajax({
           url: $(this).parent().attr('action'),
           type: 'PATCH',
           dataType: 'JSON',
           data: $(this).parent().serialize(),
           success: function (response) {
                if (response.message) {
                    $('.profile .overlay form').fadeOut(500);
                    $('.change-password').find('img').delay(2000).after('<p id="password-message">'+response.message+'</p>');
                    setTimeout(function () {
                        closeForm();
                    }, 3000);
                }
                else {
                    if ($('.error-log').length) {
                        $('.error-log').fadeOut(500);
                    }
                    $('#' + response.input).after('<p class="error-log"><small>'+ response.error + '</small></p>');
                }
           },
            error: function (response) {
                if (response.status === 422) {
                    if ($('.error-log').length) {
                        $('.error-log').fadeOut(500);
                    }
                    var errors = $.parseJSON(response.responseText);
                    $.each(errors, function (key, value) {
                        if ($.isPlainObject(value)) {
                            $.each(value, function (key, value) {
                                value.forEach(function (currentValue) {
                                    $('#'+key).after('<p class="error-log"><small>'+ currentValue +'</small></p>');
                                });
                            });
                        }
                    });
                }
                else {
                    $('.profile .overlay form').fadeOut(500);
                    $('.change-password').find('img').delay(2000).after('<p id="password-message">Niekde nastala chyba<br>Skúste to znova</p>');
                    setTimeout(function () {
                        closeForm();
                    }, 3000);
                }
            }
        });
    });



}(jQuery));
