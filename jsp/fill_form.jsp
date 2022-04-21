<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Fill Form</title>
    <link rel="icon" type="image/x-icon" href="assets/custom/images/favicon.png" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="assets/custom/css/imports.css" rel="stylesheet" type="text/css" />
    <style>
        .detailsbg {
     
      
        box-shadow: 0 2px 3px rgba(0, 0, 0, 0.25), 0 4px 4px rgba(0, 0, 0, 0.11);
        background: rgba(212, 228, 239, 1);
        background: -moz-linear-gradient(left, rgba(212, 228, 239, 1) 0%, rgba(212, 228, 239, 1) 98%, rgba(212, 228, 239, 1) 100%);
        background: -webkit-gradient(left top, right top, color-stop(0%, rgba(212, 228, 239, 1)), color-stop(98%, rgba(212, 228, 239, 1)), color-stop(100%, rgba(212, 228, 239, 1)));
        /* background: -webkit-linear-gradient(left, rgba(212, 228, 239, 1) 0%, rgba(212, 228, 239, 1) 98%, rgba(212, 228, 239, 1) 100%); */
        background: -o-linear-gradient(left, rgba(212, 228, 239, 1) 0%, rgba(212, 228, 239, 1) 98%, rgba(212, 228, 239, 1) 100%);
        background: -ms-linear-gradient(left, rgba(212, 228, 239, 1) 0%, rgba(212, 228, 239, 1) 98%, rgba(212, 228, 239, 1) 100%);
        /* background: linear-gradient(to right, rgba(212, 228, 239, 1) 0%, rgba(212, 228, 239, 1) 98%, rgba(212, 228, 239, 1) 100%); */
    }
    .question {
    margin-top: 0;
    margin-left: 0px;
    background: royalblue;
    color: white;
    padding: 0.2em 0.4em;
    margin-right: 0px;
    font-weight: 700;
    font-size: 100%;
    display: block;
    border-radius: 5px;
    text-align: center;
}
    </style>
</head>

<body class="sidebar-noneoverflow">

    <div class="preloader"></div>
    <!--  BEGIN NAVBAR  -->
  <!--    <script src="assets/custom/js/web_header.js"></script>  -->
		<jsp:include page="header.jsp"/>  
	 

    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN TOPBAR  -->

        <script src="assets/custom/js/menu.js"></script>
        <script language="javascript" type="text/javascript">
          document.getElementById('fill_form').className = "menu single-menu active";
        </script>
        <!--  END TOPBAR  -->

        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="row pl-2 pr-2 pt-1 ">
                    <div class="col-xl-6 col-lg-6 col-sm-6 width40 colmspadding">
                        <div class="font-16">
                            <Span class="text-dark font-weight-bold">Fill Form</span>
                        </div>
                    </div>
                  
                </div>

                <div class="row pl-2 pr-2  pb-1">
                    <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding">
                        <div class="card">
                            <div class="body">
                                <div class="row pl-2 pr-2">
                                  
                                    <div class="col-xl-4 col-lg-2 col-sm-3 colmspadding width50">
                                        <div class="form-group mb-2 ">
                                            <label>Form Name </label>
                                            <select class="selectpicker form-control" data-style="" data-title=" Select User" data-live-search="true" data-size="6" id = "dropboxfrm">
                                        
                                                 <c:forEach items="${formdtt}" var="fdt">
                                               <option value = "${fdt.formid}">${fdt.formid} ${fdt.titletext} </option> 
                                           		 </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-xl-2 col-lg-3 col-sm-3 colmspadding width60">
                                        <div class="form-group mr-1 ml-1  mt-4">
                                            <a href="javascript:void(0)" class="btn btn-save mr-1 searchbtn">
                                                <i class="fa fa-search mr-1"></i>Search
                                            </a>
                                            <a href="javascript:void(0)" class="btn btn-design resetbtn">
                                                <i class="fa fa-undo mr-1"></i>Reset
                                            </a>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pl-2 pr-2  pb-1 showform" style="display: none;">
                    <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding">
                        <div class="card " style="background-color: #F3F3F3;">
                            <div class="body">
                                <div class="row pl-2 pr-2">
                                  
                                    <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding forappend">
                                        <div class="card detailsbg mb-2">
                                            <div class="body">
                                                 <div class="row pl-2 pr-2">
                                                     <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding">
                                                         <p class="mb-1 "><span class="font-weight-700">Form Title:</span> <span id = "filltitle">
                                                            </span></p>
                                                             <p class="mb-0 "><span class="font-weight-700">Description:</span> <span id= "filldesc">
                                                                 </span></p>
                                                     </div>
                                                 </div>
                                            </div>
                                        </div>
             
                                        <div class="card mb-2 quescard">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 1</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Emergency Power Systems & Lighting
                                                     </p>
                                                     <p class="mb-1">Are the self-contained battery powered emergency lights
                                                         inspected and tested at least once a month?</p>
             
                                                         <div class="form-check-inline mr-4">
                                                             <label class="form-check-label">
                                                               <input type="radio" class="form-check-input" name="optradio">Choice 1
                                                             </label>
                                                           </div>
                                                           <div class="form-check-inline mr-4">
                                                             <label class="form-check-label">
                                                               <input type="radio" class="form-check-input" name="optradio">Choice 2
                                                             </label>
                                                           </div>
                                                           <div class="form-check-inline mr-4">
                                                             <label class="form-check-label">
                                                               <input type="radio" class="form-check-input" name="optradio" >Choice 3
                                                             </label>
                                                           </div>
             
                                                           <div class="form-check-inline mr-4">
                                                             <label class="form-check-label">
                                                               <input type="radio" class="form-check-input" name="optradio" >Choice 4
                                                             </label>
                                                           </div>
                                                  </div>
                                              </div>
                                         </div>
                                     </div>
             
                                  <!--    <div class="card mb-2">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 2</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Fire Alarm & Voice Communication
                                                     </p>
                                                     <p class="mb-1">Is the status of the trouble signal indicators on the fire panel checked every day?</p>
             
                                                     <div class="form-check-inline mr-4">
                                                         <label class="form-check-label">
                                                           <input type="checkbox" class="form-check-input" value="">Choice 1
                                                         </label>
                                                       </div>
                                                       <div class="form-check-inline mr-4">
                                                         <label class="form-check-label">
                                                           <input type="checkbox" class="form-check-input" value="">Choice 2
                                                         </label>
                                                       </div>
                                                       <div class="form-check-inline mr-4">
                                                         <label class="form-check-label">
                                                           <input type="checkbox" class="form-check-input" value="" >Choice 3
                                                         </label>
                                                       </div>
                                                       <div class="form-check-inline mr-4">
                                                         <label class="form-check-label">
                                                           <input type="checkbox" class="form-check-input" value="" >Choice 3
                                                         </label>
                                                       </div>
                                                  </div>
                                              </div>
                                         </div>
                                     </div>
             
                                     <div class="card mb-2">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 3</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-6 col-sm-6 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Fire Department Access
                                                     </p>
                                                     <p class="mb-1">Is all fire department access for the building(s) and fire protection equipment maintained and kept free of obstructions? This includes, but is not limited to streets, yards, roadways, sprinkler or standpipe connections, caps and access panels.</p>
             
                                                    <input type="text" class="form-control" placeholder="Enter Your Answer">
                                                  </div>
                                              </div>
                                         </div>
                                     </div>
                                     <div class="card mb-2">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 4</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-6 col-sm-6 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Portable Extinguishers
                                                     </p>
                                                     <p class="mb-1">Are all portable fire extinguishers visually inspected every month?At minimum, the following list of items should be inspected:- extinguisher in proper location and mounted.- no obstructions to access or visibility.- fullness by pressure gauge reading (in operable range) and/or by hefting. - physical damage.- operating instructions visible.- safety seals and pull-ring in place.The fire extinguisher's tags, checklist or fire log book/records must be initialed and dated after each inspection.</p>
             
                                                     <textarea class="form-control textareasize" placeholder="Enter Your Answer"></textarea>
                                                  </div>
                                              </div>
                                         </div>
                                     </div>
                                     <div class="card mb-2">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 5</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-6 col-sm-6 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Water-Based Fire Protection Systems
             
                                                     </p>
                                                     <p class="mb-1">Are all supervisory signal services tested every six months for the items below?- valve supervisory switches- tank water level devices- building and tank water temperature supervisory devices- any other sprinkler system supervisory devices.
             
                                                     </p>
             
                                                     <select class="selectpicker form-control " data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body">
                                                         <option value="1" >Choice 1</option>
                                                         <option value="2">Choice 2</option>
                                                         <option value="3">Choice 3</option>
                                                      
                                                         
                                                     </select>
                                                  </div>
                                              </div>
                                         </div>
                                     </div>
                                     <div class="card mb-2">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 6</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-6 col-sm-6 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Safety to Life
             
                                                     </p>
                                                     <p class="mb-1">Are all supervisory signal services tested every six months for the items below?- valve supervisory switches- tank water level devices- building and tank water temperature supervisory devices- any other sprinkler system supervisory devices.
             
                                                     </p>
             
                                                     <select class="selectpicker form-control " data-style=""  multiple data-selected-text-format="count" data-actions-box="true"data-title="Select" data-live-search="true" data-size="6" data-container="body">
                                                         <option value="1" >Choice 1</option>
                                                         <option value="2">Choice 2</option>
                                                         <option value="3">Choice 3</option>
                                                      
                                                         
                                                     </select>
                                                  </div>
                                              </div>
                                         </div>
                                     </div>
                                     <div class="card mb-2">
                                         <div class="body">
                                              <div class="row pl-2 pr-2">
                                                  <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                                     <span class="question">Q : 7</span>
                                                 </div>
                                                 <div class="col-xl-11 col-lg-6 col-sm-6 colmspadding">
                                                     <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                                         Fire Access
                                                     </p>
                                                     <p class="mb-1">Is all fire department access for the building(s) and fire protection equipment maintained and kept free of obstructions? This includes, but is not limited to streets, yards, roadways, sprinkler or standpipe connections, caps and access panels.
             
                                                     </p>
             
                                                     <div class="input-group date" style="width: 15%;">
                                                         <input type="text" class="form-control selectdate" placeholder="Select From Date">
                                                         <span class="input-group-addon inputgroups">
                                                             <i class="far fa-calendar-alt"></i>
                                                         </span>
                                                     </div>
                                                  </div>
                                              </div>
                                         </div>
                                     </div> -->
                                     <div class="card mb-0">

                                        <div class="body ">
            
                                            <div class="row ">
                                                <div class="col-xl-12 col-lg-12 col-sm-12  colmspadding text-center">
            
                                                    <a href="javascript:void(0)" class="btn btn btn-save mr-1 fillformsave">
                                                        <i class="fa fa-save mr-1 "></i> Save
                                                    </a>
            
                                                    <a href="#" class="btn btn btn-design fillformcancel">
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
	
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
      
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
          $('.selectdate').closest('div').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: "dd/mm/yyyy",
            clearBtn: true
        });


        
     
    </script>
    <script src = "customjs/fill_form.js"></script>
</body>

</html>