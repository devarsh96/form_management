
var datatablee = [];
function userGrid() {
	
	console.log(datatablee);
	 $('#form_table').DataTable({
			
			
            destroy: true,
            scrollResize: true,
            scrollX: true,
            // scrollY: 100,
            scrollCollapse: true,
            paging: true,
            // lengthChange: false,
            // scrollX: true,
            "bAutoWidth": true,
            // paging: true,
            "bLengthChange": true,
            // fixedColumns: true,
            "columnDefs": [{
                "targets": [0],
                "orderable": false,
                // "width": "2%",
            }],
            "pageLength": 15,
            "lengthMenu": [
                [15, 25, 50, 100, -1],
                [15, 25, 50, 100, "All"]
            ],
            fixedColumns: {
                rightColumns: 0,
                leftColumns: 0
            },
            language: {
                paginate: {
                    next: '<i class="fa fa-angle-double-right">',
                    previous: '<i class="fa fa-angle-double-left">'
                }
            },
            
            /*"ajax": {
						"url": "/getdatatable",
						"method": "GET",
						
						"dataSrc": function(data) {
							
							console.log(data);
							
							return data;
					}
			},*/
			data: datatablee,
			
			"columns": [
			{ "data": '' },
			{ "data": '' },
			{ "data": '' },
			{ "data": '' },
			{ "data": 'email' },
			{ "data": 'phone' },
			{ "data": 'valFro' },
			{ "data": 'valTo' },
			{ "data": 'gender'},
			{ "data": '' }],
			
			"columnDefs": [{
				"targets": 0,
				"render": function(data, type, full) {
					let str = '';
					str += `<div class="text-center">
                                   
                                    <span data-toggle="modal" data-target=".addmodal">
                                        <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                            data-original-title="Edit" href="javascript:void(0);" >
                                            <i class="fas fa-edit mr-1 editbtn" id= "${full.id}"></i>
                                        </a>
                                    </span>
                                    <a class="  icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                        <i class="far fa-trash-alt mr-1 deletebtn" id="dl${full.id}"></i>
                                    </a>

                                </div>`;
	
	                                
					return str;
				}
			},
			{
				"targets": 1,

				"render": function(data, type, full) {
					
					let str = '';
					str += `<div>
	                             <span class="badge badge-success">Yes</span>
	                        </div>`;
					return str;
				}
			},
			{
				"targets": 2,
				"orderable": false,
				"render": function(data, type, full) {
					
					let str = ``;
					str += `<div class="text-center" >
	                         <a href="javascript:void(0)" data-trigger="hover" data-toggle="popover"  data-html="true" data-placement="right" data-template='<div class="popover fade bs-popover-right" role="tooltip" x-placement="right"><div class="arrow"></div><h3 class="popover-header p-0 border_radius6"></h3></div>'
                                        data-title="<img src='${full.image}' height='150' class='border_radius6'>">
                                        <img src="${full.image}" alt="" width="27" height="27" class="img-thumbnail">
                             </a>
	                   		</div>`;
					return str;
				}
			},
			{
				"targets": 3,

				"render": function(data, type, full) {
					
					let str = '';
					str += `${full.first_name} ${full.last_name}`;
					return str;
				}
			},
			{
				"targets": 8,

				"render": function(data, type, full) {
					
					let str;
					if (full.gender == 1) {
						str = "Male"
					} else if (full.gender == 2) {
						str = "Female"
					} else {
						str = "NA"
					}
					return str;
				}
			},
			{
				"targets": 9,

				"render": function(data, type, full) {
					
					let str;
					if (full.roles == 1) {
						str = "Admin"
					} else if (full.roles == 2) {
						str = "User"
					} else {
						str = "NA"
					}
					return str;
				}
			}
			
			],
			
			
            dom: "<'row pl-2 pr-2'<'col-xl-9 col-lg-8 col-sm-8'pi><'col-xl-3 col-lg-4 col-sm-4'f>>" +
                "<'row pl-2 pr-2'<'col-xl-12 col-lg-12 col-sm-12'tr>>"

        });

}



var flag = 0;
$(document).ready(function() {
	
	$.ajax({
		method : "GET",
		url : "/getdatatable",
		success : function(responceee)
		{
			console.log(responceee);
			for(let x = 0; x < responceee.length; x++)
			{
				datatablee.push(responceee[x]);
			}
			userGrid();
		}
	})
															
	
	var globalvalid = false;
	$("#emailid").change(function() {

		let eml = document.getElementById("emailid").value;

		$.ajax({
			method: 'POST',
			url: '/checkemail',
			data: eml,
			success: function(response) {


				if (response == "true") {

					document.getElementById("spanemail").innerHTML = " (Email already exist)";
					globalvalid = false;
				}
				else {

					document.getElementById("spanemail").innerHTML = "";
					globalvalid = true;
				}
			}
		})

	})
	
$(document).on('click', '#savebtn', function() {
		
		console.log(valid());
		if (valid() && true) {
//			alert();

			let usrobj = {}
			if (flag) {
				usrobj.id = flag;
			}

			usrobj.first_name = document.getElementById("firstid").value;
			usrobj.last_name = document.getElementById("lastid").value;
			usrobj.email = document.getElementById("emailid").value;
			usrobj.phone = document.getElementById("contactid").value;
			usrobj.gender = document.getElementById("gen").value;
			usrobj.valFro = document.getElementById("validfromid").value;
			usrobj.valTo = document.getElementById("validtoid").value;
			usrobj.roles = document.getElementById("rls").value;

			console.log("//////////////////////////////////")
			console.log(usrobj);
			var fdata = new FormData();
			//======
			if (($('#imagePreview1').attr('src')).includes(";base64,/") == false) {

				usrobj.image = $("#imagePreview1").attr("src");
			}

			fdata.append("usrobj", new Blob([JSON.stringify(usrobj)], { type: "application/json;charset=UTF-8" }));

			if (($('#imagePreview1').attr('src')).includes(";base64,/") == true) {

				let files = $("#imageUpload1").get(0).files[0];

			///	console.log(files);
				if (files) {
					fdata.append("image", files)
				}

			}
			
			console.log(fdata);
			$.ajax({
				method: 'POST',
				url: '/useradd',
				data: fdata,
				contentType: false,
				processData: false,
				success: function() {
					window.location.href = "/user"
				//	alert("success");
				}
			})

		}//if ends

	});// save btn


$(document).on('click', '.editbtn', function() {

//		alert(this.id);
		let id = this.id;
		console.log(id);


		$.ajax({
			method: 'GET',
			url: '/edit/' + id,
			success: function(responce) {
				console.log(responce);
				flag = responce.id;
				document.getElementById("firstid").value = responce.first_name;

				document.getElementById("lastid").value = responce.last_name;

				document.getElementById("emailid").value = responce.email;
				document.getElementById("contactid").value = responce.phone;
				document.getElementById("validfromid").value = responce.valFro;

				document.getElementById("validtoid").value = responce.valTo;

				document.getElementById("gen").value = responce.gender;

				document.getElementById("rls").value = responce.roles;
				document.getElementById("imagePreview1").src = responce.image;
				$("#gen").selectpicker("refresh");

				$("#rls").selectpicker("refresh");
			}
		});

	}); //edit ends

$(document).on('click', '.deletebtn', function() {

		let id = this.id;
		id = id.substring(2);
		//       alert(id);

		$.ajax({
			method: 'GET',
			url: '/delete/' + id,
			success: function(responce) {
				window.location.href = "/user"

			}
		});
	});

	$("#addButton").click(function() {

		resetall();
	})

	$(".removebtn").click(function() {

		document.getElementById("imagePreview1").src = "../assets/custom/images/noimage.jpg"

	})

});///ready ends


function resetall() {
	document.getElementById("firstid").value = "";
	document.getElementById("lastid").value = "";
	document.getElementById("emailid").value = "";
	document.getElementById("validfromid").value = "";
	document.getElementById("contactid").value = "";
	document.getElementById("validtoid").value = "";
	document.getElementById("gen").value = 0;
	document.getElementById("rls").value = 0;
	document.getElementById("imagePreview1").src = "../assets/custom/images/noimage.jpg"

	$("#gen").selectpicker("refresh");

	$("#rls").selectpicker("refresh");

}



function valid() {
	let fname = document.getElementById("firstid").value;
	let lname = document.getElementById("lastid").value;
	let eml = document.getElementById("emailid").value;
	let contact = document.getElementById("contactid").value;
	let gender = document.getElementById("gen");
	let validf = document.getElementById("validfromid").value;
	let validt = document.getElementById("validtoid").value;
	let role = document.getElementById("rls");
	// let image = document.getElementById("imageUpload1").src;
	let image = $("#imagePreview1").attr("src");
	console.log(image);

	if (image == "../assets/custom/images/noimage.jpg") {
		document.getElementById("spanimage").innerHTML = " (Enter image)";
		return false;
	}
	else {
		document.getElementById("spanimage").innerHTML = "";

	}

	if (fname == '') {
		document.getElementById("spanfirst").innerHTML = " (Enter valid firstname)";
		return false;
	}
	else {
		document.getElementById("spanfirst").innerHTML = "";

	}
	if (lname == '') {
		document.getElementById("spanlast").innerHTML = " (Enter valid lastname)";
		return false;
	}
	else {
		document.getElementById("spanlast").innerHTML = "";
	}
	if (eml == '') {
		document.getElementById("spanemail").innerHTML = " (Enter valid email)";
		return false;
	}
	else {
		document.getElementById("spanemail").innerHTML = "";
	}
	if (contact == '') {
		document.getElementById("spancont").innerHTML = " (Enter valid contact)";
		return false;
	}
	else {
		document.getElementById("spancont").innerHTML = "";
	}

	if (validf == '') {
		document.getElementById("spanvalidf").innerHTML = " (Enter valid entry)";
		return false;
	}
	else {
		document.getElementById("spanvalidf").innerHTML = "";
	}
	if (validt == '') {
		document.getElementById("spanvalidt").innerHTML = " (Enter valid entry)";
		return false;
	}
	else {
		document.getElementById("spanvalidt").innerHTML = "";
	}


	let optionSelIndex = gender.options[gender.selectedIndex].value;
	if (optionSelIndex == 0) {

		document.getElementById("spangender").innerHTML = " (Enter atleast one)";
		return false;
	}
	else {
		document.getElementById("spangender").innerHTML = "";
	}

	let optionSelIndex1 = role.options[role.selectedIndex].value;
	if (optionSelIndex1 == 0) {

		document.getElementById("spanrole").innerHTML = " (Enter atleast one)";
		return false;
	}
	else {
		document.getElementById("spanrole").innerHTML = "";
	}
	return true;

};

$(".userexcel").click(function(){
	
	//alert();
	let name = document.getElementById("searchname").value;
	let role = document.getElementById("searchrole").value;

	window.location.href = "/userexcel?name=" +encodeURIComponent(name)+"&role=" +encodeURIComponent(role);
})

$(".searchbtn").click(function(){
	
	let name = document.getElementById("searchname").value;
	let role = document.getElementById("searchrole").value;
	
	if(name == "")
	{
		name = 0;
	}

	$.ajax({
		method : "GET",
		url : "/searchbtnclk/" +name+ "/" +role,
		success : function(responcee)
		{
		//	alert("sucess serch");
			datatablee.splice(0, datatablee.length);
			
			console.log(responcee);
			for(let x = 0; x < responcee.length; x++)
			{
				datatablee.push(responcee[x]);
			}
			userGrid();
		}
	})

})