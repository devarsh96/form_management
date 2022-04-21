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
    <title>Form</title>
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
    <!-- <script src="assets/custom/js/web_header.js"></script> -->
		<jsp:include page="header.jsp"/>  


    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN TOPBAR  -->

        <script src="assets/custom/js/menu.js"></script>
        <script language="javascript" type="text/javascript">
          document.getElementById('completed_form').className = "menu single-menu active";
        </script>
        <!--  END TOPBAR  -->

        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="row pl-2 pr-2 pt-1 pb-1">
                    <div class="col-xl-6 col-lg-6 col-sm-6 width40 colmspadding">
                        <div class="font-16">
                            <Span class="text-dark font-weight-bold">Completed Form</span>
                        </div>
                    </div>
                  

                </div>



                <div class="datatable-design mb-0 pt-2 bg-white resize_wrapper tablelpaddingtop">
                    <table id="form_table" class="table table-striped table-custom-hover nowrap  display" style="width: 100%;">
                        <thead>
                            <tr>

                                <th class="text-center" width="8%">Action</th>
                              
                                <th>Completed Date</th>
                                <th>Form #</th>
                                <th>Form Name</th>
                                <th>Created By</th>
                                


                            </tr>
                        </thead>
                        <tbody>

						
							<c:forEach items = "${datatabledata}" var = "dt">
                            <tr>

                                <td class="text-center">
                                    <span data-toggle="modal" data-target=".questionpreview">
                                        <a class=" iconinfohover prvansbtn" data-toggle="tooltip" data-placement="bottom" 
                                            data-original-title="Preview" href="javascript:void(0);">
                                            <i class="fas fa-eye mr-1 "></i>
                                        </a>
                                    </span>
                                   

                                </td>
                               
                                <td class = "creton">${dt[0]}</td>
                                <td>${dt[2]}</td>
                                <td>${dt[3]}</td>
                                <td class = "cretby">${dt[1]}</td>
                                
                            </tr>
                            </c:forEach>
 <!--
                            <tr>

                                <td class="text-center">
                                    <span data-toggle="modal" data-target=".questionpreview">
                                        <a class=" iconinfohover" data-toggle="tooltip" data-placement="bottom"
                                            data-original-title="Preview" href="javascript:void(0);">
                                            <i class="fas fa-eye mr-1 "></i>
                                        </a>
                                    </span>
                                 

                                </td>
                             
                                <td>02-07-2020	</td>
                                <td>F0RM-02	</td>
                                <td>251 Attwell Drive - Operator Form - Semi-Annually</td>
                                <td>Eric Hartwig	</td>
                                
                            </tr>

                            <tr>

                                <td class="text-center">
                                    <span data-toggle="modal" data-target=".questionpreview">
                                        <a class=" iconinfohover" data-toggle="tooltip" data-placement="bottom"
                                            data-original-title="Preview" href="javascript:void(0);">
                                            <i class="fas fa-eye mr-1 "></i>
                                        </a>
                                    </span>
                                   

                                </td>
                               
                                <td>19-07-2020	</td>
                                <td>F0RM-03	</td>
                                <td>1 Yonge Street - Contractor Form - Annual</td>
                                <td>Bill Rempel	</td>
                                
                            </tr>
 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <div class="modal modal-right fade fade  questionpreview" data-keyboard="false" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Question Preview</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body "style="max-height: 100%; height: auto; overflow-y: auto; overflow-x: hidden;">
                    <div class="row ">
                        <div class="col-xl-12 col-lg-12 col-sm-12">
                           <div class="card detailsbg m-b-5">
                               <div class="body">
                                    <div class="row pl-2 pr-2">
                                        <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding">
                                            <p class="mb-1 "><span class="font-weight-700">Form Title:</span> <span id= "spantitlee">
                                                </span></p>
                                                
                                                <p class="mb-0 "><span class="font-weight-700">Description:</span> <span id = "spandescc">
                                                    </span></p>
                                        </div>
                                    </div>
                               </div>
                           </div>

                           <div class="card m-b-5 quescard">
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
                                            <p class="font-weight-700 mb-1 text-justify">
                                                Answer
                                            </p>
                                            <p class="mb-1">Choice 1</p>   
                                           
                                     </div>
                                 </div>
                            </div>
                        </div>

                        <!-- <div class="card m-b-5">
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

                                        <p class="mb-1">Are the self-contained battery powered emergency lights
                                            inspected and tested at least once a month?</p>
                                            <p class="font-weight-700 mb-1 text-justify">
                                                Answer
                                            </p>
                                            <p class="mb-1">Choice 2</p>   
                                     </div>
                                 </div>
                            </div>
                        </div>

                        <div class="card m-b-5">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : 3</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            Fire Department Access
                                        </p>
                                        <p class="mb-1">Is all fire department access for the building(s) and fire protection equipment maintained and kept free of obstructions? This includes, but is not limited to streets, yards, roadways, sprinkler or standpipe connections, caps and access panels.</p>

                                        <p class="mb-1">Are the self-contained battery powered emergency lights
                                            inspected and tested at least once a month?</p>
                                            <p class="font-weight-700 mb-1 text-justify">
                                                Answer
                                            </p>
                                            <p class="mb-1">This includes, but is not limited to streets, yards, roadways, sprinkler or standpipe connections, caps and access panels.</p>   
                                     </div>
                                 </div>
                            </div>
                        </div>
                        <div class="card m-b-5">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : 4</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            Portable Extinguishers
                                        </p>
                                        <p class="mb-1">Are all portable fire extinguishers visually inspected every month?At minimum, the following list of items should be inspected:- extinguisher in proper location and mounted.- no obstructions to access or visibility.- fullness by pressure gauge reading (in operable range) and/or by hefting. - physical damage.- operating instructions visible.- safety seals and pull-ring in place.The fire extinguisher's tags, checklist or fire log book/records must be initialed and dated after each inspection.</p>

                                        <p class="font-weight-700 mb-1 text-justify">
                                            Answer
                                        </p>
                                        <p class="mb-1">This includes, but is not limited to streets, yards, roadways, sprinkler or standpipe connections, caps and access panels.</p>   
                                     </div>
                                 </div>
                            </div>
                        </div>
                        <div class="card m-b-5">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : 5</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            Water-Based Fire Protection Systems

                                        </p>
                                        <p class="mb-1">Are all supervisory signal services tested every six months for the items below?- valve supervisory switches- tank water level devices- building and tank water temperature supervisory devices- any other sprinkler system supervisory devices.

                                        </p>

                                        <p class="font-weight-700 mb-1 text-justify">
                                            Answer
                                        </p>
                                        <p class="mb-1">Choice 1</p>  
                                     </div>
                                 </div>
                            </div>
                        </div>
                        <div class="card m-b-5">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : 6</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            Safety to Life

                                        </p>
                                        <p class="mb-1">Are all supervisory signal services tested every six months for the items below?- valve supervisory switches- tank water level devices- building and tank water temperature supervisory devices- any other sprinkler system supervisory devices.

                                        </p>

                                        <p class="font-weight-700 mb-1 text-justify">
                                            Answer
                                        </p>
                                        <p class="mb-1">Choice 1, Choice 2, Choice 3</p>  
                                     </div>
                                 </div>
                            </div>
                        </div>
                        <div class="card m-b-5">
                            <div class="body">
                                 <div class="row pl-2 pr-2">
                                     <div class="col-xl-1 col-lg-1 col-sm-1 colmspadding">
                                        <span class="question">Q : 7</span>
                                    </div>
                                    <div class="col-xl-11 col-lg-11 col-sm-11 colmspadding">
                                        <p class="font-weight-700 mb-1 text-justify"><span class="text-danger">*</span>
                                            Fire Access
                                        </p>
                                        <p class="mb-1">Is all fire department access for the building(s) and fire protection equipment maintained and kept free of obstructions? This includes, but is not limited to streets, yards, roadways, sprinkler or standpipe connections, caps and access panels.

                                        </p>

                                        <p class="font-weight-700 mb-1 text-justify">
                                            Answer
                                        </p>
                                        <p class="mb-1">27-Sep-2021</p>  
                                     </div>
                                 </div>
                            </div> 
                        </div>-->
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
    <script src="assets/plugins/jquery_confirm_v3/jquery-confirm.min.js"></script>
    <script src="assets/plugins/jquery_confirm_v3/jquery-confirm-custom.js"></script>
    <script src="assets/plugins/scrollable/js/scrollabar.min.js"></script>
    <script src="assets/plugins/scrollable/js/scrollable.js"></script>
	<script src="customjs/completefrmjs.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
    
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
            dom: "<'row pl-2 pr-2'<'col-xl-9 col-lg-8 col-sm-8'pi><'col-xl-3 col-lg-4 col-sm-4'f>>" +
                "<'row pl-2 pr-2'<'col-xl-12 col-lg-12 col-sm-12'tr>>"

        });

      
    </script>
</body>

</html>