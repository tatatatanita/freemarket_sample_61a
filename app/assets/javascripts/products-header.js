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

    // $(function(){
    //   $("#categories-parent").on("mouseenter",function(){
    //     $('#categories-children').animate({ height: 'show'}, 'fast' );
    //   });
    // });

    // $(function(){
    //   $(".header__box__bottom__left__categories").on("mouseleave",function(){
    //     $('#categories-children').animate({ height: 'hide'}, 'fast' );
    //   });
    // });

});