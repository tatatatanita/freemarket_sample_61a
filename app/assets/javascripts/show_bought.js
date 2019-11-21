$( document ).on('turbolinks:load', function() {
  $(function(){
    $('.show-bought__main__box__right__tabs__tab li').click(function(){
      var index = $('.show-bought__main__box__right__tabs__tab li').index(this);
      $('.show-bought__main__box__right__tabs__tab li').removeClass('active');
      $(this).addClass('active');
      $('.show-bought__main__box__right__body-group li').removeClass('show').eq(index).addClass('show');
    });
  });
});