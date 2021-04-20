<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- p為壯加入0331 -->

        <head>
            <meta charset="UTF-8">
            <meta name="google-signin-client_id"
                content="542797334433-kubelp1c26c1eop1pnmb7eaf2tjtjosp.apps.googleusercontent.com">

            <script src="https://apis.google.com/js/platform.js" async defer></script>

            <script>

                function onSignIn(googleUser) {

                    var profile = googleUser.getBasicProfile();
                    //console.log('name: ' + profile.getName());
                    //console.log('account: ' + profile.getEmail());

                    var name = profile.getName();
                    var account = profile.getEmail();

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "<c:url value='/googlemembers' />", true);
                    var jsonMember = {
                        "name": name,
                        "account": account,
                    }
                    //alert(JSON.stringify(jsonMember)); //p顯示JSON格式 得到JSON格式後就不要顯示了.
                    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                    xhr.send(JSON.stringify(jsonMember)); //JSON.stringify把物件轉換成字串格式. 然後send送出   
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
                            var result1 = JSON.parse(xhr.responseText);
                            signOut();

                            if (result1.gotoprofile != null) {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: msg1.innerHTML = "<font color='green' >" + result1.getgoogleusername + "<p>歡迎回來,趕快訂票開啟你美好的一天!</p>" + "</font>",
                                    showConfirmButton: true,
                                    timer: 10000
                                }).then(function () { window.location.assign("http://localhost:8080/MovieSTAR/"); })
                                
                            } else {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: "第三方登錄使用者請到會員中心輸入帳號手機即可使用MovieSTAR各項服務, 感謝您",
                                    showConfirmButton: true,
                                    timer: 10000
                                }).then(function () { window.location.assign("http://localhost:8080/MovieSTAR/profiles"); })

                            }
                        }
                    }
                }


                function signOut() {
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut().then(function () {
                        console.log('User signed out.');
                    });
                }
            </script>

        </head>
        <!-- p為壯加入0331 -->

        <div class="main ">
            <div class='preloader'>
                <div class='preloader-lod'></div>
                <div class='preloader-lod'></div>
                <div class='preloader-lod'></div>
                <div class='preloader-loding'>Movie Star…</div>
                <div class='large-square'></div>
            </div>
            <!-- HEADER SECTION -->
            <header class="header-section">
                <!-- HEADER TOP -->
                <div class="top-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 top-account sm-width sm-width-33">
                                <div class="top-accounts">
                                    <ul>
                                        <c:choose>
                                            <c:when test="${displayusername==null && googleloginname==null}">
                                                <li style="font-size: 18px;"><a href="<c:url value="
                                                        /register" />"><span class="fa fa-user"></span>創建</a></li>
                                                <li style="font-size: 18px;"><a href="<c:url value=" /login" />"><span
                                                        class="fa fa-lock"></span>登入</a></li>
                                            </c:when>
                                            <c:when test="${displayusername!=null || googleloginname!=null}">
                                                <li style="font-size: 18px;">
                                                    <form name="logoutForm" action="<c:url value='/signout'/>"
                                                        method="post" onclick="signOut();">
                                                        <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
                                                        <a href="javascript:document.logoutForm.submit();">
                                                            <i class="fa fa-sign-out fa-fw"></i> 登出</a>
                                                    </form>
                                                </li>
                                            </c:when>
                                        </c:choose>
                                        <li><span style="color: white;font-size: 18px">${displayusername}</span></li>
                                        <li><span style="color: white;font-size: 18px">${googleloginname}</span></li>
                                        <!--                                   <li><span style="color: white;" id="logininfo"></span></li>       -->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 top-message sm-width sm-width-33">
                                <div class="top-messages">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END HEADER TOP -->
                <!-- HEADER CENDER -->
                <div class="header-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 header-logos sm-width">
                                <div class="header-logo">
                                    <a href="<c:url value=" /" />">
                                    <img style="width: 40%;"
                                        src="${pageContext.request.contextPath}/user/images/logo.png" alt="logo">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 header-search-area sm-width">
                                <div class="header-search categorie-search-box">
                                    <form action="${pageContext.request.contextPath}/searchCinemaController"
                                        method="get">
                                        <div class="form-group">
                                            <select class="selectpicker" name="poscats">
                                                <option style="font-size: 18px;" value="0">電影名稱</option>
                                                <option style="font-size: 18px;" value="2">電影類型</option>
                                                <option style="font-size: 18px;" value="3">檔次</option>
                                            </select>
                                        </div>
                                        <input class="form-control" type="text" name="inputtext"
                                            style="font-size: 20px;height: 50px;color: white;" placeholder="請輸入"
                                            autocomplete="off">
                                        <button><span class="fa fa-search"></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END HEADER CENDER -->
                <!-- HEADER MENU -->
                <nav class="navbar navbar-default bootsnav navbar-sticky">
                    <div class="container">
                        <!-- Start Atribute Navigation -->
                        <div class="social">
                            <div class="attr-nav">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End Atribute Navigation -->
                        <!-- Start Header Navigation -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target="#navbar-menu">
                                <i class="fa fa-align-justify"></i>
                            </button>
                        </div>
                        <!-- End Header Navigation -->
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="navbar-menu">
                            <ul class="nav navbar-nav navbar-left" data-in="" data-out="">
                                <li class="dropdown">
                                    <a style="font-size: 25px;cursor: pointer;" class="dropdown-toggle"
                                        data-toggle="dropdown">會員中心</a>
                                    <ul class="dropdown-menu">
                                        <li style="font-size: 20px;"><a href="<c:url value=" /profiles" />">會員資料</a>
                                        </li>
                                        <li style="font-size: 20px;"><a href="<c:url value="
                                                /ticketHolder.controller" />">票夾</a></li>
                                        <li style="font-size: 20px;"><a href="<c:url value=" /msgRoom" />">聊天室</a></li>
                                        <%if (session.getAttribute("displayusername")!=null){ %>
                                            <li style="font-size: 20px;"><a href="<c:url value="
                                                    /msgAdminRoom" />">官方聊天室</a></li>
                                            <%}else{ %>
                                                <%} %>
                                    </ul>
                                </li>
                                <li><a style="font-size: 25px;" href="<c:url value=" /movieList.controller" />">電影時刻</a>
                                </li>

                                <li><a style="font-size: 25px;" href="<c:url value=" /findForum" />" >討論區</a></li>
                                <!--  class="dropdown-toggle" data-toggle="dropdown" 下箭頭-->
                                <!--                                 <ul class="dropdown-menu"> -->
                                <%-- <li><a href="<c:url value=" /msg.controller" />">留言板</a></li> --%>
                                    <%-- <li><a href="<c:url value=" /msgreport" />">ttttt</a></li> --%>
                                        <!--                                     <li><a href="blog-3.html">Blog 3</a></li> -->
                                        <!--                                     <li><a href="single-blog.html">single blog 1</a></li> -->
                                        <!--                                     <li><a href="single-blog-2.html">single Blog 2</a></li> -->
                                        <!--                                     <li><a href="single-blog-3.html">single Blog 3</a></li> -->
                                        <!-- </ul> -->

                                        <!--                             <li><a href="contact.html">Contacts</a></li> -->
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                </nav>
                <!-- END HEADER MENU -->
            </header>
            <!-- END HEADER SECTION -->
            <!-- END FOOTER SECTION -->

        </div>
        <script src="${pageContext.request.contextPath}/user/js/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/bootstrap/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/js/bootstrap-select.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/navmenu/bootsnav.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/animations/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/bootstrap-slider/jquery.touchSwipe.min.js"></script>
        <script
            src="${pageContext.request.contextPath}/user/assets/bootstrap-slider/bootstrap-touch-slider.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/jquery-ui/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/accordion/jquery.accordion.source.js"></script>
        <script src="${pageContext.request.contextPath}/user/assets/Video/video.popup.js"></script>
        <script src="${pageContext.request.contextPath}/user/js/jquery.syotimer.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/js/jquery.mixitup.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/js/tab.js"></script>
        <script src="${pageContext.request.contextPath}/user/js/main.js"></script>