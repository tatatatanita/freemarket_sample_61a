$( document ).on('turbolinks:load', function() {
  $(function(){
    $('.show-exhibit__main__box__right__tabs__tab li').click(function(){
      var index = $('.show-exhibit__main__box__right__tabs__tab li').index(this);
      $('.show-exhibit__main__box__right__tabs__tab li').removeClass('active');
      $(this).addClass('active');
      $('.show-exhibit__main__box__right__body-group li').removeClass('show').eq(index).addClass('show');
    });
  });
});