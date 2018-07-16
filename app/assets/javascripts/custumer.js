$(document).on('turbolinks:load', function() {
  $('.btn-search').on('click', function(event) {
    event.preventDefault();
    /* Act on the event */
    if($('.btn-search i').hasClass('fa-search')){
      $('.btn-search i').removeClass('fa-search');
      $('.btn-search i').addClass('fa-close');
    }else{
      $('.btn-search i').removeClass('fa-close');
      $('.btn-search i').addClass('fa-search');
    }
    $('.search-form').slideToggle();
  });
  var list_li = $('.menu-header .item-header');
  $('.item-header').on('click', function(event) {
    // event.preventDefault();
    for(var i = 0; i < list_li.length; i++){
      $(list_li[i]).removeClass('li-active');
    }
    $(this).addClass('li-active');
  });
});
