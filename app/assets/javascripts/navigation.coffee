# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('body').delegate '.sidenav-two', 'click', ->
    id_sidenav = $(this).attr('id')
    if $('ul#'+id_sidenav).is(':empty') == false
      $('ul#'+id_sidenav).toggleClass("show")
      $(this).toggleClass("open")
#    $(this).find('a.sidebar-two.collapsed').toggleClass('collapsed')
#    $(this).find('a.sidebar-two.collapsed').attr('aria-expanded','true');
#    $(this).next('ul.list-unstyled.collapse').toggleClass('.show')


$ ->
#  $('.dropdown-menu.dropdown-custom').on 'classChange', ->
#
#    height_document = $(document).height()
#    h = $(this).height()
#    t = $(this).offset()
#    console.log height_document, h, t

  $('.fa.fa-ellipsis-h').click ->
    setTimeout(
      ->
        $('.dropdown-menu.dropdown-custom.show').each ->
          height_document = $(window).height()
          h = $(this).height()
          t = $(this).offset()
          console.log height_document, h, t.top
          if t.top + h > height_document
            $(this).addClass('dropdown-top')
      , 50

    )

#    console.log($(this).offset())
#    $(this).css('display','block')
#    console.log($(this).offset())
#    if height_document < $(this).height() + $(this).offset().top
#      $(this).addClass('dropdown-top')
#    $(this).css('display','')

#    $(this).toggleClass('active')
#    if ($(this).isVisible() == false)
#      $(this).closest('.dropdown-menu.dropdown-custom.show').toggleClass('dropdown-top')