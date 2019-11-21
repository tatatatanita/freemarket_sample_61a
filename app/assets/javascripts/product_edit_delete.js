
// 今後実装予定


// $( document ).on('turbolinks:load', function() {
//   $(function(){
//     $(".delete_btn").on('click', function(){
//       var deleteConfirm = confirm('削除してよろしいでしょうか？');

//       if(deleteConfirm == true) {
//         var clickEle = $(this)
//         var productEle = $(this).parent().parent().parent().parent(this);
//         var imageID = clickEle.parent().attr('data-image-id')

        

//         $.ajax({
//           url: 'image_destroy',
//           type: 'POST',
//           data: {'image_id': imageID,
//                 '_method': 'DELETE'}
//         })

//         .done(function(){
//           clickEle.parent('img').remove();
//         })

//         .fail(function(){
//           alert('削除できませんでした')
//         });
//       } else {
//         (function(e){
//           e.preventDefault()
//         });
//       };
//     });
//   });
// });


