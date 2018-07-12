$ ->
  $('body').delegate '.item-request', 'click', ->
    id_request = $(this).attr('id')
    # $('.item-request').click ->
    #    $(this).toggleClass('active')
    #    console.log('fgdfgf')
    #    $('.block-left').css('width','50%')
    #    $('.block-right').css('display','block')
    #    $(this).find('i.fa.fa-chevron-circle-right.card').toggleClass('fa-chevron-circle-right')
    #    $(this).find('i.fa.card').toggleClass('fa-chevron-circle-left')
    $('.item-request.active').toggleClass('active')
    setTimeout(
      ->
        $('.item-request#' + id_request).toggleClass('active')
    , 200)
    $('.sidenav.active').toggleClass('active')
    $('.sidenav#' + id_request).toggleClass('active')
    console.log($('.sidenav#' + id_request).closest('ul.collapse').hasClass('show'))
    if $('.sidenav#' + id_request).closest('ul.collapse').hasClass('show') == false
      id_sidenav = $('.sidenav#' + id_request).closest('ul.collapse').attr('id')
      $('.sidenav-two#' + id_sidenav).click()

  $('body').delegate 'button.close-request', 'click', ->
    $('.block-left').css('width', '100%')
    $('.block-right').css('display', 'none')
    $('.item-request.active').toggleClass('active')
    $('.sidenav.active').toggleClass('active')
    id_item = $('.item-name').attr('id')
    $('.sidenav#' + id_item).toggleClass('active')

#  $('i.fa.fa-chevron-circle-right').click ->
##    $('.item-request.active').toggleClass('active')
#    $(this).toggleClass('fa-chevron-circle-right')
#    $(this).toggleClass('fa-chevron-circle-left')

#id_request_card = $('.block-rigth').find('.request-card-name').attr('id')
#$('.sidenav.active').toggleClass('active')
#$('.item-request.active').toggleClass('active')
#$('.item-request#'+id_request_card).toggleClass('active')
#$('.sidenav#'+id_request).toggleClass('active')
