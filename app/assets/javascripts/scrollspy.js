var current_position = '';

$('#spy-element').on('scroll', function () {
    var activeSection = $("#spy-side").find("li.active a").text();

    if( current_position != activeSection ){
        //do something here

        current_position = activeSection;
    }

});