<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!doctype html>
		<html class="no-js" lang="en">

		<head>

			<script src="https://apis.google.com/js/platform.js" async defer></script>
			<meta name="google-signin-client_id"
				content="542797334433-kubelp1c26c1eop1pnmb7eaf2tjtjosp.apps.googleusercontent.com">
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta name="description" content="">
			<meta name="author" content="">
			<jsp:include page="../user/css.jsp" />
			<style type="text/css">
				::placeholder {
					font-style: italic;
					color: yellow;
					font-size: 18px;
					padding: 5px;
				}
			</style>
			
		</head>

		<script type="text/javascript">
			let flag1 = false, flag2 = false;

			window.onload = function () {
				var submit = document.getElementById("submit");
				var msg1 = document.getElementById("msg1");
				var msg2 = document.getElementById("msg2");
				var account = document.getElementById("account");
				var password = document.getElementById("password");

				account.onblur = function () {
					if (!account.value) {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: msg1.innerHTML = "<font color='red' >請確認使用者帳號</font>",
							showConfirmButton: false,
							timer: 5000
						})
						flag1 = false;
						return;
					} else {
						msg1.innerHTML = "";
					}
				}

				password.onblur = function () {
					if (!password.value) {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: msg2.innerHTML = "<font color='red' >請輸入密碼</font>",
							showConfirmButton: false,
							timer: 5000
						})
						flag2 = false;
						return;
					} else {
						msg2.innerHTML = "";
						flag2 = true;
					}
				}

				// account.onblur = function () {
				// 	var xhr = new XMLHttpRequest();
				// 	xhr.open("Post", "<c:url value='/checkMemberByAccount' />", true);
				// 	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				// 	xhr.send("account=" + account.value);
				// 	var message = "";
				// 	xhr.onreadystatechange = function () {
				// 		if (xhr.readyState == 4 && xhr.status == 200) {
				// 			var result = JSON.parse(xhr.responseText);
				// 			if (result.account.length == 0) {
				// 				Swal.fire({
				// 					position: 'center',
				// 					icon: 'error',
				// 					title: msg1.innerHTML = "<font color='red' >*請確認使用者帳號</font>",
				// 					showConfirmButton: false,
				// 					timer: 5000
				// 				})
				// 				flag1 = false;
				// 			} else if (result.account.startsWith("Error")) {
				// 				Swal.fire({
				// 					position: 'center',
				// 					icon: 'error',
				// 					title: message = "<font color='red' >發生錯誤: 帳號" + result.account + "</font>",
				// 					showConfirmButton: false,
				// 					timer: 5000
				// 				})
				// 				flag1 = false
				// 			} else {
				// 				message = "";
				// 				flag1 = true
				// 			}
				// 			msg1.innerHTML = message;
				// 		}
				// 	}
				// };

				submit.onclick = function () {

					if (!account.value) {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: msg1.innerHTML = "<font color='red' >*請確認使用者帳號</font>",
							showConfirmButton: false,
							timer: 5000
						})
						flag1 = false;
						return;
					} else {
						msg1.innerHTML = "";
					}

					if (!password.value) {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: msg2.innerHTML = "<font color='red' >*請輸入密碼</font>",
							showConfirmButton: false,
							timer: 5000
						})
						flag2 = false;
						return;
					} else {
						msg2.innerHTML = "";
						flag2 = true;
					}

					// if (!(flag1)) {
					// 	Swal.fire({
					// 		position: 'center',
					// 		icon: 'error',
					// 		title: msg1.innerHTML = "<font color='red' > 您輸入的帳號不正確 </font>",
					// 		showConfirmButton: false,
					// 		timer: 5000
					// 	})
					// 	return false;
					// }

					// if (!flag2) {
					// 	Swal.fire({
					// 		position: 'center',
					// 		icon: 'error',
					// 		title: msg2.innerHTML = "<font color='red' >您輸入的密碼不正確 </font>",
					// 		showConfirmButton: false,
					// 		timer: 5000
					// 	})
					// 	return false;
					// }

					var xhr1 = new XMLHttpRequest();
					xhr1.open("POST", "<c:url value='/checkLogin' />", true);
					var jsonMember = {
						"account": account.value,
						"password": password.value
					}

					xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
					xhr1.send(JSON.stringify(jsonMember));
					xhr1.onreadystatechange = function () {
						if (xhr1.readyState == 4 && xhr1.status == 200) {
							var result = JSON.parse(xhr1.responseText);

							if (result.idfail) {
								Swal.fire({
									position: 'center',
									icon: 'error',
									title: msg2.innerHTML = "<font color='red' >" + result.idfail + "</font>",
									showConfirmButton: false,
									timer: 5000
								})
								flag2 = false;
							} else {
								flag2 = true;
							}

							if (result.success) {
								Swal.fire({
									position: 'center',
									icon: 'success',
									title: msg1.innerHTML = "<font color='green' >" + result.success + "</font>",
									showConfirmButton: false,
									timer: 5000
								}).then(function () { window.location.assign("<c:url value='/homepage.controller'/>"); })
								flag1 = true;
							} else {
								flag1 = false;
							}

							if (result.verify) {
								if (account != "" && password != "") {
									Swal.fire({
										position: 'center',
										icon: 'error',
										title: msg1.innerHTML = "<font color='red' >" + result.verify + "<p>請按確認鍵跳轉到認證</p>" + "</font>",
										showConfirmButton: true,
										timer: 5000
									}).then(function () { window.location.assign("<c:url value='/emailcheck.controller' />") })
								}
								flag1 = false;
							} else {
								flag1 = true;
							}
						}
					}
				}
			}

		</script>

		<body>
			<div class="main page-template">
				<jsp:include page="../user/nvigationBar.jsp" />

				<div class="inner-page">
					<div class="login-page">
						<div class="container">
							<div class="row">
								<div class="col-lg-offset-3 col-md-offset-3 col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<div class="login-form">
										<h2></h2>
										<form action="">
											<li style="font-size: 18px;">
												<a href="">還沒有帳號? <span class="green">趕快註冊.</span></a>
											</li>
											<div class="row">

												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-4">
													<br>
													<div class="form-group " style="font-size: 18px;">
														<label for="account">帳號 :</label>
													</div>
													<br>
													<div class="form-group" style="font-size: 18px;">
														<label for="password">密碼 :</label>
													</div>
												</div>

												<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">

													<div class="form-group">
														<span id="msg1" style="color: red"></span><br>
														<input id="account" class="form-control form-mane" type="text"
															placeholder="請輸入帳號">
													</div>

													<div class="form-group">
														<span id="msg2" style="color: red"></span><br>
														<input id="password" class="form-control form-mane"
															type="password" placeholder="請輸入密碼">
													</div>

													<div class="buttons alert">
														<input type="button" class="btn btn-buttons" id="submit"
															value="登入" />
														<input type="button" class="btn btn-buttons" id="quicka"
															value="一鍵1" />
														<input type="button" class="btn btn-buttons" id="quickb"
															value="一鍵2" />
													</div>

													<div class="g-signin2" data-onsuccess="onSignIn"
														data-longtitle="true">
													</div>

													<div class="fb-login-button" data-width="" data-size="medium"
														data-button-type="continue_with" data-layout="default"
														data-auto-logout-link="false" data-use-continue-as="true"></div>

													<div class="forgat-pass">
														<div class="remember-me">
															<input type="checkbox" id="remember" class="checkbox">
															<label for="remember">記住我</label>
														</div>
														<div class="remember-me">
															<a href="<c:url value='/forgetpwd.controller' />">忘記你的 <span
																	class="green"> 密碼 ?</span></a>
														</div>
													</div>

												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../user/footer.jsp" />
			</div>

			<script>

				var quicka = document.getElementById("quicka");
				var quickb = document.getElementById("quickb");

				quicka.onclick = function () {
					var c1 = document.getElementById("account");
					var c2 = document.getElementById("password");

					c1.value = "HenHibernate";
					c2.value = "Aa123456";

					var xhr1 = new XMLHttpRequest();
					xhr1.open("POST", "<c:url value='/checkLogin' />", true);
					var jsonMember = {
						"account": account.value,
						"password": password.value
					}
					xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
					xhr1.send(JSON.stringify(jsonMember));
					xhr1.onreadystatechange = function () {
						if (xhr1.readyState == 4 && xhr1.status == 200) {
							var result = JSON.parse(xhr1.responseText);

							if (result.msg4) {
								Swal.fire({
									position: 'center',
									icon: 'error',
									title: msg2.innerHTML = "<font color='red' >" + result.msg4 + "</font>",
									showConfirmButton: false,
									timer: 5000
								})
								flag2 = false;
							} else {
								flag2 = true;
							}

							if (result.success) {
								Swal.fire({
									position: 'center',
									icon: 'success',
									title: msg1.innerHTML = "<font color='green' >" + result.success + "</font>",
									showConfirmButton: false,
									timer: 5000
								}).then(function () { window.location.assign("<c:url value='/homepage.controller'/>"); })
								flag1 = true;
							} else {
								flag1 = false;
							}

							if (result.verify) {
								msg1.innerHTML = "<font color='red' >" + result.verify + "</font>";
								if (account != "" && password != "") {
									window.location.assign("<c:url value='/emailcheck.controller' />");
								}
								flag1 = false;
							} else {
								flag1 = true;
							}

						}
					}
				}

				quickb.onclick = function () {
					var c1 = document.getElementById("account");
					var c2 = document.getElementById("password");

					c1.value = "smokeralen";
					c2.value = "Aa123456";

					var xhr1 = new XMLHttpRequest();
					xhr1.open("POST", "<c:url value='/checkLogin' />", true);
					var jsonMember = {
						"account": account.value,
						"password": password.value
					}
					xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
					xhr1.send(JSON.stringify(jsonMember));
					xhr1.onreadystatechange = function () {
						if (xhr1.readyState == 4 && xhr1.status == 200) {
							var result = JSON.parse(xhr1.responseText);

							if (result.msg4) {
								Swal.fire({
									position: 'center',
									icon: 'error',
									title: msg2.innerHTML = "<font color='red' >" + result.msg4 + "</font>",
									showConfirmButton: false,
									timer: 5000
								})
								flag2 = false;
								//return;
							} else {
								flag2 = true;
							}

							if (result.success) {
								Swal.fire({
									position: 'center',
									icon: 'success',
									title: msg1.innerHTML = "<font color='green' >" + result.success + "</font>",
									showConfirmButton: false,
									timer: 5000
								}).then(function () { window.location.assign("<c:url value='/homepage.controller'/>"); })
								flag1 = true;
							} else {
								flag1 = false;
							}

							if (result.verify) {
								msg1.innerHTML = "<font color='red' >" + result.verify + "</font>";
								if (account != "" && password != "") {
									window.location.assign("<c:url value='/emailcheck.controller' />");
								}
								flag1 = false;
							} else {
								flag1 = true;
							}
						}
					}
				}

			</script>
		</body>

		</html>