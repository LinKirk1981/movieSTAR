<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!doctype html>
		<html class="no-js" lang="en">

		<head>

			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta name="description" content="">
			<meta name="author" content="">
			<jsp:include page="../user/css.jsp" />

		</head>

		<script>
			window.onload = function () {
				let flag1 = false;
				var submit = document.getElementById("submit");
				var account = document.getElementById("account");
				//var feildset = document.getElementById("feildset");

				account.onchange = function () {
					var xhr = new XMLHttpRequest();
					xhr.open("Post", "<c:url value='/checkMemberByAccount' />", true);
					xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					xhr.send("account=" + account.value);
					var message = "";
					xhr.onreadystatechange = function () {
						// p伺服器請求完成
						if (xhr.readyState == 4 && xhr.status == 200) {
							var result = JSON.parse(xhr.responseText);
							if (result.account.length == 0) {
								message = "<font color='red' > 帳號不存在</font>";
								flag1 = false;
							} else if (result.account.startsWith("Error")) {
								message = "<font color='red' > 發生錯誤: 帳號" + result.account + "</font>";
								flag1 = false
							} else {
								message = "";
								flag1 = true
							}
							ih1.innerHTML = message;
						}
					}
				}

				submit.onclick = function () {

					if (!flag1) {

						Swal.fire({
							icon: 'error',
							title: '請確認輸入帳號是否正確！',
							text: '驗證碼輸入錯誤！',
							//footer: '<a href>Why do I have this issue?</a>'
						})
						//alert("請確認輸入帳號是否正確！");
						return false;
					} else {
						ih1.innerHTML = "<font color='green' > 正在發送您的密碼確認信件..........</font>";
					}
					var xhr1 = new XMLHttpRequest();
					xhr1.open("Post", "<c:url value='/forgetpwd' />", true);
					xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					xhr1.send("account=" + account.value);
					xhr1.onreadystatechange = function () {
						// 伺服器請求完成
						if (xhr1.readyState == 4 && xhr1.status == 200) {
							var result = JSON.parse(xhr1.responseText);
							if (result.fail) {

								Swal.fire({
									icon: 'error',
									title: '"錯誤!", result.fail ,"error"',
									text: '驗證碼輸入錯誤！',
									//footer: '<a href>Why do I have this issue?</a>'
								})
								//alert("錯誤!", result.fail ,"error");
							} else if (result.success) {

								/////////
								Swal.fire({
									title: '"已成功寄送信件至"+ result.email +"信箱，請至信箱確認新密碼!"',
									html: '<b></b> milliseconds.',
									timer: 2000,
									timerProgressBar: false,
									didOpen: () => {
										Swal.showLoading()
										timerInterval = setInterval(() => {
											const content = Swal.getContent()
											if (content) {
												const b = content.querySelector('b')
												if (b) {
													b.textContent = Swal.getTimerLeft()
												}
											}
										}, 100)
									},
									willClose: () => {
										clearInterval(timerInterval)
									}
								}).then((result) => {
									/* Read more about handling dismissals below */
									if (result.dismiss === Swal.DismissReason.timer) {
										console.log('I was closed by the timer')
										window.location.assign("<c:url value='/login.controller' />");
									}
								})

								//alert("已成功寄送信件至"+ result.email +"信箱，請至信箱確認新密碼!");
								//window.location.assign("<c:url value='/login.controller' />");
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
											<a>忘記您的密碼? <span class="green">請輸入您的帳號重設密碼.</span></a>
											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-4">
													<br>
													<div class="form-group ">
														<label for="account">請輸入您的帳號 :</label>
													</div>
												</div>
												<div class="col-lg-8 col-md-8 col-sm-12 col-xs-8">

													<div class="form-group">
														<span id="ih1" style="color: red"></span><br>
														<input id="account" class="form-control form-mane" type="text"
															placeholder="請輸入您的帳號 ">
													</div>

													<div class="buttons alert">
														<input type="button" class="btn btn-buttons" id=submit
															value="重設帳號" />
													</div>

													<div class="forgat-pass">
														<div class="remember-me">
															<a href="/register"><span class="green"> 註冊帳號</span></a>
														</div>
														<div class="remember-me">
															<a href="<c:url value='/login.controller' />"> <span
																	class="green"> 登入帳號</span></a>
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
			<!-- FOOTER SECTION -->
		</body>

		</html>