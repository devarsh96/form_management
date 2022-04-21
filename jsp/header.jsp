<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class='header-container'> 
 <header class='header navbar navbar-expand-sm navbar-fixed'> 
 <a href='javascript:void(0);' class='sidebarCollapse' data-placement='bottom'> <i class='fas fa-bars '></i></a> 
 <div class='nav-logo align-self-center'> 
 <a class='navbar-brand' ><img alt='logo' src='assets/custom/images/e5logo.png'> <span class='navbar-brand-name'></span></a> 
 </div> 
 <ul class='navbar-item flex-row mr-auto'> 
 <!--  <span class='header-title '>Data Tracking</span>  -->
 </ul> 


 <ul class='navbar-item flex-row nav-dropdowns '> 



 <li class='nav-item dropdown user-profile-dropdown'> 
 <a href='javascript:void(0);' class='nav-link dropdown-toggle user d-flex' id='user-profile-dropdown' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'> 
 
 <c:forEach items="${headerdata}" var = "hr"> 
 <div class='media'> 
 <div class='media-body align-self-center'> 
 <h6 class='user-name mb-0 usertextover' > ${hr[0]} </h6> 
 </div> 
 <img src=' ${hr[2]} ' class='img-fluid mr-2' alt='admin-profile' style='height: 30px; width: 30px; border: solid 1px #eee;'> 
 </div> 
 </c:forEach>
 </a> 
 </li> 

 <li class='nav-item dropdown user-profile-dropdown ml-0'> 
  <a href='/' data-toggle='tooltip' data-placement='bottom' data-original-title='Log Out'  class='nav-link dropdown-toggle user d-flex' id='user-profile-dropdown' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
 <i class='fas fa-sign-out-alt'></i> 
 </a>
 </li> 


 </ul> 
 </header> 
 </div> 

 <div class='modal fade changepasswordmodal' data-keyboard='false' data-backdrop='static' role='dialog' aria-hidden='true'> 
 <div class='modal-dialog modal-md modal-dialog-centered' role='document'> 
 <div class='modal-content'> 
 <div class='modal-header'> 
 <span class='modal-title'>Change Password </span> 
 <button type='button' class='close' data-dismiss='modal' aria-label='Close'> 
 <span aria-hidden='true'>×</span> 
 </button> 
 </div> 
 <div class='modal-body'> 
 <div class='row p-10'> 
 <div class='col-xl-12 lg-12 sm-12 colmspadding'> 
 <div class='card mb-0'> 
 <div class='body'> 
 <div class='form-group row mr-1 ml-1 mb-2 mt-1'> 
 <label class='col-xl-5 col-lg-5 col-sm-5 colmspadding'>Old Password</label> 
 <div class='col-xl-7 col-lg-7 col-sm-7 colmspadding'> 
 <div class='input-group'> 
 <div class='input-group-prepend'> 
 <span class='input-group-text'><i class='fa fa-key'></i></span> 
 </div> 
 <input type='password' class='form-control'> 
 </div> 
 </div> 
 </div> 

 <div class='form-group row mr-1 ml-1 mb-2'> 
 <label class='col-xl-5 col-lg-5 col-sm-5 colmspadding'>New Password</label> 
 <div class='col-xl-7 col-lg-7 col-sm-7 colmspadding'> 
 <div class='input-group'> 
 <div class='input-group-prepend'> 
 <span class='input-group-text'><i class='fa fa-key'></i></span> 
 </div> 
 <input type='password' class='form-control'> 
 </div> 
 </div> 
 </div> 

 <div class='form-group row mr-1 ml-1 mb-1'> 
 <label class='col-xl-5 col-lg-5 col-sm-5 colmspadding'>Confirm New Password</label> 
 <div class='col-xl-7 col-lg-7 col-sm-7 colmspadding'> 
 <div class='input-group'> 
 <div class='input-group-prepend'> 
 <span class='input-group-text'><i class='fa fa-key'></i></span> 
 </div> 
 <input type='password' class='form-control'> 
 </div> 
 </div> 
 </div> 
 </div> 
 </div> 
 </div> 
 </div> 
 </div> 
 <div class='modal-footer'> 
 <a class='btn btn btn-save mr-1' data-dismiss='modal'> 
 <i class='fas fa-save mr-1'></i> Update 
 </a> 

 <a class='btn btn btn-design' data-dismiss='modal'> 
 <i class='fas fa-times mr-1'></i> Close 
 </a> 
 </div> 
 </div> 
 </div> 
 </div> 
