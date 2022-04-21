<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link rel="icon" type="image/x-icon" href="assets/custom/images/favicon.png" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link rel="stylesheet" type="text/css" href="assets/custom/login/login.css">
    <link rel="stylesheet" type="text/css" href="assets/custom/css/imports.css">

    <link href="assets/css/authentication/form-2.css" rel="stylesheet" type="text/css" />
    <style>
      
        
        .home-bg {
            background-image: url('assets/custom/images/login_bg.png') !important;
            background-repeat: repeat;

        }
    </style>
    <!-- END GLOBAL MANDATORY STYLES -->


    <script>
       /*  function login() {
            if (document.loginForm.username.value == 'admin' && document.loginForm.password.value == 'admin') {
                localStorage.setItem("username", "admin");
                window.location.href = "form";

            } else {
                $(".errors  ").show();
                // document.getElementById('msg').style.display = 'block';
            }
        } */
    </script>


</head>

<body id="" class="form home-bg">
    <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">
                        <img src="assets/custom/images/e5logo.png" class="mb-1" alt="logo" width="150">
                      
                        <p class="border-bottom pb-2 mb-0">Login to your account.</p>

                        <form name="loginForm" class="loginforms text-left">
                            <div class="form">

                                <div id="username-field" class="field-wrapper input">
                                    <label for="username">Email Id</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
										<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
										<circle cx="12" cy="7" r="4"></circle>
									</svg>
                                    <input id="username" name="username" type="text" class="form-control" placeholder="Enter Username" style="text-transform: unset;">
                                </div>

                                <div id="password-field" class="field-wrapper input mb-1">
                                    <div class="d-flex justify-content-between">
                                        <label for="password">Password</label>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock">
										<rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
										<path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
									</svg>
                                    <input id="password" name="password" type="password" class="form-control" placeholder="Enter Password" style="text-transform: unset;">


									
                                </div>

								

                                <div class="  mt-3 text-center">

                                    <a href="javascript:void(0)" class="btn btn-save loginbtn" style="width: 100% !important; z-index: 9999;"><i
												class="fas fa-sign-out-alt mr-1"></i>Log In</a>

                                </div>

                                <div id="msg" class="errormsg" style="display: none;" >
                                    <span class="errors " id = "loginerrspan">Incorrect Login details !</span>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Footer -->
    <!-- <script src="assets/custom/js/footer.js"></script> -->
    <!-- Start Footer -->


    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="assets/bootstrap/js/popper.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/authentication/form-2.js"></script>

    <script>
        // var colors = new Array(
        //     [237, 27, 37], [254, 190, 16], [0, 175, 240], [37, 182, 106], );

        // var step = 0;

        // var colorIndices = [0, 1, 2, 3];

        // //transition speed
        // var gradientSpeed = 0.002;

        // function updateGradient() {

        //     if ($ === undefined) return;

        //     var c0_0 = colors[colorIndices[0]];
        //     var c0_1 = colors[colorIndices[1]];
        //     var c1_0 = colors[colorIndices[2]];
        //     var c1_1 = colors[colorIndices[3]];

        //     var istep = 1 - step;
        //     var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
        //     var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
        //     var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
        //     var color1 = "rgb(" + r1 + "," + g1 + "," + b1 + ")";

        //     var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
        //     var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
        //     var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
        //     var color2 = "rgb(" + r2 + "," + g2 + "," + b2 + ")";

        //     $('#gradient').css({
        //         background: "-webkit-gradient(linear, left top, right top, from(" + color1 + "), to(" + color2 + "))"
        //     }).css({
        //         background: "-moz-linear-gradient(left, " + color1 + " 0%, " + color2 + " 100%)"
        //     });

        //     $('#gradient2').css({
        //         background: "-webkit-gradient(linear, left top, right top, from(" + color1 + "), to(" + color2 + "))"
        //     }).css({
        //         background: "-moz-linear-gradient(left, " + color1 + " 0%, " + color2 + " 100%)"
        //     });

        //     step += gradientSpeed;
        //     if (step >= 1) {
        //         step %= 1;
        //         colorIndices[0] = colorIndices[1];
        //         colorIndices[2] = colorIndices[3];
        //         colorIndices[1] = (colorIndices[1] + Math.floor(1 + Math.random() * (colors.length - 1))) % colors.length;
        //         colorIndices[3] = (colorIndices[3] + Math.floor(1 + Math.random() * (colors.length - 1))) % colors.length;

        //     }
        // }

        // setInterval(updateGradient, 10);
      /*   $('#username').focus();
        $(document).keypress(function(e) {
            if (e.which == 13) {
                login();
            }
        }); */
    </script>
    <script src = "customjs/login.js"></script>
</body>

</html>