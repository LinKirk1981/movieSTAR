<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="zxx">

<head>
<jsp:include page="../user/css.jsp" />

<style>

input[type="file"] {
    display: none;
}
.custom-file-upload {
/*     border: 1px solid #ccc; */
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
}

</style>

<script type="text/javascript">

var aa="${userBean.mempk}"
console.log(aa)

</script>

</head>

<body>
	<div class="main page-template">
		<jsp:include page="../user/nvigationBar.jsp" />

		<!-- PRODUCT LIST VIEW -->
		<div class="container">
			<div class="details-page">
				<div class="details-contents">
					<div class="details-content">
						<!-- REVIEW WITH IMAGE -->
						<div class="celebritie-single pt-75 tb-75">
							<div class="row">
								
						</div>
							<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
								<div class="celebritie-dec">
									<div class="details-title">
										<h2><span style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${displayusername}</span>
										<br>     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好! 還沒挑電影? 趕快選一部IMovie為您挑選的好電影!</h2>
									</div>
									
							   <div align="center">
		                           
		                              <form action="<c:url value='/user/update'/>" method="POST" Enctype="Multipart/Form-Data">
		                                <div class="celerite-info">
		                                  <div class="row">
										   <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4">
					                   
						                   	<br>
						                   	<br>
						                   	<br>
						                   	<br>
						                   	<br>
<!-- 											<div class="form-group"> -->
												<h3>
												<label for="file-upload" style="color:white" class="custom-file-upload">選擇頭像 :
												       <i class="fa fa-cloud-upload"></i>
												</label>
												
												<input type="file" value="${userBean.image}" name="file" id="file-upload" />
												</h3>												    
<!-- 											</div> -->
											<br>
											<br>
											<br>
											<br>																																																							
											<br>
											<div class="form-group">
												<h3><label for="name" style="color:white">姓名 :</label></h3>
											</div>
											<br>
											<div class="form-group">
												<h3><label for="account" style="color:white">帳號 :</label></h3>
											</div>
											<br>
											<div class="form-group">
												<h3><label for="cell" style="color:white">手機 :</label></h3>
											</div>
											<br>
											<div class="form-group">
												<h3><label for="password" style="color:white">密碼 :</label></h3>
											</div>
											<br>
											<div class="form-group">
												<h3><label for="registertime" style="color:white">註冊時間 :</label></h3>
											</div>
<!-- 											<div class="form-group"> -->
<!-- 												<h3><label for="conPassword" style="color:white">再次確認密碼:</label></h3> -->
<!-- 											</div> -->
										</div>

										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-8">
										
										<input class="form-control form-mane" required=""
											type="hidden" name="mempk" value="${userBean.mempk}">
											
<!-- <!-- 										 User Image --> -->
<!-- 						                   <div class="image d-flex justify-content-center"> -->
<!-- 							                      <input type="hidden" id="imagebase64" name="inputfile"> -->
<!-- 							                      <label for="imgInp"> -->
<%-- 							                      <img src="${userBean.getImage1()}" alt="" class="" id="preview_progressbarTW_img" /> --%>
<!-- 							                      </label> -->
<!-- 						                  </div> -->
<!-- <!-- 						                  File chooser						 --> -->
<!-- 						                   <input type="file" class="form-control-file mt-2 pt-1" id="imgInp" accept="image/gif, image/jpeg, image/png"> -->

                                           <div class="form-group">
                                           
                                           <c:choose>
                                             <c:when test="${userBean.image==null}">
                                           		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4WsWXuYpUlmEzasgT4zldm_ua1lHN0At63A&usqp=CAU">              
                                             </c:when>
                                             <c:otherwise>
                                               <img src="<c:url value = '/getProfilePicture/${userBean.mempk}'/>" width="150" height="201">
                                             </c:otherwise>
                                           </c:choose>
                                           </div>
                                            
                                            
											<div class="form-group">
												<span id="result0c" style='color: red'></span><br> <input
											      class="form-control form-mane" required=""
												  type="text" style='' placeholder="請輸入您的姓名" name="name" value="${userBean.name}">
											</div>

											<div class="form-group">
												<span id="result1c" style='color: red'></span><br> <input
													id="account" class="form-control form-mane" required=""
													type="text" style='' placeholder="請輸入Email信箱" name="account" value="${userBean.account}">
											</div>

											<div class="form-group">
												<span id="result2c" style='color: red'></span><br> <input
													id="cell" class="form-control form-mane" required=""
													type="text" style='' placeholder="請輸入您的手機號碼" name="cell" value="${userBean.cell}">
											</div>

											<div class="form-group">
												<span id="result3c" style='color: red'></span><br> <input
													id="password" class="form-control form-mane" required=""
													type="password" style='' placeholder="請輸入您的密碼)" name="password" value="${userBean.password}">
											</div>

											<div class="form-group">
												<span id="result4c" style='color: red'></span><br> 									
												<input id="registerTime" name="registerTime" class="form-control form-mane" placeholder="您的註冊時間" value="${userBean.registerTime}">												
											</div>

											<div class="buttons alert">
												<input type="submit" class="btn btn-buttons" id="sendData" value="更改會員資料" />
<!-- 											<input type="submit" value="update" > -->
											</div>
										<ul>
					                         <li><label>您的留言紀錄:</label> <span>按這裡查歷史紀錄</span></li>
					                         <li><label>您的電影票夾:</label> <span>按這裡查歷史紀錄</span></li>
					                         <li><label>會員</label> <span>一般會員</span></li>
                                       </ul>
											<!--  
                                            <div class="buttons">
                                                <a href="" class="btn btn-buttons">create account</a>
                                            </div>
                                            -->
										</div>
									</div>
		                                
			                    
		                               </div>

		                           </form>
	                            </div>
									<div class="inner-page">
										<div class="contact-page pt-75 pb-75">
											<div class="container">
												<div class="row">
													<div
														class="col-lg-10 col-md-10 col-lg-offset-1 col-md-offset-1">
														<div class="row">
<%-- 															<form action="#" class="contact-form"> --%>
<!-- 																<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> -->
<!-- 																	<div class="form-group"> -->
<!-- 																		<label for="name">Name</label> <input id="name" -->
<!-- 																			class="form-control form-mane" placeholder="Name" -->
<!-- 																			required="" type="text"> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> -->
<!-- 																	<div class="form-group"> -->
<!-- 																		<label for="subject">Subject</label> <input -->
<!-- 																			id="subject" class="form-control form-mane" -->
<!-- 																			placeholder="Subject" required="" type="text"> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> -->
<!-- 																	<div class="form-group"> -->
<!-- 																		<label for="email">E-mail</label> <input id="email" -->
<!-- 																			class="form-control form-mane" placeholder="Email" -->
<!-- 																			required="" type="text"> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> -->
<!-- 																	<div class="form-group"> -->
<!-- 																		<label for="message">E-mail</label> -->
<!-- 																		<textarea id="message" -->
<!-- 																			class="form-control form-message" cols="10" rows="10" -->
<!-- 																			name="message" placeholder="Message" required=""></textarea> -->
<!-- 																	</div> -->
<!-- 																	<div class="submit-button"> -->
<!-- 																		<a href="" class="btn btn-button green-bg button-1">Go -->
<!-- 																			Back</a> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<%-- 															</form> --%>
														</div>
													</div>
												</div>
											</div>
										</div>







										<div class="celebritei-history">

											<div class="flim-history">
												<!--                                                     <h2>Filmography</h2> -->
												<!--                                                     <div class="flim-items"> -->
												<!--                                                         <div class="flim-list"> -->
												<!--                                                             <div class="flim-img"> -->
												<!--                                                                 <img src="images/widget/1.jpg" alt=""> -->
												<!--                                                             </div> -->
												<!--                                                             <div class="flim-name"> -->
												<!--                                                                 <a href="">Hurry Animate Blue Strack</a> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Movie Time :</label>2.45.30</div> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Relace :</label>10-5-18</div> -->
												<!--                                                             </div> -->
												<!--                                                         </div> -->
												<!--                                                         <div class="flim-list"> -->
												<!--                                                             <div class="flim-img"> -->
												<!--                                                                 <img src="images/widget/2.jpg" alt=""> -->
												<!--                                                             </div> -->
												<!--                                                             <div class="flim-name"> -->
												<!--                                                                 <a href="">Hurry Animate Blue Strack</a> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Movie Time :</label>2.45.30</div> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Relace :</label>10-5-18</div> -->
												<!--                                                             </div> -->
												<!--                                                         </div> -->
												<!--                                                         <div class="flim-list"> -->
												<!--                                                             <div class="flim-img"> -->
												<!--                                                                 <img src="images/widget/3.jpg" alt=""> -->
												<!--                                                             </div> -->
												<!--                                                             <div class="flim-name"> -->
												<!--                                                                 <a href="">Hurry Animate Blue Strack</a> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Movie Time :</label>2.45.30</div> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Relace :</label>10-5-18</div> -->
												<!--                                                             </div> -->
												<!--                                                         </div> -->
												<!--                                                         <div class="flim-list"> -->
												<!--                                                             <div class="flim-img"> -->
												<!--                                                                 <img src="images/widget/1.jpg" alt=""> -->
												<!--                                                             </div> -->
												<!--                                                             <div class="flim-name"> -->
												<!--                                                                 <a href="">Hurry Animate Blue Strack</a> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Movie Time :</label>2.45.30</div> -->
												<!--                                                                 <div class="relece-date"> -->
												<!--                                                                     <label>Relace :</label>10-5-18</div> -->
												<!--                                                             </div> -->
												<!--                                                         </div> -->
												<!--                                                     </div> -->
												<!--                                                 </div> -->
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- END REVIEW WITH IMAGE -->
						</div>
					</div>

				</div>
			</div>
			<%--             <jsp:include page="CATAGORYMOVIE.jsp"></jsp:include> --%>
			<!-- END PRODUCT LIST VIEW -->
		</div>
		<jsp:include page="../user/footer.jsp" />
	</div>
<script>
</script>
</body>

</html>