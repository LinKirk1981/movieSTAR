<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MovieSTAR影城管理</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<!-- /.login-logo -->
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
                <div class="slider-img">
                   <img src="${pageContext.request.contextPath}/user/images/logo5.png" class="logo" alt="">                      
                </div>
			</div>
			
			<c:if test="${not empty errorMessage}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${errorMessage}</strong>
				</div>
			</c:if>
			
			<div class="card-body">
				<h3><p class="login-box-msg">管理端登入</p></h3>

				<form action="<c:url value='/welcome/adminlogin'/>" method="post">
					<div class="input-group mb-3">
						<!-- 						<input class="form-control" type="email"  placeholder="請輸入員工帳號"> -->
						<input class="form-control" placeholder="請輸入員工帳號" name="username" type="text" autofocus id="username">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<!-- 						<input type="password" class="form-control" placeholder="請輸入員工密碼"> -->
						<input class="form-control" placeholder="請輸入員工密碼" name="password" type="password" id="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<!-- <div class="icheck-primary"> -->
							<div class="checkbox">
								<!-- <input type="checkbox" id="remember" >  -->
								<!-- <label for="remember"> 記住我 </label> -->
								<input name="MovieSTAR" type="checkbox">記住我
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
						</div>
						<br>
						<br>
						<br>
						<br>
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block" id="quick1" value="經理一鍵" />經理一鍵</button>
						</div>
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block" id="quick2" value="課長一鍵" />課長一鍵</button>
						</div>
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block" id="quick3" value="專員一鍵" />專員一鍵</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<!-- 				<div class="social-auth-links text-center mt-2 mb-3"> -->
				<!-- 					<a href="#" class="btn btn-block btn-primary"> <i -->
				<!-- 						class="fab fa-facebook mr-2"></i> Facebook帳號登入 -->
				<!-- 					</a> <a href="#" class="btn btn-block btn-danger"> <i -->
				<!-- 						class="fab fa-google-plus mr-2"></i> Google+帳號登入 -->
				<!-- 					</a> -->
				<!-- 				</div> -->
				<!-- /.social-auth-links -->

				<!-- 				<p class="mb-1"> -->
				<!-- 					<a href="forgot-password.html">記住我</a> -->
				<!-- 				</p> -->
<!-- 				<p class="mb-0"> -->
<!-- 					<a href="register.html" class="text-center">註冊管理員帳號</a> -->
<!-- 				</p> -->
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/administrator/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/administrator/dist/js/adminlte.min.js"></script>
		 <script>
            var quick1 = document.getElementById("quick1");
      		quick1.onclick = function(){
      			var c1 = document.getElementById("username");
      			var c2 = document.getElementById("password");
//                 var div0 = document.getElementById('result0c');
//                 var div1 = document.getElementById('result1c');
      			c1.value = "張泰山";
      			c2.value = "Aa123456";
//       			msg1.innerHTML = "";
//       			msg2.innerHTML = "";
      		} 
            var quick2 = document.getElementById("quick2");
      		quick2.onclick = function(){
      			var c1 = document.getElementById("username");
      			var c2 = document.getElementById("password");
//                 var div0 = document.getElementById('result0c');
//                 var div1 = document.getElementById('result1c');
      			c1.value = "高山青";
      			c2.value = "Aa123456";
//       			msg1.innerHTML = "";
//       			msg2.innerHTML = "";
      		} 
            var quick3 = document.getElementById("quick3");
      		quick3.onclick = function(){
      			var c1 = document.getElementById("username");
      			var c2 = document.getElementById("password");
//                 var div0 = document.getElementById('result0c');
//                 var div1 = document.getElementById('result1c');
      			c1.value = "何啟超";
      			c2.value = "Aa123456";
//       			msg1.innerHTML = "";
//       			msg2.innerHTML = "";
      		} 
        </script>
            
</body>
</html>
