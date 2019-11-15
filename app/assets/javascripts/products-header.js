$( document ).on('turbolinks:load', function() {

    $(function(){
      $(".header__box__bottom__left__categories__link").on("mouseenter",function(){
        $('#categories-menu').animate({ height: 'show'}, 'fast' );
      });
    });

    $(function(){
      $(".header__box__bottom__left__categories").on("mouseleave",function(){
        $('#categories-menu').animate({ height: 'hide'}, 'fast' );
      });
    });

    $(function(){
      $(".header__box__bottom__left__brands__link").on("mouseenter",function(){
        $('.header__box__bottom__left__brands__lists').animate({ height: 'show'}, 'fast' );
      });
    });

    $(function(){
      $(".header__box__bottom__left__brands").on("mouseleave",function(){
        $('.header__box__bottom__left__brands__lists').animate({ height: 'hide'}, 'fast' );
      });
    });

});