$('document').ready(function(){
	$('#butt').click(function(){
	  articleId = $("#articleid").val();
	  comment = $("#text").val();
	  $.ajax({
	    url: "/articles/"+articleId+"/comments",
	    type: 'POST',
	    data: {comment: comment},
	    async: true
	  });
	});
}); 