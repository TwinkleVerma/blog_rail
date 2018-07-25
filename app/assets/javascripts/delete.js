$(document).on('click', '.link', function(){
  var article = $(".link").attr("article");
  var comment = $(".link").attr("comment");
  $.ajax({
    url : '/articles/'+article+'/comments/'+comment, 
    type: 'POST',
    method: 'delete'
  });
});