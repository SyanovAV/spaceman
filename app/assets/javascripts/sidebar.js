$(document).ready(function() {
    $("#sidebarCollapse").on("click", function() {
        $("#sidebar").toggleClass("active");
        $(this).toggleClass("active");
    });

    $("#collapseCollection").on("click", function() {
        // $("#sidebar").toggleClass("active");
        $(this).toggleClass("collapsed");
    });

    $( ".sidenav-two" ).on("click", function() {
        $(this).toggleClass("open");

    });

    if ($( "ul.dropdown-menu.dropdown-custom" ).hasClass("show", function() {
        $("#sidebar-edit").toggleClass("fa-arrow-circle-up");

    }));
    else ($("#sidebar-edit").toggleClass("fa-ellipsis-h"));
});