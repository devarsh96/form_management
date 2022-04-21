$('#warehouse_table').DataTable({
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
		[15, 25, 50, 60, 40, -1],
		[15, 25, 50, 60, 40,"All"]
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
	dom: "<'row pl-2 pr-2'<'col-xl-9 col-lg-8 col-sm-8'pi><'col-xl-3 col-lg-4 col-sm-4'f>>" +
		"<'row pl-2 pr-2'<'col-xl-12 col-lg-12 col-sm-12'tr>>"


});


$(document).ready(function() {


});

$(".addformbtnid").click(function() {

	window.location.href = "/add_edit_for";

})


$(".editbtn").click(function() {

	let fid = this.id;
	console.log(encodeURIComponent(fid));
	window.location.href = "/add_edit_form?formidji=" + encodeURIComponent(fid);

});

$(".dltbtn").click(function(){
	
//	alert(this.id);
	let fidd = this.id;


	$.ajax({
		method : "GET",
		url : "/deleteformwhole/" +fidd,
		success : function()
		{
			
			window.location.href = "/form";
		}
	})
})

$(".prvbtn").click(function(){
	
//	alert(this.id);
	let prid = this.id;
	
	$(".quescard").empty();
	$.ajax({
		method : "GET",
		url : "/previewform/" +prid,
		success : function(respdto)
		{
//			alert("preview success");
	//		console.log(respdto);
			
			console.log(respdto.addformentity);
			console.log(respdto.addquestionentity);
			console.log(respdto.optionentity);
			
			var formentity = respdto.addformentity;
			var quesentity = respdto.addquestionentity;
			var optionentity = respdto.optionentity;
			
			$("#titletextid").html(formentity.titletext);
			$("#textareaid").html(formentity.textarea);
			
			for(let k = 0; k < quesentity.length; k++)
			{
				
				let str = `<div class="card m-b-5">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : `+quesentity[k].questionid +`</span>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-sm-6 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            `+quesentity[k].questionlabel +`
                                        </p>
                                        <p class="mb-1">`+quesentity[k].questionname +`

                                        </p>
										`;
				 						
										if(quesentity[k].answertypeid == 1)
										{
									//		console.log(quesentity[k].answertypeid);
											for(let x = 0; x < optionentity.length; x++)
											{
												if(optionentity[x].questionid == quesentity[k].questionid)
												{
													let str1 =	`<div class="form-check-inline mr-4">
		                                                <label class="form-check-label">
		                                                  <input type="radio" class="form-check-input" name="optradio">`+optionentity[x].options+`
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
		                                              <input type="checkbox" class="form-check-input" value="">`+optionentity[x].options+`
		                                            </label>
		                                          </div>`;
					                                  str+= str1
			                          			 }
			                          		 }
										}
										else if(quesentity[k].answertypeid == 3)
										{
											let str1 = `<input type="text" class="form-control" placeholder="Enter Your Answer">`;
											str += str1;
										}
										else if(quesentity[k].answertypeid == 4)
										{
											let str1 = ` <textarea class="form-control textareasize" placeholder="Enter Your Answer"></textarea>`
											str += str1;
										}
										else if(quesentity[k].answertypeid == 5)
										{
											 let str1 = `<select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body">
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
											
											 let str1 = `<select class="selectpicker form-control " data-style=""  multiple data-selected-text-format="count" data-actions-box="true"data-title="Select" data-live-search="true" data-size="6" data-container="body">
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
			                                         <input type="text" class="form-control selectdate" placeholder="Select From Date">
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
                      		
              //          console.log(str);
                        let element = $(".quescard");
                    
						element.append(str);
						 $(".selectpicker").selectpicker("refresh");
			}
							
		}
	})					
})
