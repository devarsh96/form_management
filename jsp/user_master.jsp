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
    <title>User Master</title>
    <link rel="icon" type="image/x-icon" href="assets/custom/images/favicon.png" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="assets/custom/css/imports.css" rel="stylesheet" type="text/css" />
    
</head>

<body class="sidebar-noneoverflow">
    <div class="preloader"></div>
    <!--  BEGIN NAVBAR  -->
	 <jsp:include page="header.jsp"/>  

    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN TOPBAR  -->

        <script src="assets/custom/js/menu.js"></script>
        <script language="javascript" type="text/javascript">
          document.getElementById('user_master').className = "menu single-menu active";
        </script>
        <!--  END TOPBAR  -->

        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="row pl-2 pr-2 pt-1 ">
                    <div class="col-xl-6 col-lg-6 col-sm-6 width40 colmspadding">
                        <div class="font-16">
                            <Span class="text-dark font-weight-bold">User Master</span>
                        </div>
                    </div>

                    <div class="col-xl-6 col-lg-6 col-sm-6 width60 colmspadding text-right">
                    <!-- href="/userexcel" -->
                        <a  class="btn btn btn-design m-b-5 userexcel">

                            <i class="fas fa-file-excel mr-1"></i> Excel

                        </a>
                        <!--  -->
                        <span data-toggle="modal" data-target=".addmodal" >
                            <button type="button" class="btn btn btn-design m-b-5" id="addButton">
                                <i class="fas fa-plus mr-1" id="addButton"></i>
                                Add
                            </button>
                        </span>
                      
                    </div>
                  
                </div>

                <div class="row pl-2 pr-2  pb-1">
                    <div class="col-xl-12 col-lg-12 col-sm-12 colmspadding">
                        <div class="card">
                            <div class="body">
                                <div class="row pl-2 pr-2">

                                    <div class="col-xl-2 col-lg-2 col-sm-3 colmspadding width50">
                                        <div class="form-group mb-2 ">
                                            <label>Name </label>
                                            <input type="text" class="form-control" placeholder="Enter Name" id = "searchname">
                                        </div>
                                    </div>
                                  
                                    <div class="col-xl-2 col-lg-2 col-sm-3 colmspadding width50">
                                        <div class="form-group mb-2 ">
                                            <label>Role </label>
                                            <select class="selectpicker form-control" data-style="" data-title=" Select " data-live-search="true" data-size="6" id = "searchrole">
                                                <option value="" selected="selected">Select</option>
                                                     <option value="0" selected>select
                                                    </option>
                                                    <option value="1">Admin
                                                    </option>
                                                    <option value="2">User
                                                    </option>
                                                   
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-xl-2 col-lg-3 col-sm-3 colmspadding width60">
                                        <div class="form-group mr-1 ml-1  mt-4">
                                            <a href="javascript:void(0)" class="btn btn-save mr-1 searchbtn">
                                                <i class="fa fa-search mr-1"></i>Search
                                            </a>
                                            <a href="javascript:void(0)" class="btn btn-design">
                                                <i class="fa fa-undo mr-1"></i>Reset
                                            </a>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                </div>

                <div class="datatable-design mb-0 pt-2 bg-white resize_wrapper tablelpaddingtop" style="top: 190px !important;">
                    <table id="form_table" class="table table-striped table-custom-hover nowrap  display" style="width: 100%;">
                        <thead>
                            <tr>

                                <th class="text-center" width="8%">Action</th>
                                <th width="5%">Active</th>
                                <th width="5%" class="text-center">Image</th>
                                <th>User Name</th>
                                <th>Email ID</th>
                                <th>Contact No</th>
                                <th>Valid Form</th>
                                <th>Vaild To</th>
                                <th>Gender</th>
                                <th>Role</th>
        
                            </tr>
                        </thead>
                        <tbody>
                        

						<%-- <c:forEach items="${users}" var="user">
						    <tr class = "datatblcls">
						   <td hidden>${user.id}</td> 
						    	<td class="text-center">
                                   
                                    <span data-toggle="modal" data-target=".addmodal">
                                        <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                            data-original-title="Edit" href="javascript:void(0);" >
                                            <i class="fas fa-edit mr-1 editbtn" id= "${user.id}"></i>
                                        </a>
                                    </span>
                                    <a class="  icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                        <i class="far fa-trash-alt mr-1 deletebtn" id="dl${user.id}"></i>
                                    </a>

                                </td>
                                <td>
                                    <span class="badge badge-success">Yes</span>
                                </td>
                                <td class="text-center">
                                    <a href="javascript:void(0)" data-toggle="popover" data-trigger="hover" data-html="true" data-placement="right" data-template='<div class="popover fade bs-popover-right" role="tooltip" x-placement="right"><div class="arrow"></div><h3 class="popover-header p-0 border_radius6"></h3></div>'
                                        data-title="<img src='${user.image}' height='150' class='border_radius6'>">
                                        <img src="${user.image}" alt="" width="27" height="27" class="img-thumbnail">
                                    </a>
                                </td>
						      <td>${user.first_name}${user.last_name}</td>
						      <td>${user.email}</td>
						      <td>${user.phone}</td>
						      <td>${user.valFro}</td>
						      <td>${user.valTo}</td>
						      						      
				 
						      
						      <c:if test="${user.gender == 1}">
						      <td><c:out value="Male"/></td> </c:if>
						      
						      <c:if test="${user.gender == 2}">  
						      <td> <c:out value="Female"/></td> </c:if>
						      
						      <c:if test="${user.roles == 1}">
						      <td><c:out value="Admin"/></td> </c:if>
						      
						      <c:if test="${user.roles == 2}">  
						      <td> <c:out value="User"/></td> </c:if>
						
						    </tr>
						
 						</c:forEach> --%>
 						
<!-- ============================================================================================================================== 						
 -->                          <%--   <tr>
                                <td class="text-center">
                                   
                                    <span data-toggle="modal" data-target=".addmodal">
                                        <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                            data-original-title="Edit" href="javascript:void(0);">
                                            <i class="fas fa-edit mr-1 "></i>
                                        </a>
                                    </span>
                                    <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                        <i class="far fa-trash-alt mr-1"></i>
                                    </a>

                                </td>
                                <td>
                                    <span class="badge badge-success">Yes</span>
                                </td>
                                <td class="text-center">
                                    <a href="javascript:void(0)" data-toggle="popover" data-trigger="hover" data-html="true" data-placement="right" data-template='<div class="popover fade bs-popover-right" role="tooltip" x-placement="right"><div class="arrow"></div><h3 class="popover-header p-0 border_radius6"></h3></div>'
                                        data-title="<img src='assets/custom/images/noimage.jpg' height='150' class='border_radius6'>">
                                        <img src="assets/custom/images/noimage.jpg" alt="" width="27" height="27" class="img-thumbnail">
                                    </a>
                                </td>
                                <td>Bill Rempel	</td>
                                <td class="text-unset">bill.rempel@gmail.com	</td>
                                <td>9898900011	</td>
                                <td>01-Mar-2020	</td>
                                <td>30-Nov-2020	</td>
                                <td>Male</td>
                                <td>User</td>
                                
                            </tr>


                            <tr>

                                <td class="text-center">
                                   
                                    <span data-toggle="modal" data-target=".addmodal">
                                        <a class=" iconsuccesshover" data-toggle="tooltip" data-placement="bottom"
                                            data-original-title="Edit" href="javascript:void(0);">
                                            <i class="fas fa-edit mr-1 "></i>
                                        </a>
                                    </span>
                                    <a class=" delete_alert icondangerhover" data-toggle="tooltip" data-placement="bottom" data-original-title="Delete" href="javascript:void(0);" aria-describedby="tooltip552559">
                                        <i class="far fa-trash-alt mr-1"></i>
                                    </a>

                                </td>
                                <td>
                                    <span class="badge badge-danger">No</span>
                                </td>
                                <td class="text-center">
                                    <a href="javascript:void(0)" data-toggle="popover" data-trigger="hover" data-html="true" data-placement="right" data-template='<div class="popover fade bs-popover-right" role="tooltip" x-placement="right"><div class="arrow"></div><h3 class="popover-header p-0 border_radius6"></h3></div>'
                                        data-title="<img src='assets/custom/images/noimage.jpg' height='150' class='border_radius6'>">
                                        <img src="assets/custom/images/noimage.jpg" alt="" width="27" height="27" class="img-thumbnail">
                                    </a>
                                </td>
                                <td>Amit Amin	</td>
                                <td class="text-unset">amit.amin@gmail.com		</td>
                                <td>7878789898	</td>
                                <td>02-Mar-2020	</td>
                                <td>31-Nov-2020	</td>
                                <td>Female</td>
                                <td>Admin</td>
                                
                            </tr> --%>

                         

                        </tbody>
                    </table>
                </div>
              

            </div>
        </div>
    </div>


    <div class="modal fade addmodal" data-keyboard="false" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Add/Edit User</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body modalscroll">
                    <div class="row p-10">
                        <div class="col-xl-12 lg-12 sm-12 colmspadding">

                            <div class="card m-b-5">
                                
                               <div class="body">
                                   <div class="row pl-2 pr-2">
                                    <div class="col-xl-3 col-lg-3 col-sm-3 col-xs-12 colmspadding">
                                        <div class="form-group mb-2">
                                          <label>Image</label>
                                          <div class="avatar-upload">
                                            <div class="avatar-edit">
                                                <input type="file" id="imageUpload1" class="imageupload-common" data-previewid="imagePreview1">
                                                <label for="imageUpload1"></label>
                                            </div>
                                            <a href="javascript:void(0)" class="removebtn">
                                                <i class="fa fa-trash text-danger "></i>
                                            </a>
                                            <div class="avatar-preview">
                                                <div>
                                                    <img id="imagePreview1" src="../assets/custom/images/noimage.jpg" width="100%" style="height: 154px;" >
                                                </div>
                                            </div>
                                        </div>
                                        <span class="text-danger" id="spanimage"> *</span>
                                        </div>
                                    </div>
                                    <div>
                                    </div>
                                    <div class="col-xl-9 col-lg-9 col-sm-9 col-xs-12 colmspadding">
                                        <div class="row pl-3 pr-3">
                                            <div class="col-xl-6 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>First Name </label><span class="text-danger" id="spanfirst"> *</span>
                                                  <input type="text" class="form-control" placeholder="Enter First Name" id="firstid" path="first_name">
                                                </div>
                                            </div>

                                            <div class="col-xl-6 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Last Name </label><span class="text-danger" id="spanlast"> *</span>
                                                  <input type="text" class="form-control" placeholder="Enter Last Name" id="lastid">
                                                </div>
                                            </div>

                                            <div class="col-xl-6 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Email ID </label><span class="text-danger" id="spanemail"> *</span>
                                                  <input type="text" class="form-control" placeholder="Enter Email ID" id="emailid">
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Contact No </label><span class="text-danger" id= "spancont"> *</span>
                                                  <input type="text" class="form-control" placeholder="Enter Contact No" id="contactid">
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Gender </label><span class="text-danger" id="spangender">*</span>
                                                  <select class="selectpicker form-control answercombo" data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id="gen">
                                      				<option value="0"  selected="selected">Select</option>
                                                    <option value="1">Male</option>
                                                    <option value="2">Female</option>
                                                  
                                                      
                                                  </select>
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Vaild From </label><span class="text-danger" id="spanvalidf"> *</span>
                                                  <div class="input-group date">
                                                    <input type="text" class="form-control selectdate" placeholder="Select  Date" id="validfromid" >
                                                    <span class="input-group-addon inputgroups">
                                                        <i class="far fa-calendar-alt"></i>
                                                    </span>
                                                </div>
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Vaild To </label><span class="text-danger" id="spanvalidt"> *</span>
                                                  <div class="input-group date">
                                                    <input type="text" class="form-control selectdate" placeholder="Select  Date" id="validtoid">
                                                    <span class="input-group-addon inputgroups">
                                                        <i class="far fa-calendar-alt"></i>
                                                    </span>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-2 col-sm-3 col-xs-12 colmspadding">
                                                <div class="form-group mb-2">
                                                  <label>Role </label><span class="text-danger" id="spanrole"> *</span>
                                                  <select class="selectpicker form-control answercombo" data-style="" data-title="Select" data-live-search="true" data-size="6" data-container="body" id="rls">
                                      				<option value="0" selected="selected">Select</option>
                                                    <option value="1">Admin</option>
                                                    <option value="2">User</option>
                                                   
                                                      
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
                </div>
                <div class="modal-footer">
                    <div class="row">
                        
                        <div class="col-xl-12 col-lg-6 col-sm-6 colmspadding  text-right width50">
                            <button type="submit" class="btn btn btn-save font-weight-bold mr-1"  id="savebtn">
                                <i class="fas fa-save mr-1"></i> Save
                            </button>
                            <a class="btn btn btn-design font-weight-bold" data-dismiss="modal" id="closebtn">
                                <i class="fas fa-times mr-1"></i> Close
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
 



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
    <script src="assets/js/elements/popovers.js"></script>
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
   <!-- <script src="customjs/usermaster.js"></script> -->
   
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
    
    <script>
    toastr.success('Welcome ' +"<% out.print(session.getAttribute("username"));%>");
    </script>
    
  
	
	<script src="customjs/usermaster.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
             $('.selectdate').closest('div').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: "dd/mm/yyyy",
            clearBtn: true
        });  
	
   
             
             /*   $('#validfromid').closest('div').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: "dd/mm/yyyy",
            clearBtn: true
        }); 
        
        $('#validtoid').datepicker({
            autoclose: true,
            todayHighlight: true,
            format: "dd/mm/yyyy",
            clearBtn: true
        }); */
        
       /*  $('#form_table').DataTable({
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

        }); */

             // For user image

             function readURL(input, previewid) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {

                    $(previewid).prop("src", e.target.result);
                    $(previewid).prop("style", "height: 154px;");

                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $(".imageupload-common").change(function() {
            let previewid = $(this).data('previewid');
            readURL(this, '#' + previewid);
        });
     
    </script>
</body>

</html>