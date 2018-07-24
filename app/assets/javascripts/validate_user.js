$(document).ready(function(){
	$('#btn').click(function(){
  	if($("#name").val().length <= 0){
			$("#sname").text("Enter Valid Username");
			return false;
		}
		if($("#email").val().length <= 0){
			$("#semail").text("Enter Valid Email Address");
			return false;
		}
		else{
			regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(regex.test($('#email').val()) == false){
				$("#semail").text("Enter Valid Email Address");
				return false;
			}
		}
		if($("#password").val().length <= 0){
			$("#spassword").text("Enter password");
			return false;
		}
		else{
			if($("#password").val().length < 8){
				$("#spassword").text("Password length must be more than 8");
				return false;
			}
		}
		if($("#cpassword").val().length <= 0){
			$("#scpassword").text("Enter password");
			return false;
		}
		else{
			if($("#cpassword").val().length < 8){
				$("#scpassword").text("Password length must be more than 8");
				return false;
			}
			else{
				if($("#password").val() != $("#cpassword").val()){	
					$("#scpassword").text("Password doesn't match");
					return false;
				}
			}
		}
  });
});