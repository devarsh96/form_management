<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Add/Edit Form</title>
    <link rel="icon" type="image/x-icon" href="assets/custom/images/favicon.png" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="assets/custom/css/imports.css" rel="stylesheet" type="text/css" />
    <style>
        #sortable {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 100%;
    }
    #sortable li {
        margin: 8px 0px 8px 0px;
        padding: 0.2em 0.4em;
        padding-left: 1.5em;
        font-size: 15px;
        height: 28px;
        line-height: 18px;
        cursor: move;
    }
    .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
        border: 1px solid #c5c5c5;
        background: #f6f6f6;
        font-weight: normal;
        color: #454545;
    }
    .ui-sortable-handle {
        -ms-touch-action: none;
        touch-action: none;
    }
    .queshadow {
        box-shadow: 0 1px 2px rgb(0 0 0 / 25%), 0 1px 1px rgb(0 0 0 / 11%) !important;
    }
    #sortable li span {
    position: absolute;
    margin-left: -1.3em;
}
.ui-icon {
    display: inline-block;
    vertical-align: middle;
    margin-top: 0.1em;
    position: relative;
    text-indent: -99999px;
    overflow: hidden;
    background-repeat: no-repeat;
}
.ui-icon-arrowthick-2-n-s {
    background-position: -128px -48px;
}
.ui-icon {
    width: 16px
px
;
    height: 16px;
}
    </style>
</head>

<body class="sidebar-noneoverflow">
    <div class="preloader"></div>
    <!--  BEGIN NAVBAR  -->
<!--     <script src="assets/custom/js/web_header.js"></script> -->
	
	<jsp:include page="header.jsp"/>  
	
    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN TOPBAR  -->

     <!--    <script src="assets/custom/js/menu.js"></script>
        <script language="javascript" type="text/javascript">
            document.getElementById('fill_form').className = "menu single-menu active";
          </script> -->
        <!--  END TOPBAR  -->

        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="row pl-2 pr-2 pt-1 pb-1">
                    <div class="col-xl-6 col-lg-6 col-sm-6 width40 colmspadding">
                        <div class="font-16">
                            <Span class="text-dark font-weight-bold">Add/Edit Form</span>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-sm-6 width60 colmspadding text-right">
                        
                       
                            <a href="form" class="btn btn btn-design m-b-5">
                                <i class="fas fa-arrow-left mr-1"></i>
                                Back
                            </a>
                       


                    </div>

                </div>
                <div class="row pl-2 pr-2">
                    <div class="col-xl-12 lg-12 sm-12 colmspadding">
                        <div class="card m-b-5">
                            <div class="header">
                                <h6 class="mb-0">
                                    <span class="text-info">Basic Details</span>

                                </h6>
                            </div>
                            <div class="body ">

                                <div class="row pl-2 pr-2">
                                  <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                      <div class="form-group mb-2">
                                       <label>Form #</label>
                                 <!--      ${formno[0]}-->   
                                        <input type="text" class="form-control" readonly value= "" id = "formid">
                                      </div>
                                  </div>
                                    <div class="col-xl-3 col-lg-3 col-sm-3 col-xs-12 colmspadding">
                                        <div class="form-group mb-2">
                                          <label>Title Text (English)</label> <span class="text-danger" id = "spantitlet">*</span>
                                          <input type="text" class="form-control field"  placeholder="Enter Title Text (English)" id = "titletextid" required="required">
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-lg-3 col-sm-3 col-xs-12 colmspadding">
                                        <div class="form-group mb-2">
                                          <label>Alias Name</label> <span class="text-danger" id = "spanalias">*</span>
                                          <input type="text" class="form-control field"  placeholder="Enter Alias Name" id = "aliasnameid" required="required">
                                        </div>
                                    </div>
                                </div>

                              



                            </div>
                        </div>
                        <div class="card m-b-5">
                            <div class="header">
                                <h6 class="mb-0">
                                    <span class="text-info">Form Attributes</span>

                                </h6>
                            </div>
                            <div class="body ">

                                <div class="row pl-2 pr-2">
                                  <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                      <div class="form-group mb-2">
                                        <label>Module</label> <span class="text-danger" id = "spanmodule">*</span>
                                        <select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id = "moduleid" required="required">
                                            <!-- <option value="1" >HAS Check</option>
                                            <option value="2">EHS</option>
                                            <option value="3">ENCheck</option> -->
                                         
                                            <c:forEach items="${modules}" var="module">
                                                <option value = "${module[0]}">${module[1]}</option>
                                            </c:forEach>

                                        </select>
                                      </div>
                                  </div>
                                  <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Characteristic </label> <span class="text-danger" id = "spanchar">*</span>
                                      <select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id= "characid" >
 <!--                                       
                                        <option value="0">Aboveground Storage Tanks</option>
                                       <option value="2">Air Emissions</option>
                                        <option value="3">Asbestos</option>
                                        <option value="4">Asbestos - Client Specific</option>
                                        <option value="5">Chemicals</option> -->
                                       
                                          
                                      </select>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Sub-Characteristic </label> <span class="text-danger" id = "spansubch">*</span>
                                      <select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id = "subcharacid">
                                        <option value="1">Abatement</option>
                                        <option value="2">Documentation</option>
                                        <option value="3">General</option>
                                        <option value="4">Inspection</option>
                                        <option value="5">Insurance</option>
                                       
                                          
                                      </select>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Recurrence  </label> <span class="text-danger" id = "spanrecc">*</span>
                                      <select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id = "reccuid">
                                        <!-- <option value="1">Annually</option>
                                        <option value="2">Bi-Monthly</option>
                                        <option value="3">Every 2 years</option>
                                        <option value="4">Every 3 years</option>
                                        <option value="5">Every 5 years</option>
                                        <option value="6">Monthly</option>
                                        <option value="7">One time</option>
                                        <option value="8">Quarterly</option>
                                        <option value="9">Semi-Annually</option> -->

                                        <c:forEach items="${recurrances}" var="recurr">
                                            <option value = "${recurr[0]}">${recurr[1]}</option>
                                        </c:forEach>
                                       
                                          
                                      </select>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Start Month   </label> <span class="text-danger" id = "spanstm">*</span>
                                      <select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id = "startmnthid">
                                        <!-- <option value="1">January</option>
                                        <option value="2">February</option>
                                        <option value="3">March</option>
                                        <option value="4">April</option>
                                        <option value="5">May</option>
                                        <option value="6">June</option>
                                        <option value="7">July</option>
                                        <option value="8">August</option>
                                        <option value="9">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option> -->

                                        <c:forEach items="${months}" var="month">
                                            <option value = "${month[0]}">${month[1]}</option>
                                        </c:forEach>
                                       
                                          
                                      </select>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Compliance Period  </label> <span class="text-danger" id = "spancperiod">*</span>
                                      <input type="text" class="form-control" placeholder="Compliance Period " id = "complainprdid">
                                    </div>
                                </div>
                                <div class="col-xl-2 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Effective Date </label> <span class="text-danger" id = "spaneffd">*</span>
                                      <div class="input-group date">
                                        <input type="text" class="form-control selectdate" placeholder="Select From Date" id = "effectid">
                                        <span class="input-group-addon inputgroups">
                                            <i class="far fa-calendar-alt"></i>
                                        </span>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-xl-1 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>&nbsp</label> 
                                      <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="active" checked="checked">
                                        <label class="form-check-label mb-0 ml-1" for="active">Active</label>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-xl-9 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                    <div class="form-group mb-2">
                                      <label>Text (English) <span class="text-danger" id = "spantexta">*</span></label> 
                                      <textarea class="form-control textareasize" id="txtareaid"></textarea>
                                    </div>
                                </div>
                                </div>

                              



                            </div>
                        </div>
                        <div class="card m-b-5">
                            <div class="header">
                                <div class="row ">
                                    <div class="col-xl-6 col-lg-6 col-sm-6 width50 mb-auto mt-auto">
                                        <h6 class="mb-0">
                                            <span class="text-info">Form Question </span>
                                           
                                        </h6>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-sm-6 width50 text-right">
                                        <span data-toggle="modal" data-target=".sortquestionmodal">
                                            <a href="javascript:void(0)" class="btn btn btn-design mr-1">
                                                <i class="fas fa-sort "></i>
                                                Sort
                                            </a>
                                        </span>
                                        <span data-toggle="modal" data-target=".addquestion">
                                            <a href="javascript:void(0)" class="btn btn btn-design ">
                                                <i class="fas fa-plus "></i>
                                                Add
                                            </a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="body ">

                                <div class="row pl-2 pr-2">
                                  <div class="col-xl-12 col-lg-12 col-sm-12 col-xs-12 colmspadding">
                                    <div class="datatable-design mb-0 bg-white">
                                        <table id="question_table" class="table table-striped table-custom-hover nowrap" style="width: 100%;">
                                            <thead>
                                                <tr>
                    
                                                    <th class="text-center" width="5%">Action</th>
                                                   
                                                    <th>Question #</th>
                                                    <th>Question Name</th>
                                                    <th>Answer Type</th>
                                                    <th>Required</th>
                    
                    
                                                </tr>
                                            </thead>
                                            <tbody>
                    
                                                
                    
                                                <!-- <tr>
                    
                                                    <td class="text-center">
                    
                                                        <span data-toggle="modal" data-target=".addquestion">
                                                            <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                                                data-original-title="Edit" href="javascript:void(0);">
                                                                <i class="fas fa-edit mr-1 "></i>
                                                            </a>
                                                        </span>
                                                        <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                                            <i class="far fa-trash-alt mr-1"></i>
                                                        </a>
                    
                                                    </td>
                                                    <td>FS-TRI-OPS-01	</td>
                                                    <td>Emergency Power Systems & Lighting	</td>
                                                    <td>Single choicex</td>
                                                    <td>Yes</td>
                                                    
                                                </tr> -->
                     <!--
                                                <tr>
                    
                                                    <td class="text-center">
                    
                                                        <span data-toggle="modal" data-target=".addquestion">
                                                            <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                                                data-original-title="Edit" href="javascript:void(0);">
                                                                <i class="fas fa-edit mr-1 "></i>
                                                            </a>
                                                        </span>
                                                        <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                                            <i class="far fa-trash-alt mr-1"></i>
                                                        </a>
                    
                                                    </td>
                                                    <td>FS-TRI-OPS-02</td>
                                                    <td>Fire Alarm & Voice Communication</td>
                                                    <td>Multiple Choice	</td>
                                                    <td>No</td>
                                                    
                                                </tr>
                    
                                                <tr>
                    
                                                    <td class="text-center">
                    
                                                        <span data-toggle="modal" data-target=".addquestion">
                                                            <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                                                data-original-title="Edit" href="javascript:void(0);">
                                                                <i class="fas fa-edit mr-1 "></i>
                                                            </a>
                                                        </span>
                                                        <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                                            <i class="far fa-trash-alt mr-1"></i>
                                                        </a>
                    
                                                    </td>
                                                    <td>FS-TRI-OPS-03</td>
                                                    <td>Fire Department Access	</td>
                                                    <td>Single Text	</td>
                                                    <td>Yes</td>
                                                    
                                                </tr>


                                                <tr>
                    
                                                    <td class="text-center">
                    
                                                        <span data-toggle="modal" data-target=".addquestion">
                                                            <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                                                data-original-title="Edit" href="javascript:void(0);">
                                                                <i class="fas fa-edit mr-1 "></i>
                                                            </a>
                                                        </span>
                                                        <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                                            <i class="far fa-trash-alt mr-1"></i>
                                                        </a>
                    
                                                    </td>
                                                    <td>FS-TRI-OPS-04</td>
                                                    <td>Fire Separations</td>
                                                    <td>Single Select</td>
                                                    <td>No</td>
                                                    
                                                </tr>


                                                <tr>
                   
                                                    <td class="text-center">
                    
                                                        <span data-toggle="modal" data-target=".addquestion">
                                                            <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                                                data-original-title="Edit" href="javascript:void(0);">
                                                                <i class="fas fa-edit mr-1 "></i>
                                                            </a>
                                                        </span>
                                                        <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                                            <i class="far fa-trash-alt mr-1"></i>
                                                        </a>
                    
                                                    </td>
                                                    <td>FS-TRI-OPS-05</td>
                                                    <td>Fire Separations</td>
                                                    <td>Multi Select	</td>
                                                    <td>No</td>
                                                    
                                                </tr> 
                     -->
                    
                                            </tbody>
                                        </table>
                                    </div>
                                  </div>
                                   
                                </div>

                              



                            </div>
                        </div>


                        <div class="card m-b-5">

                            <div class="body ">

                                <div class="row ">
                                    <div class="col-xl-12 col-lg-12 col-sm-12  colmspadding text-center">
                                        <!-- href="form.html" -->
                                        <a  class="btn btn btn-save mr-1 " id = "formsaveid">
                                            <i class="fa fa-save mr-1"></i> Save
                                        </a>

                                        <a href="/form" class="btn btn btn-design ">
                                            <i class="fas fa-times mr-1"></i> Cancel
                                        </a>

                                    </div>


                                </div>



                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>


    <div class="modal fade addquestion" data-keyboard="false" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Add/Edit Form Question</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">-</span>
                    </button>
                </div>
                <div class="modal-body modalscroll">
                    <div class="row p-10">
                        <div class="col-xl-12 lg-12 sm-12 colmspadding">

                            <div class="card m-b-5">
                                
                                <div class="body ">

                                    <div class="form-group mb-2 row  mb-2">
                                        <label class="col-xl-3 col-lg-4 col-sm-4 ">Question Label <span class="text-danger">*</span></label>
                                        <div class="col-xl-9 col-lg-8 col-sm-8 ">
                                            <input type="text" class="form-control " placeholder="Enter Question Label In English" id = "queslabelid">
                                         </div>
                                    </div>
                                    <div class="form-group mb-2 row  mb-2">
                                        <label class="col-xl-3 col-lg-4 col-sm-4 ">Question Name <span class="text-danger">*</span></label>
                                        <div class="col-xl-9 col-lg-8 col-sm-8 ">
                                            <input type="text" class="form-control " placeholder="Enter Question Name In English" id = "quesnameid">
                                         </div>
                                    </div>
                                   
                                    <div class="form-group mb-2 row mb-2">
                                        <label class="col-xl-3 col-lg-4 col-sm-4 ">Description</label>
                                        <div class="col-xl-9 col-lg-8 col-sm-8 ">
                                            <textarea class="form-control  textareasize" style="min-height: 45px !important;" placeholder="Enter Description In English" id= "quesdescid"></textarea>
                                         </div>
                                    </div>

                                    <div class="form-group mb-2 row mb-2">
                                        <label class="col-xl-3 col-lg-4 col-sm-4 ">Answer Type <span class="text-danger">*</span></label>
                                        <div class="col-xl-9 col-lg-8 col-sm-8 ">
                                            <select class="selectpicker form-control anstypecombo" data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id="quesanstypeid">
                                      
                                                <option value="0">No Answer Required</option>
                                                <option value="1">Single Choice</option>
                                                <option value="2">Multiple Choice</option>
                                                <option value="3">Single Textbox</option>
                                                <option value="4">Multiline Textbox</option>
                                                <option value="5">Single Select Dropdown</option>
                                                <option value="6">Multi Select Dropdown</option>
                                                <option value="7">Date</option>
                                               
                                                  
                                              </select>
                                         </div>
                                    </div>

                               
                                    <div class="singlechoicedata " style="display: none;">
                                        <hr class="mb-2 mt-2">
                                        <table class="table table-striped nowrap mb-0 singlechoicetable">
                                            <tbody>
                                                <tr>
                                                    <td class="text-center border-0" width="5%">
                                                        <i class="fa fa-arrow-right"></i>
                                                    </td>
                                                    <td class="border-0 p-1">
                                                        <div class="form-group mb-2 mb-0">
                                                            <input type="text" class="form-control singlechoice" 
                                                                placeholder="Enter an answer choice in English">
                                                        </div>
                                                    </td>
                                                    
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="singlechoiceadd">
                                                            <i class="far fa-plus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="">
                                                            <i class="far fa-minus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    
                                    <div class="multichoicedata" style="display: none;">
                                        <hr class="mb-2 mt-2">
                                        <table class="table table-striped nowrap mb-0 multichoicetable">
                                            <tbody>
                                                <tr>
                                                    <td class="text-center border-0" width="5%">
                                                        <i class="fa fa-arrow-right"></i>
                                                    </td>
                                                    <td class="border-0 p-1">
                                                        <div class="form-group mb-2 mb-0">
                                                            <input type="text" class="form-control multiplechoice"
                                                                placeholder="Enter an answer choice in English">
                                                        </div>
                                                    </td>
                                                
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="multichoiceadd">
                                                            <i class="far fa-plus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="">
                                                            <i class="far fa-minus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="singleselectdata" style="display: none;">
                                        <hr class="mb-2 mt-2">
                                        <table class="table table-striped nowrap mb-0 singleselecttable">
                                            <tbody>
                                                <tr>
                                                    <td class="text-center border-0" width="5%">
                                                        <i class="fa fa-arrow-right"></i>
                                                    </td>
                                                    <td class="border-0 p-1">
                                                        <div class="form-group mb-2 mb-0">
                                                            <input type="text" class="form-control singleselect"
                                                                placeholder="Enter an answer choice in English">
                                                        </div>
                                                    </td>
                                                    
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="singleselectadd">
                                                            <i class="far fa-plus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="">
                                                            <i class="far fa-minus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="multiselectdata" style="display: none;">
                                        <hr class="mb-2 mt-2">
                                        <table class="table table-striped nowrap mb-0 multiselecttable">
                                            <tbody>
                                                <tr>
                                                    <td class="text-center border-0" width="5%">
                                                        <i class="fa fa-arrow-right"></i>
                                                    </td>
                                                    <td class="border-0 p-1">
                                                        <div class="form-group mb-2 mb-0">
                                                            <input type="text" class="form-control multipleselect"
                                                                placeholder="Enter an answer choice in English">
                                                        </div>
                                                    </td>
                                                    
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="multiselectadd">
                                                            <i class="far fa-plus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                    <td class="text-center border-0 p-0" width="3%">
                                                        <a href="javascript:void(0)" class="">
                                                            <i class="far fa-minus-square font_20 m-t-5 text-default"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                              



                                </div>
                            </div>


                            <div class="card m-b-5 noansdisplaynone">
                                
                                <div class="body ">
                                    <div class="row pl-1 pr-1 ">

                                        <div class="col-xl-6 col-lg-6 col-sm-6 col-xs-6 colmspadding">
                                            <div class="form-group mb-2">
                                            
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="active1" >
                                                <label class="form-check-label mb-0 ml-1" for="active1">Require an Answer to This Question
                                                </label>
                                            </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-sm-6 col-xs-6 colmspadding hidedatevalidation" style="display: none;">
                                            <div class="form-group mb-2 row mb-2">
                                                <label class="col-xl-4 col-lg-4 col-sm-4 ">Date Format</label>
                                                <div class="col-xl-6 col-lg-6 col-sm-6 ">
                                                    <div class="input-group date">
                                                        <input type="text" class="form-control " placeholder="dd/mm/yyyy" readonly>
                                                        <span class="input-group-addon inputgroups">
                                                            <i class="far fa-calendar-alt"></i>
                                                        </span>
                                                    </div>
                                                 </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pl-1 pr-1 ">
                                        <div class="col-xl-6 col-lg-6 col-sm-6 col-xs-6 colmspadding hidetextvalidation" style="display: none;">
                                            <div class="form-group mb-2">
                                            
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="validatans">
                                                <label class="form-check-label mb-0 ml-1" for="validatans">Validate Answer for a Specific Format
                                                </label>
                                            </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-sm-6 col-xs-6 colmspadding showanswershouldbe" style="display: none;">
                                            <div class="form-group mb-2 row mb-2">
                                                <!-- <label class="col-xl-4 col-lg-4 col-sm-4 ">Date Format</label> -->
                                                <div class="col-xl-6 col-lg-6 col-sm-6 ">
                                                    <select class="selectpicker form-control answercombo" data-style="" data-title="Answer Should Be" data-live-search="true" data-size="6" data-container="body">
                                      
                                                        <option value="0">All Character</option>
                                                        <option value="1">Only Character</option>
                                                        <option value="2">Only Alphabet</option>
                                                        <option value="3">Alphabet & Number</option>
                                                          
                                                      </select>
                                                 </div>
                                            </div>
                                        </div>
                                    </div>
                                    

                               
                                </div>
                            </div>




                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        
                        <div class="col-xl-12 col-lg-6 col-sm-6 colmspadding  text-right width50">
                            <a class="btn btn btn-save font-weight-bold mr-1" data-dismiss="modal"id= "savebtnques">
                                <i class="fas fa-save mr-1" ></i> Save
                            </a>
                            <a class="btn btn btn-design font-weight-bold" data-dismiss="modal" id = "closebtnques">
                                <i class="fas fa-times mr-1"></i> Close
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="modal fade sortquestionmodal" data-keyboard="false" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-MD modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Sort Form Question</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">�</span>
                    </button>
                </div>
                <div class="modal-body modalscroll">
                    <div class="row ">
                        <div class="col-xl-12 col-lg-12 col-sm-12">
                            <ul id="sortable">
                                <li class="ui-state-default queshadow"><span
                                        class="ui-icon ui-icon-arrowthick-2-n-s"></span>FS-TRI-OPS-03 : Fire Department Access</li>
                                <li class="ui-state-default queshadow"><span
                                        class="ui-icon ui-icon-arrowthick-2-n-s"></span>FS-TRI-OPS-04 : Fire Separations</li>
                                <li class="ui-state-default queshadow"><span
                                        class="ui-icon ui-icon-arrowthick-2-n-s"></span>FS-TRI-OPS-01 : Emergency Power Systems & Lighting</li>
                                <li class="ui-state-default queshadow"><span
                                        class="ui-icon ui-icon-arrowthick-2-n-s"></span>FS-TRI-OPS-02 : Fire Alarm & Voice Communication</li>
                                <li class="ui-state-default queshadow"><span
                                        class="ui-icon ui-icon-arrowthick-2-n-s"></span>FS-TRI-OPS-05 : Portable Extinguishers</li>
                   
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                      
                        <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding  text-right width50">
                          
                            <a class="btn btn btn-design font-weight-bold" data-dismiss="modal">
                                <i class="fas fa-times mr-1"></i> Close
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>



    




    <!-- Start Footer -->
    <script src="assets/custom/js/footer.js"></script>
    <!-- Start Footer -->
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="assets/bootstrap/js/popper.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>

    <script>
    const formidji=${"'"}${formidji}${"'"};
        $(document).ready(function() {
            App.init();
        });
    </script>
    <script src="assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->

    <script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="assets/plugins/datatables/js/datatables.min.js"></script>
    <script src="assets/plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script src="assets/plugins/datatables/js/dataTables.colVis.js"></script>
    <script src="assets/plugins/datatables/js/dataTables.scrollResize.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <script src="assets/plugins/jquery_confirm_v3/jquery-confirm.min.js"></script>
    <script src="assets/plugins/jquery_confirm_v3/jquery-confirm-custom.js"></script>
    <script src="assets/plugins/scrollable/js/scrollabar.min.js"></script>
    <script src="assets/plugins/scrollable/js/scrollable.js"></script>
    <script src="customjs/formtable.js"></script>

    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
         $('.selectdate').closest('div').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: "dd/mm/yyyy",
            clearBtn: true
        });
  
//=================================================================================================        
        
        $(".anstypecombo").change(function () {
            if (this.value === '0') {
                $('.multiselectdata').hide();
                $('.multichoicedata').hide();
                $('.singlechoicedata').hide();
                $('.singleselectdata').hide();
                $('.hidetextvalidation').hide();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').hide();
            }

            else if (this.value === '1') {
                $('.singlechoicedata').show();
                $('.multichoicedata').hide();
                $('.singleselectdata').hide();
                $('.multiselectdata').hide();
                $('.hidetextvalidation').hide();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').show();
            }
            else if (this.value === '2') {
                $('.multichoicedata').show();
                $('.singlechoicedata').hide();
                $('.singleselectdata').hide();
                $('.multiselectdata').hide();
                $('.hidetextvalidation').hide();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').show();
            }
            else if (this.value === '3') {
                $('.multichoicedata').hide();
                $('.singlechoicedata').hide();
                $('.singleselectdata').hide();
                $('.multiselectdata').hide();
                $('.hidetextvalidation').show();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').show();
            }
            else if (this.value === '4') {
                $('.multichoicedata').hide();
                $('.singlechoicedata').hide();
                $('.singleselectdata').hide();
                $('.multiselectdata').hide();
                $('.hidetextvalidation').show();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').show();
            }
            else if (this.value === '5') {
                $('.singleselectdata').show();
                $('.multichoicedata').hide();
                $('.singlechoicedata').hide();
                $('.multiselectdata').hide();
                $('.hidetextvalidation').hide();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').show();
            }
            else if (this.value === '6') {
                $('.multiselectdata').show();
                $('.multichoicedata').hide();
                $('.singlechoicedata').hide();
                $('.singleselectdata').hide();
                $('.hidetextvalidation').hide();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').hide();
                $('.noansdisplaynone').show();
            }
            else if (this.value === '7') {
                $('.multiselectdata').hide();
                $('.multichoicedata').hide();
                $('.singlechoicedata').hide();
                $('.singleselectdata').hide();
                $('.hidetextvalidation').hide();
                $('.showanswershouldbe').hide();
                $('.hidedatevalidation').show();
                $('.noansdisplaynone').show();
            }
        });
        $(".answercombo").change(function () {
            if (this.value === '1') {
                $('.charformat').css("visibility", "visible");
            }
            else if (this.value === '2') {
                $('.charformat').css("visibility", "hidden");
            }
            else if (this.value === '3') {
                $('.charformat').css("visibility", "hidden");
            }
            else if (this.value === '4') {
                $('.charformat').css("visibility", "hidden");
            }
        });

        $('#validatans').change(function () {
            if (this.checked) {
                $(".showanswershouldbe").show();
            }
            else {
                $(".showanswershouldbe").hide();
            }
        });
           // Start Singlechoice add table
           $(".singlechoicetable").on("click", ".singlechoiceremove", function () {
            $(this).closest("tr").remove();
        });

        $(document).on("click", ".singlechoiceadd", function () {
            var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control singlechoice' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singlechoiceadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singlechoiceremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

            $('table.singlechoicetable').append(addNewRow);
        });
        // End Singlechoice add table

        // Start Multichoice add table
        $(".multichoicetable").on("click", ".multichoiceremove", function () {
            $(this).closest("tr").remove();
        });

        $(document).on("click", ".multichoiceadd", function () {
            var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control multiplechoice' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multichoiceadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multichoiceremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

            $('table.multichoicetable').append(addNewRow);
        });
        // End Multichoice add table

        // Start Singleselect add table
        $(".singleselecttable").on("click", ".singleselectremove", function () {
            $(this).closest("tr").remove();
        });

        $(document).on("click", ".singleselectadd", function () {
            var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control singleselect' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singleselectadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='singleselectremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

            $('table.singleselecttable').append(addNewRow);
        });
        // End Singleselect add table

        // Start Multiselect add table
        $(".multiselecttable").on("click", ".multiselectremove", function () {
            $(this).closest("tr").remove();
        });

        $(document).on("click", ".multiselectadd", function () {
            var addNewRow = "<tr><td class='text-center border-0' width='5%'><i class='fa fa-arrow-right' aria-hidden='true'></i></td><td class='border-0 p-1'><div class='form-group mb-2 mb-0'><input type='text' class='form-control multipleselect' placeholder='Enter an answer choice in English'></div></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multiselectadd'><i class='far fa-plus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td><td class='text-center border-0 p-0' width='3%'><a href='javascript:void(0)' class='multiselectremove'><i class='far fa-minus-square font_20 m-t-5 text-default' aria-hidden='true'></i></a></td></tr>";

            $('table.multiselecttable').append(addNewRow);
        });
        // End Multiselect add table

        $(function () {
            $("#sortable").sortable();
            $("#sortable").disableSelection();
        });


    </script>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<script src="customjs/addedit.js"></script>


</body>

</html>


<!-- 
let addentry = '<tr><td class="text-center"> <span data-toggle="modal" data-target=".addquestion">  <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom" data-original-title="Edit" href="javascript:void(0);">   <i class="fas fa-edit mr-1 "></i> </a></span><a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559"> <i class="far fa-trash-alt mr-1"></i> </a></td>'
    "<td>" +label+ "</td><td>" +name+ "</td><td>" +desc+ "</td><td>" +questypesel+ "</td><td>" + check + "</td></tr>" -->

<!-- var dataArray = [{
    "name": "1",
    "label": "hello",
    "choice": "multi",
    "required": "yes"
},
{
    "name": "2",
    "label": "hiii",
    "choice": "multi",
    "required": "noo"
},
{
    "name": "3",
    "label": "helloooo",
    "choice": "singlee",
    "required": "nooo"
},
{
    "name": "4",
    "label": "lol",
    "choice": "helloo",
    "required": "yes"
},

] -->

<!-- formquestion_datatable.clear().draw();

$('#formquestion_datatable').dataTable().fnAddData(arrayfordatatable);
setTimeout(() => {
    $('#formquestion_datatable').DataTable().columns.adjust();
}, 200);

} -->


<!-- var fdata = new FormData();

fdata.append("questionsdetailarr", new Blob([JSON.stringify(questionsdetailarr)], { type: "application/json;charset=UTF-8" }));

fdata.append("questionoptionarr", new Blob([JSON.stringify(questionoptionarr)], { type: "application/json;charset=UTF-8" }));
fdata.append("formdetailsarr", new Blob([JSON.stringify(formdetailsarr)], { type: "application/json;charset=UTF-8" })); -->