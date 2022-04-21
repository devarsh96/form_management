
$(document).ready(function(){
	//alert();
	$.ajax({
		method : "GET",
		url : "/login",
		success : function()
		{
			/*alert("Loginpafe");*/
		}
	})
})

$(document).on("click", ".loginbtn", function(){
//	alert();
	
	let loginobj = {}
	loginobj.username = $("#username").val();
	loginobj.password = $("#password").val();
	
	let jsondata = JSON.stringify(loginobj);
	
	$.ajax({
		method : "POST",
		url : "/logincheck",
		contentType: "application/json; charset=utf-8",
		data : jsondata,
		success : function(response)
		{
//			alert("login success");
			console.log(response)
				if (response.status == "success") {
					localStorage.clear();
					var roleid = response.role;

					if (roleid == 1) {
						window.localStorage.setItem('username', 'admin');
						location.href = "/user";
					} else if (roleid == 2) {
						window.localStorage.setItem('username', 'client');
						location.href = "/fill_form";
					}
				}
				else if (response.status == "No entity found for query") {

				//	$("#loginerrspan").html("Incorrect Username or Password");
					document.getElementById('msg').style.display = 'block';
				}
							
				else if(response.status == "Fail")
				{
					$("#loginerrspan").html("Enter Valid entries");
					document.getElementById('msg').style.display = 'block';
				}	
			}	
	})
	
	console.log(loginobj);
})