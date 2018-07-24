$(document).on('click', '.heart_like', function(){    
  var id_of_anchor_tag_cliked = $(this).attr('id');
  var like_type = $("#"+id_of_anchor_tag_cliked).attr("likeable_type");
  var like_id = $("#"+id_of_anchor_tag_cliked).attr("likeable_id");	
  var link_class = $("#"+id_of_anchor_tag_cliked).attr("class").split(' ')[0];
  var likeId = $("#"+id_of_anchor_tag_cliked).attr("likeId");
  var hash = {}
  if(link_class == 'img_link')
  {
    hash = {url : '/likes', type: 'POST', data: {likeId: likeId,link_class: link_class, like_type: like_type, like_id: like_id}};
  }
  else
  { 
    address= '/likes/'+likeId;
    hash = {url: address , type: 'POST',method: 'delete', data: {likeId: likeId,link_class: link_class,like_type: like_type, like_id: like_id}};
  }  
  $.ajax(hash);
});