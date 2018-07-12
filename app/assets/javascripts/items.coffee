# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.menu-link').click ->
    $('.sidenav.active').toggleClass('active')
    $(this).closest('.sidenav').toggleClass('active')

  $('body').delegate '.sidebar-request', 'click', ->
    $('.sidenav.active').toggleClass('active')
    $(this).closest('.sidenav').toggleClass('active')
    id_request = $(this).closest('.sidenav').attr('id')
    setTimeout(
      ->
        h = $('.item-request#'+id_request).offset().top
        $(document).find('.block-left').animate(scrollTop:(h-200), 500)
        $('.item-request#'+id_request).toggleClass('active')
      , 200)
