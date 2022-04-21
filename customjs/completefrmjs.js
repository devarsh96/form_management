$(document).ready(function(){
	

})

$(".prvansbtn").click(function(){
	
	var createdby = $(this).closest("tr").find(".cretby").text();

	var createdon = $(this).closest("tr").find(".creton").text();

	console.log(createdby);

	$.ajax({
		method : "GET",
		url : "/prvansdata/" +createdby+ "/" +createdon,

		success : function(ress)
		{
			
			console.log(ress);
			let title = ress[0][0];
			let desc = ress[0][1];
			let fid = ress[0][2];
			$("#spantitlee").html(fid+" "+title);
			
			$("#spandescc").html(fid+" "+desc);
			
		}
	})
	
	$(".quescard").empty();
	$.ajax({
		method : "GET",
		url : "/quesansdata/" +createdby+ "/" +createdon,

		success : function(ressp)
		{
	
			console.log(ressp);
			console.log(ressp.length)
			strglb = "";
			for(i = 0; i < ressp.length; i++)
			{
				str = `<div class="card m-b-5 quescard">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : `+ressp[i][3]+`</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            `+ressp[i][1]+`
                                        </p>
                                        <p class="mb-1">`+ressp[i][0]+`</p>
                                            <p class="font-weight-700 mb-1 text-justify">
                                                Answer
                                            </p>
                                            <p class="mb-1">`+ressp[i][2]+`</p>   
                                           
                                     </div>
                                 </div>
                            </div>
                        </div>`
                        
                 
                  strglb = strglb + str;  
				
			}
			
			   $(".quescard").append(strglb);  
			
		}
	})	
})