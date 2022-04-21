function datatablex() {
	$('#question_table').DataTable({
		destroy: true,
		scrollX: true,
		scrollCollapse: true,
		// lengthChange: false,
		// scrollX: true,
		"bAutoWidth": true,
		paging: true,
		"bLengthChange": true,
		// fixedColumns: true,
		"columnDefs": [{
			"targets": [],
			"orderable": false,
			// "width": "2%",
		}],
		"pageLength": 10,
		//"lengthMenu": [[15, 25, 50, 100, -1], [15, 25, 50, 100, "All"]],
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
		dom: "<'row pl-1 pr-1'<'col-xl-9 col-lg-8 col-sm-8'p><'col-xl-3 col-lg-4 col-sm-4'f>>" +
			"<'row pl-1 pr-1'<'col-xl-12 col-lg-12 col-sm-12'tr>>",

		data: questiondatatablearr,
		"columns": [

			{ data: "action" },
			{ data: "questionlabel" },
			{ data: "questionname" },
			{ data: "answertypeid" },
			{ data: "isansrequired" },
		]
	});

}
//=================================================================================================

function validationfun()
{
/*	alert("valid");*/
	if($("#titletextid").val() == "")
	{
		$("#spantitlet").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spantitlet").html("");
	}
	if($("#aliasnameid").val() == "")
	{
		$("#spanalias").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spanalias").html("");
	}
	if($("#moduleid").val()  == "")
	{
		$("#spanmodule").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spanmodule").html("");
	}
	if($("#characid").val() == "")
	{
		$("#spanchar").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spanchar").html("");
	}
	if($("#subcharacid").val() == "")
	{
		$("#spansubch").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spansubch").html("");
	}
	if($("#reccuid").val() == "")
	{
		$("#spanrecc").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spanrecc").html("");
	}
	if($("#startmnthid").val() == "")
	{
		$("#spanstm").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spanstm").html("");
	}
	if($("#complainprdid").val() == "")
	{
		$("#spancperiod").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spancperiod").html("");
	}
	if($("#effectid").val() == "")
	{
		$("#spaneffd").html("Please Enter!");
		return false;
	}
	else
	{
		$("#spaneffd").html("");
	}
	if($("#txtareaid").val() == "")
	{
		$("#spantexta").html("Please Enter!");
		return false;
	}
	else
	{
		return true;
	}
		
}
//=====================================================================================

$('.addquestion').on('hidden.bs.modal', function() {

	document.getElementById("queslabelid").value = "";
	document.getElementById("quesdescid").value = "";
	document.getElementById("quesnameid").value = "";
	document.getElementById('quesanstypeid').value = "";
	document.getElementById("active1").checked = false;
	$('#quesanstypeid').selectpicker('refresh');

	$('.multipleselect').val("");
	$('.multiselectdata').hide();

	$('.multiplechoice').val("");
	$('.multichoicedata').hide();

	$('.singlechoice').val("");
	$('.singlechoicedata').hide();

	$('.singleselect').val("");
	$('.singleselectdata').hide();

	$('.hidetextvalidation').hide();
	$('.showanswershouldbe').hide();
	$('.hidedatevalidation').hide();

	globalid = 0;
})
/*

*/
var formdetailsarr = [];

$("#formsaveid").click(function() {
	//alert();
	
	if(validationfun())
	{
		let formobj = {};
		formobj.formid = $("#formid").val();
		formobj.titletext = $("#titletextid").val();
		formobj.aliasname = $("#aliasnameid").val();
		formobj.module = $("#moduleid").val();
		formobj.characteristic = $("#characid").val();
		formobj.subcharacteristic = $("#subcharacid").val();
	
		formobj.recurrence = $("#reccuid").val();
		formobj.startmonth = $("#startmnthid").val();
		formobj.complianceperiod = $("#complainprdid").val();
		formobj.effectivedate = $("#effectid").val();
		formobj.textarea = $("#txtareaid").val();
		if (document.getElementById("active").checked) {
			formobj.active = "1";
		}
		else {
			formobj.active = "0";
		}
		formdetailsarr.push(formobj);
		console.log(formobj);
		//    formdetailsarr.push(formobj);
		var datatrans = {
	
			addformentity: formobj,
			addquestionentity: questionsdetailarr,
			optionentity: questionoptionarr
	
		}
		var formDTO = JSON.stringify(datatrans);
		console.log(formDTO)
	
		$.ajax({
			method: "POST",
			url: "/formdatasave",
			contentType: 'application/json; charset=utf-8',
			data: formDTO,
			success: function() {
				//alert("frmsuccess")
				window.location.href = "/form";
			}
	
		})
	}
	

})


//================================================================

$("#moduleid").change(function() {

	//alert();
	mod = document.getElementById("moduleid").value;

	$.ajax({
		method: "GET",
		url: "/modulechng/" + mod,
		success: function(respive) {
			//alert("modulesuss")
			//       console.log(respive)
			var select = document.getElementById("characid");


			document.getElementById('characid').options.length = 0
			//		$("#characid").selectpicker("refresh");

			for (let i = 0; i < respive.length; i++) {
				var opt = respive[i];
				//            console.log("option :"+opt);
				var el = document.createElement("option");

				el.text = opt[1];
				el.value = opt[0];
				select.appendChild(el);
			}

			$("#characid").selectpicker("refresh");

		}
	})

})

//====================================================================================

$("#characid").change(function() {

	let chara = document.getElementById("characid").value;

	$.ajax({
		method: "GET",
		url: "/characchng/" + chara,
		success: function(respivee) {
			//alert("charasuss")
			//        console.log(respivee)
			var select = document.getElementById("subcharacid");

			document.getElementById('subcharacid').options.length = 0
			//		$("#subcharacid").selectpicker("refresh");

			for (var i = 0; i < respivee.length; i++) {
				var opt = respivee[i];
				//            console.log("option :"+opt);
				var el = document.createElement("option");

				el.text = opt[1];
				el.value = opt[0];
				select.appendChild(el);
			}

			$("#subcharacid").selectpicker("refresh");
			/**/
		}
	})

})



//==============================================================

var questionid = 0;
var i = 1;
var questionsdetailarr = [];
var questionoptionarr = [];
var questiondatatablearr = [];

var formdetailsarr = [];
var globalid = 0;

$("#savebtnques").click(function() {
	//alert("savebtn");

	// =================================================================================================

	let dataobj = {};       //details of one ques
	dataobj.formid = $("#formid").val();
	if (globalid == 0) {
		dataobj.questionid = i;
	}
	else {
		dataobj.questionid = globalid;
	}

	dataobj.questionlabel = $("#queslabelid").val();

	dataobj.questionname = $("#quesnameid").val();
	dataobj.questiondesc = $("#quesdescid").val();

	let e = document.getElementById("quesanstypeid").value;

	dataobj.answertypeid = e;

	if (document.getElementById("active1").checked) {
		dataobj.isansrequired = "1";
	}
	else {
		dataobj.isansrequired = "0";
	}

	if (globalid == 0) {
		questionsdetailarr.push(dataobj);
	}
	else {
		for (let j = 0; j < questionsdetailarr.length; j++) {
			if (questionsdetailarr[j].questionid == dataobj.questionid) {
				questionsdetailarr.splice(j, 1);
				questionsdetailarr.push(dataobj);
			}
		}
	}



	//     console.log(dataobj);
	//===================================================================================================
	let datatableobj = {}

	if (globalid == 0) {
		datatableobj.questionid = i;
		datatableobj.action = '<tr><td class="text-center"> <span data-toggle="modal" data-target=".addquestion">  <a class="iconsuccesshover editentry" id = ' + i + ' data-toggle="tooltip" data-placement="bottom" data-original-title="Edit" href="javascript:void(0);">   <i class="fas fa-edit mr-1"></i> </a></span><a class=" delete_alert icondangerhover dltentry" id = "d' + i + '" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559"> <i class="far fa-trash-alt mr-1"></i> </a></td>';

	}
	else {
		datatableobj.questionid = globalid;
		datatableobj.action = '<tr><td class="text-center"> <span data-toggle="modal" data-target=".addquestion">  <a class="iconsuccesshover editentry" id = ' + globalid + ' data-toggle="tooltip" data-placement="bottom" data-original-title="Edit" href="javascript:void(0);">   <i class="fas fa-edit mr-1"></i> </a></span><a class=" delete_alert icondangerhover dltentry" id = "d' + globalid + '" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559"> <i class="far fa-trash-alt mr-1"></i> </a></td>';

	}

	datatableobj.questionlabel = $("#queslabelid").val();

	datatableobj.questionname = $("#quesnameid").val();
	let d = document.getElementById("quesanstypeid")
	datatableobj.answertypeid = d.options[d.selectedIndex].text;

	if (document.getElementById("active1").checked) {
		datatableobj.isansrequired = "Yes";
	}
	else {
		datatableobj.isansrequired = "No";
	}


	if (globalid == 0) {
		questiondatatablearr.push(datatableobj);
	}
	else {
		for (let j = 0; j < questiondatatablearr.length; j++) {
			if (questiondatatablearr[j].questionid == datatableobj.questionid) {
				questiondatatablearr.splice(j, 1);
				questiondatatablearr.push(datatableobj);
			}
		}
	}



	//===================================================================================================
	let quesobj = {};    //for options of one ques

	if (globalid == 0) {
		quesobj.questionid = i;
	}
	else {
		quesobj.questionid = globalid;
	}

	if (dataobj.answertypeid == 1 || dataobj.answertypeid == 2 || dataobj.answertypeid == 5 || dataobj.answertypeid == 6) {
		op = [];
		if (dataobj.answertypeid == 1) {
			$('.singlechoice').each(function() {
				op.push(this.value);
			})
		}
		else if (dataobj.answertypeid == 2) {
			$('.multiplechoice').each(function() {
				op.push(this.value);
			})
		}
		else if (dataobj.answertypeid == 5) {
			$('.singleselect').each(function() {
				op.push(this.value);
			})
		}
		else if (dataobj.answertypeid == 6) {
			$('.multipleselect').each(function() {
				op.push(this.value);
			})
		}
		quesobj.options = op.toString();
		quesobj.formid = $("#formid").val();
	}
	
	if (dataobj.answertypeid == 3 || dataobj.answertypeid == 4)
	{
		quesobj.formid = $("#formid").val();
		let xyz = "no options";
		quesobj.options = xyz.toString();
	}

	

	if (globalid == 0) {
		questionoptionarr.push(quesobj);
	}
	else {
		for (let j = 0; j < questionoptionarr.length; j++) {
			if (questionoptionarr[j].questionid == quesobj.questionid) {
				questionoptionarr.splice(j, 1);
				questionoptionarr.push(quesobj);

			}
		}
	}

	if (globalid == 0) {
		i++;
	}

	console.log(questionoptionarr);
	console.log(questionsdetailarr);
	//    console.log(questiondatatablearr);
	datatablex();

	globalid = 0;
});


$(document).ready(function() {

	datatablex();
	if (!formidji) {

		$.ajax({
			method: "GET",
			url: "/addbtn",
			success: function(res) {

				$("#formid").val(res)
				//alert(res);

			}

		})
	}

});
//======================================================================================================



$(document).on('click', '.editentry', function() {
	alert(this.id);
	globalid = this.id;

	for (let t = 0; t < questionsdetailarr.length; t++) {
		//       console.log(questiondatatablearr[i].questionid); 
		if (questionsdetailarr[t].questionid == this.id) {
			tmpquesobj = questionsdetailarr[t];
			break;
		}
	}
	//    console.log(tmpquesobj);
	//    console.log(tmpoptobj);

	$("#queslabelid").val(tmpquesobj.questionlabel);
	$("#quesnameid").val(tmpquesobj.questionname);
	$("#quesdescid").val(tmpquesobj.questiondesc);

	//    alert(tmpquesobj.isansrequired)
	if (tmpquesobj.isansrequired == 1) {
		document.getElementById("active1").checked = true;
	}
	else if (tmpquesobj.isansrequired == 0) {
		document.getElementById("active1").checked = false;
	}

	if (tmpquesobj.answertypeid == 1) {
		$("#quesanstypeid").val(1).selectpicker('refresh');
	}
	else if (tmpquesobj.answertypeid == 2) {
		$("#quesanstypeid").val(2).selectpicker('refresh');
	}
	else if (tmpquesobj.answertypeid == 3) {
		$("#quesanstypeid").val(3).selectpicker('refresh');
	}
	else if (tmpquesobj.answertypeid == 4) {
		$("#quesanstypeid").val(4).selectpicker('refresh');
	}
	else if (tmpquesobj.answertypeid == 5) {
		$("#quesanstypeid").val(5).selectpicker('refresh');
	}
	else if (tmpquesobj.answertypeid == 6) {
		$("#quesanstypeid").val(6).selectpicker('refresh');
	}
	else if (tmpquesobj.answertypeid == 7) {
		$("#quesanstypeid").val(7).selectpicker('refresh');
	}


	//======================================================================================

	let tmpoptobj = {};
	for (let y = 0; y < questionoptionarr.length; y++) {
		if (questionoptionarr[y].questionid == this.id) {
			tmpoptobj = questionoptionarr[y];
			break;
		}
	}
	//    console.log(tmpoptobj);

	let arrayofoptions = [];
	if(tmpoptobj.options){
		arrayofoptions = tmpoptobj.options.split(",");
		console.log(arrayofoptions);
	}
	
	//=========================================================================
	//option entry whille edit
	if (tmpquesobj.answertypeid == 1) {

		$('.singlechoicedata').show();
		for (let k = 0; k < arrayofoptions.length; k++) {
			var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control singlechoice' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singlechoiceadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singlechoiceremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

			$('table.singlechoicetable').append(addNewRow);
		}
		let p = 0;
		$('.singlechoice').each(function() {

			this.value = arrayofoptions[p];
			p++;
		})

		$('.singlechoice').each(function() {

			if (this.value == 'undefined' || this.value == "") {
				this.closest("tr").remove();
			}
		})

	}
	else if (tmpquesobj.answertypeid == 2) {
		$('.multichoicedata').show();
		for (let k = 0; k < arrayofoptions.length; k++) {
			var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control multiplechoice' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multichoiceadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multichoiceremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

			$('table.multichoicetable').append(addNewRow);
		}
		let p = 0;
		$('.multiplechoice').each(function() {

			this.value = arrayofoptions[p];
			p++;
		})

		$('.multiplechoice').each(function() {

			if (this.value == 'undefined' || this.value == "") {
				this.closest("tr").remove();
			}
		})

	}
	else if (tmpquesobj.answertypeid == 5) {
		$('.singleselectdata').show();
		for (let k = 0; k < arrayofoptions.length; k++) {
			var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control singleselect' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singleselectadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singleselectremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

			$('table.singleselecttable').append(addNewRow);
		}
		let p = 0;
		$('.singleselect').each(function() {

			this.value = arrayofoptions[p];
			p++;
		})

		$('.singleselect').each(function() {

			if (this.value == 'undefined' || this.value == "") {
				this.closest("tr").remove();
			}
		})

	}
	else if (tmpquesobj.answertypeid == 6) {
		$('.multiselectdata').show();
		for (let k = 0; k < arrayofoptions.length; k++) {
			var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control multipleselect' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multiselectadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multiselectremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

			$('table.multiselecttable').append(addNewRow);
		}
		let p = 0;
		$('.multipleselect').each(function() {

			this.value = arrayofoptions[p];
			p++;
		})

		$('.multipleselect').each(function() {

			if (this.value == 'undefined' || this.value == "") {
				this.closest("tr").remove();
			}
		})
	}
	else{
		console.log("for text box")
	}

})//edit end

//=================================================================================================================

$(document).on('click', '.dltentry', function() {

	let did = this.id;
	did = did.substring(1);
	//alert(did);

	for (let j = 0; j < questiondatatablearr.length; j++) {
		if (questiondatatablearr[j].questionid == did) {
			questiondatatablearr.splice(j, 1);
		}
	}
	for (let j = 0; j < questionsdetailarr.length; j++) {
		if (questionsdetailarr[j].questionid == did) {
			questionsdetailarr.splice(j, 1);
		}
	}

	console.log(questiondatatablearr);
	datatablex();

})

if (formidji) {
	//alert("formid = " + formidji)
	$("#formid").val(formidji);

	$.ajax({
		method: "GET",
		url: "/formdata/" + formidji,
		success: function(ress) {
			console.log(ress);
			//alert("formdata");

			$("#titletextid").val(ress.titletext);
			$("#aliasnameid").val(ress.aliasname);
			$("#moduleid").val(ress.module);

			//$("#subcharacid").val(ress.subcharacteristic);

			$("#reccuid").val(ress.recurrence);
			$("#startmnthid").val(ress.startmonth);
			$("#complainprdid").val(ress.complianceperiod);
			$("#effectid").val(ress.effectivedate);
			$("#txtareaid").val(ress.textarea);
			$("#moduleid").selectpicker("refresh");
			$("#moduleid").trigger('change')

			setTimeout(function() { $("#characid").val(ress.characteristic).selectpicker("refresh").change() }, 500);

			setTimeout(function() { $("#subcharacid").val(ress.subcharacteristic).selectpicker("refresh") }, 1000);

			$("#reccuid").selectpicker("refresh");

			$("#startmnthid").selectpicker("refresh");
		}
	})

	$.ajax({
		method: "GET",
		url: "/quesdata/" + formidji,
		success: function(resp) {
			//	alert("quessuccess");
			console.log("Questionss :"+resp);
			

			for (var q = 0; q < resp.length; q++) {

				quesjavaobj = {};
				quesjavaobj.answertypeid =  resp[q][0];
				quesjavaobj.isansrequired =  resp[q][1];
				quesjavaobj.questiondesc =  resp[q][2];
				quesjavaobj.questionid =  resp[q][3];
				quesjavaobj.questionlabel =  resp[q][4];
				quesjavaobj.questionname =  resp[q][5];
				quesjavaobj.formid = resp[q][6];
				console.log(quesjavaobj);
				
				questionsdetailarr.push(quesjavaobj);
				
				quesdtbleobj = {};
				
				if (resp[q][1]) {
					quesdtbleobj.isansrequired = "Yes";
				}
				else {
					quesdtbleobj.isansrequired = "No";
				}
				
				if (resp[q][0] == 1) {
					quesdtbleobj.answertypeid = "Single choice";
				}
				else if (resp[q][0] == 2) {
					quesdtbleobj.answertypeid = "Multiple Choice";
				}
				else if (resp[q][0] == 3) {
					quesdtbleobj.answertypeid = "Single Textbox";
				}
				else if (resp[q][0] == 4) {
					quesdtbleobj.answertypeid = "Multiline Textbox";
				}
				else if (resp[q][0] == 5) {
					quesdtbleobj.answertypeid = "Single Select Dropdown";
				}
				else if (resp[q][0] == 6) {
					quesdtbleobj.answertypeid = "Multi Select Dropdown";
				}
				else if (resp[q][0] == 7) {
					quesdtbleobj.answertypeid = "Date";
				}
				quesdtbleobj.questiondesc =  resp[q][2];
				quesdtbleobj.questionid =  resp[q][3];
				quesdtbleobj.questionlabel =  resp[q][4];
				quesdtbleobj.questionname =  resp[q][5];
				quesdtbleobj.action = '<tr><td class="text-center"> <span data-toggle="modal" data-target=".addquestion">  <a class="iconsuccesshover editentry" id = ' + resp[q][3] + ' data-toggle="tooltip" data-placement="bottom" data-original-title="Edit" href="javascript:void(0);">   <i class="fas fa-edit mr-1"></i> </a></span><a class=" delete_alert icondangerhover dltentry" id = "d' + resp[q][3] + '" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559"> <i class="far fa-trash-alt mr-1"></i> </a></td>';

				questiondatatablearr.push(quesdtbleobj);
				
			}
			datatablex();			
			i = ++q;
		}
	})//ques filled
	
	
	
	$.ajax({
		method : "GET",
		url : "/optdata/" +formidji,
		
		success : function(reppo)
		{
			//alert("optdtaa");
		//	console.log(reppo);
			
			
			for (let a = 0; a < reppo.length; a++)
			{
				optsdataobjj = {};
				optsdataobjj.formid = reppo[a][0];
				optsdataobjj.options = reppo[a][1];
				optsdataobjj.questionid = reppo[a][2];
				optsdataobjj.oid = reppo[a][3];
				
			//	console.log(optsdataobjj);
				questionoptionarr.push(optsdataobjj);
				
			}
			console.log(questionoptionarr);
			
			for(let a = 0; a < questionoptionarr.length; a++)
			{
				for(b = a+1; b < questionoptionarr.length; b++)
				{
					if(questionoptionarr[a].questionid == questionoptionarr[b].questionid)
					{
						questionoptionarr[a].options = questionoptionarr[a].options + "," +questionoptionarr[b].options;
			
						questionoptionarr.splice(b, 1);
					}
				}
			}
			console.log(questionoptionarr);
		}
		
		
	})
}

