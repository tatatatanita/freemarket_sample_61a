
$( document ).on('turbolinks:load', function() {
  $(function(){
    $(".delete_btn").on('click', function(){
      var deleteConfirm = confirm('削除してよろしいでしょうか？');

      if(deleteConfirm == true) {
        var clickEle = $(this)
        var productEle = $(this).parent().parent().parent().parent(this);
        var productUrl = productEle.attr('action')
        var imageID = clickEle.parent().attr('data-image-id')
        console.log(clickEle);

        $.ajax({
          // url: productUrl,
          // type: 'POST',
          // data: {'image.id': imageID,
          //       '_method': 'DELETE'}
        })

        .done(function(){
          clickEle.parent('img').remove();
          console.log(clickEle);
        })

        .fail(function(){
          alert('エラー')
        });
      } else {
        (function(e){
          e.preventDefault()
        });
      };
    });
  });
});