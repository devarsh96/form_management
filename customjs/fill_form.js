$(document).ready(function(){

})

$(".searchbtn").click(function () {
	   /*   formtable.draw(); 
	   */ 
	  
	 let valuedb = document.getElementById("dropboxfrm").value;
//	 alert(valuedb);
	 $(".quescard").empty();
	 $.ajax({
		method : "GET",
		url : "/fillformdata/" + valuedb,
		success : function(responce)
		{
		//	alert("success");
			console.log(responce);
			//			alert("preview success");
	//		console.log(respdto);
			
			console.log(responce.addformentity);
			console.log(responce.addquestionentity);
			console.log(responce.optionentity);
			
			var formentity = responce.addformentity;
			var quesentity = responce.addquestionentity;
			var optionentity = responce.optionentity;
			
			$("#filltitle").html(formentity.titletext);
			$("#filldesc").html(formentity.textarea);
			
			var qassid = 0;
				
			for(let k = 0; k < quesentity.length; k++)
			{
				qassid++;
				arrayforanswertypeid.push(quesentity[k].answertypeid);
				let str = ` <div class="card mb-2 singleques">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question" id = "`+qassid+`">Q : `+quesentity[k].questionid +`</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify">
                                                     
                                                 <c:if test="${quesentity[k].isansrequired == 1}">
						 					     <span class="text-danger"><c:out value="*"/> </span> </c:if>
                      	                               
                                                  <c:if test="${quesentity[k].isansrequired == 0}">
						 					     <span class="text-danger"></span> </c:if>   
                                                     
                                                     <span class="text-danger">* </span>
                                            `+quesentity[k].questionlabel +`
                                        </p>
                                        <p class="mb-1">`+quesentity[k].questionname +`

                                        </p>
										`;
				 					//==================================================================================	
										if(quesentity[k].answertypeid == 1)
										{
											
									//		console.log(quesentity[k].answertypeid);
											for(let x = 0; x < optionentity.length; x++)
											{
												if(optionentity[x].questionid == quesentity[k].questionid)
												{
													let str1 =	`<div class="form-check-inline mr-4">
		                                                <label class="form-check-label">
		                                                  <input type="radio" class="form-check-input" name="optradio`+qassid+`" value = "`+optionentity[x].options+`"  data-req="${quesentity[k].isansrequired}">`+optionentity[x].options+`
		                                                </label>
		                                              </div>`;
					                                 str+= str1
												}
											}

										}
										else if(quesentity[k].answertypeid == 2)
										{
											for(let x = 0; x < optionentity.length; x++)
											{
												if(optionentity[x].questionid == quesentity[k].questionid)
												{
													let str1 =	`<div class="form-check-inline mr-4">
		                                            <label class="form-check-label">
		                                              <input type="checkbox" class="form-check-input" name="optchbx`+qassid+`" value = "`+optionentity[x].options+`" data-req="${quesentity[k].isansrequired}">`+optionentity[x].options+`
		                                            </label>
		                                          </div>`;
					                                  str+= str1
			                          			 }
			                          		 }
										}
										else if(quesentity[k].answertypeid == 3)
										{
											let str1 = `<input type="text" class="form-control" placeholder="Enter Your Answer" id = "txt`+qassid+`" data-req="${quesentity[k].isansrequired}">`;
											str += str1;
										}
										else if(quesentity[k].answertypeid == 4)
										{
											let str1 = ` <textarea class="form-control textareasize" placeholder="Enter Your Answer" id = "txtarea`+qassid+`"  data-req="${quesentity[k].isansrequired}"></textarea>`
											str += str1;
										}
										else if(quesentity[k].answertypeid == 5)
										{
											 let str1 = `<select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id = "singleseldrop`+qassid+`"  data-req="${quesentity[k].isansrequired}">
                                            `
                                            str += str1;
                                           	for(let x = 0; x < optionentity.length; x++)
											{
												if(optionentity[x].questionid == quesentity[k].questionid)
												{
                                           			let str1 = `<option value="`+optionentity[x].oid+`" >`+optionentity[x].options+`</option>`
                                           		   	str += str1;
                                           		}
                                           	 }
                                           	 str = str + `</select>`
                    
                                           	 $(".selectpicker").selectpicker("refresh");
                                            
										}
										else if(quesentity[k].answertypeid == 6)
										{
											
											 let str1 = `<select class="selectpicker form-control " data-style=""  multiple data-selected-text-format="count" data-actions-box="true"data-title="Select" data-live-search="true" data-size="6" data-container="body" id = "multiseldrop`+qassid+`"  data-req="${quesentity[k].isansrequired}">
                                            `
                                            str += str1;
                                           	for(let x = 0; x < optionentity.length; x++)
											{
												if(optionentity[x].questionid == quesentity[k].questionid)
												{
                                           			let str1 = `<option value="`+optionentity[x].oid+`" >`+optionentity[x].options+`</option>`
                                           		   	str += str1;
                                           		}
                                           	 }
                                           	 str = str + `</select>`
                    
                                           	 $(".selectpicker").selectpicker("refresh");
                                            
										
										}
										else if(quesentity[k].answertypeid == 7)
										{
											let str1 = `<div class="input-group date" style="width: 30%;">
			                                         <input type="text" class="form-control selectdate" placeholder="Select From Date" data-req="${quesentity[k].isansrequired}">
			                                            <span class="input-group-addon inputgroups">
			                                                <i class="far fa-calendar-alt"></i>
			                                            </span>
				                                 </div>`;
				                            str+= str1
				                                
										}											
											
							
                                       
                          str2 = 	`</div>
                                 </div>
                            </div>
                        </div>`;
                      		str += str2;
                      		
                        let element = $(".quescard");
                    
						element.append(str);
						 $(".selectpicker").selectpicker("refresh");
			}
			 $('.showform').slideDown();				
		
		}
	})
	   
	 
});

var mainarray = [];
var arrayforanswertypeid = [];
$(document).on('click', '.fillformsave', function() {
	
	let qassid = 0;
	
	for (i = 0; i < arrayforanswertypeid.length; i++) {
		qassid++;
		if (arrayforanswertypeid[i] == 1) {
			var singlechoiceobj = {};
		
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var checkedanswers = $('input[name=optradio' + qassid + ']:checked').map(function() { return this.value }).get();
			var ans = checkedanswers.toString();

			singlechoiceobj.formid = $('#dropboxfrm').val();
			singlechoiceobj.questid = qid[1];
			singlechoiceobj.answerselected = ans;
	//		mainarray.push(singlechoiceobj);
			
			if ($('input[name=optradio' + qassid + ']').attr('data-req') == "1" && (ans == null || ans == "")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(singlechoiceobj);
			}
			
			console.log(singlechoiceobj);
		}


		if (arrayforanswertypeid[i] == 2) {
			var multichoiceobj = {};
			
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var checkedanswers = $('input[name=optchbx' + qassid + ']:checked').map(function() { return this.value }).get();
			var ans = checkedanswers.toString();

			multichoiceobj.formid = $('#dropboxfrm').val();
			multichoiceobj.questid = qid[1];
			multichoiceobj.answerselected = ans;
	//		mainarray.push(multichoiceobj);
			console.log(multichoiceobj);
			
			if ($('input[name=optchbx' + qassid + ']').attr('data-req') == "1" && (ans == null || ans == "")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(multichoiceobj);
			}
		}

		if (arrayforanswertypeid[i] == 3) {
			var singletextboxobj = {};
			
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var ans = $('#txt' + qassid).val();

			singletextboxobj.formid = $('#dropboxfrm').val();
			singletextboxobj.questid = qid[1];
			singletextboxobj.answerselected = ans;
			console.log(singletextboxobj);
			
		//	mainarray.push(singletextboxobj);
			if ($('#txt' + qassid).attr('data-req') == "1" && (ans == null || ans == "")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(singletextboxobj);
			}
		}

		if (arrayforanswertypeid[i] == 4) {
			var multitextboxobj = {};
		
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var ans = $('#txtarea' + qassid).val();

			multitextboxobj.formid = $('#dropboxfrm').val();
			multitextboxobj.questid = qid[1];
			multitextboxobj.answerselected = ans;
			
			console.log(multitextboxobj);
		//	mainarray.push(multitextboxobj);
			if ($('#txtarea' + qassid).attr('data-req') == "1" && (ans == null || ans == "")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(multitextboxobj);
			}



		}

		if (arrayforanswertypeid[i] == 5) {
			var singleselectfdropobj = {};
			
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var checkedanswers = $('#singleseldrop' + qassid).find('option:selected').map(function() { return this.text }).get();
			var ans = checkedanswers.toString();

			singleselectfdropobj.formid = $('#dropboxfrm').val();
			singleselectfdropobj.questid = qid[1];
			singleselectfdropobj.answerselected = ans;
			console.log(singleselectfdropobj);
	//		mainarray.push(singleselectfdropobj);
			
			if ($('#singleseldrop' + qassid).attr('data-req') == "1" && (ans == null || ans == "Select")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(singleselectfdropobj);
			}
		}

		if (arrayforanswertypeid[i] == 6) {
			var multiselectfdropobj = {};
			
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var checkedanswers = $('#multiseldrop' + qassid).find('option:selected').map(function() { return this.text }).get();
			var ans = checkedanswers.toString();

			multiselectfdropobj.formid = $('#dropboxfrm').val();
			multiselectfdropobj.questid = qid[1];
			multiselectfdropobj.answerselected = ans;
			console.log(multiselectfdropobj);
	//		mainarray.push(multiselectfdropobj);
			
			if ($('#multiseldrop' + qassid).attr('data-req') == "1" && (ans == null || ans == "" || ans == "Select")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(multiselectfdropobj);
			}
		}

		if (arrayforanswertypeid[i] == 7) {
			var dateobj = {};
			
			var qidinspan = $('#' + qassid).text();
			var qid = qidinspan.split(': ');
			var ans = $('#allpreview_date' + qassid).val();
			dateobj.formid = $('#dropboxfrm').val();
			dateobj.questid = qid[1];
			dateobj.answerselected = ans;
			
	//		mainarray.push(dateobj);
			if ($('#allpreview_date' + qassid).attr('data-req') == "1" && (ans == null || ans == "")) {

				errflag = 1;
				errmsg = qidinspan;
				break;
			} else {
				errmsg = "";
				errflag = 0;
				mainarray.push(dateobj);
			}
		}
		
	}
	

	var fillformjson = JSON.stringify(mainarray);
	console.log(fillformjson)
		

	if (errflag == 1) {

		toastr.error(errmsg + " is required ..!");
		toastr.options.timeOut = 1500;
		mainarray.splice(0, mainarray.length);
		console.log("Empty array after error");
		console.log(mainarray);
		
	} else {
		errflag = 0;
		errmsg = "";
		console.log(mainarray)

		$.ajax({
			type: "POST",
			url: "/saveformfill",
			contentType: "application/json; charset=utf-8",
			data: fillformjson,
			success: function() {
				alert('Form Filled Successfully !')

				$('#dropboxfrm').val('').selectpicker('refresh');
				window.location.href="/complete_form";
			}

		})
	}


})

$('#dropboxfrm').change(function() {
	
	mainarray.splice(0, mainarray.length);
	console.log(mainarray)
})

$(document).on('click', '.fillformcancel', function() {
	$(".quescard").empty();
	$('.showform').slideUp();
	
})

$(document).on("click", ".resetbtn", function(){
	
	$("#dropboxfrm").val("").selectpicker("refresh");
	$(".quescard").empty();
	$('.showform').slideUp();
})
