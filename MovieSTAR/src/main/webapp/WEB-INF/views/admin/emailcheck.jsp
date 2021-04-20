<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!doctype html>
		<html class="no-js" lang="en">

		<head>
			<jsp:include page="../user/css.jsp" />

			<script>
				window.onload = function () {

					var checknum1 = document.getElementById("checknum1");
					checknum1.onclick = function () {
						ih.innerHTML = "";
					}

					// var userid1 = document.getElementById("checkaccount");
					var userid = document.getElementById("checkemail");
					var checknum = document.getElementById("checknum");
					checknum.value = makeid(4);

					userid.onclick = function () {

						Swal.fire({
							title: 'MovieSTAR認證密碼發送中.......!',
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
							}
						})
						//ih.innerHTML = "<font color='green' size='+1'>已發送至信箱</font>";
						checknum.value = makeid(4);
						var xhr = new XMLHttpRequest();
						xhr.open("Post", "<c:url value='/emailCheck' />", true);
						xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
						xhr.send("checknum=" + checknum.value);
						var message = "";
						xhr.onreadystatechange = function () {
							if (xhr.readyState == 4 && xhr.status == 200) {
								var result = JSON.parse(xhr.responseText);
								//ih.innerHTML = "<font color='green' size='+1'>" + result.msg + "</font>";
							}
						}
					}

					var veritify = document.getElementById("veritify");
					veritify.onclick = function () {
						if (checknum1.value != checknum.value) {
							//alert("驗證碼輸入錯誤！");
							Swal.fire({
								icon: 'error',
								title: '再檢查一次!',
								text: '驗證碼輸入錯誤！',
								//footer: '<a href>Why do I have this issue?</a>'
							})
							return false;
						} else {

						}
						var xhr1 = new XMLHttpRequest();
						xhr1.open("Post", "<c:url value='/verifysuccess' />", true);
						xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
						xhr1.send();
						xhr1.onreadystatechange = function () {
							if (xhr1.readyState == 4 && xhr1.status == 200) {
								var result = JSON.parse(xhr1.responseText);
								//alert("驗證成功");
								Swal.fire({
								icon: 'success',
								title: '驗證成功',
								text: '系統正在將您轉到首頁！',
								showConfirmButton: true,
								timer: 3000
								//footer: '<a href>Why do I have this issue?</a>'
							})
								window.location.assign("${pageContext.request.contextPath}/login.controller");
							}
						}
					}

				}

				function makeid(length) {
					var itemm = '';
					var characters = '0123456789';
					var charactersLength = characters.length;
					for (var i = 0; i < length; i++) {
						itemm += characters.charAt(Math.floor(Math.random()
							* charactersLength));
					}
					return itemm;
				}

				// let timerInterval
				// function aa() {
				// 	Swal.fire({
				// 		title: 'MovieSTAR認證密碼發送中.......!',
				// 		html: 'MovieSTAR認證密碼發送中.......! <b></b> milliseconds.',
				// 		timer: 2000,
				// 		timerProgressBar: true,
				// 		didOpen: () => {
				// 			Swal.showLoading()
				// 			timerInterval = setInterval(() => {
				// 				const content = Swal.getContent()
				// 				if (content) {
				// 					const b = content.querySelector('b')
				// 					if (b) {
				// 						b.textContent = Swal.getTimerLeft()
				// 					}
				// 				}
				// 			}, 100)
				// 		},
				// 		willClose: () => {
				// 			clearInterval(timerInterval)
				// 		}
				// 	}).then((result) => {
				// 		/* Read more about handling dismissals below */
				// 		if (result.dismiss === Swal.DismissReason.timer) {
				// 			console.log('I was closed by the timer')
				// 		}
				// 	})
				// }

			</script>
		</head>

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
											<!-- <h3><a>驗證帳號<span class="green">   ${registeruser.getAccount()}</span></a></h3> -->

											<div class="row">


												<div class="col-lg-4 col-md-4 col-sm-12 col-xs-4">
													<br>
													<br>
													<div class="form-group " style="font-size: 21px;">
														<label for="text">驗證帳號: </label>
													</div>
													<div class="form-group " style="font-size: 21px;">
														<label for="text">您註冊的信箱: </label>
													</div>
													<div class="form-group " style="font-size: 21px;">
														<label for="text">請輸入驗證碼: </label>
													</div>
												</div>



												<div class="col-lg-8 col-md-8 col-sm-12 col-xs-8">

													<div class="form-group">
														<!-- <span id="ih" style="font-size: 200%"></span><br> -->

														<input type="hidden" name="checknum" id="checknum"
															style='color: red'>
														<br>
														<br>
														<div class="form-group " style="font-size: 20px;">
															<label style="color: greenyellow; text-align: left;">
																${registeruser.getAccount()}</span></label>
														</div>
														<div class="form-group " style="font-size: 20px;">
															<label style="color: greenyellow; text-align: left;">
																${registeruser.getEmailbox()}</span></label>
														</div>

														<input type="text" name="checknum1" id="checknum1"
															class="form-control form-mane" placeholder="輸入驗證碼"
															style="font-size: 18px; color: greenyellow;">

													</div>

													<div class="buttons alert">
														<input type="button" id="checkemail" class="btn btn-buttons"
															value="發送驗證碼" />
														&nbsp&nbsp
														<input type="submit" id="veritify" class="btn btn-buttons"
															value="驗證" />
													</div>

													<div class="forgat-pass">
														<div class="remember-me" style="font-size: 18px;">
															<a href="/register"><span class="green">
																	&nbsp&nbsp註冊帳號</span></a>
														</div>
														<div class="remember-me">
															<a href="<c:url value='/login.controller' />"> <span
																	class="green" style="font-size: 18px;">
																	登入帳號</span></a>
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

			</div>
			</div>

		</body>

		</html>