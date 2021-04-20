<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page session="false" %>
		<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
			<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
					<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


						<!DOCTYPE html>
						<html lang="zh_TW">

						<head>

							<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
							<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
							<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
							<link rel="stylesheet"
								href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
							<link rel="stylesheet"
								href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

							<jsp:include page="../administrator/cssback.jsp"></jsp:include>

							<script>
								$(document).ready(function () {
									$('#dataTables-imoviemembers').DataTable({
									});
								});

								function aa() {
									Swal.fire({
										title: '是否新增或更新?',
										showDenyButton: true,
										//showCancelButton: true,
										confirmButtonText: `是`,
										denyButtonText: `否`,
									}).then((result) => {
										/* Read more about isConfirmed, isDenied below */
										if (result.isConfirmed) {
											Swal.fire({
												icon: 'success',
												title: '新增成功',
												showConfirmButton: false,
												timer: 1500
											});
											setTimeout(function () { document.getElementById("form1").submit() }, 1500)
										} else if (result.isDenied) {
											Swal.fire('Changes are not saved', '', 'info')
										}
									})
								}

							</script>

						</head>

						<!-- <body> -->

						<div id="page-wrapper">
							<jsp:include page="../administrator/topback.jsp"></jsp:include>

							<div class="row">
								<div class="col-lg-12">
									<c:choose>
										<c:when test="${userForm['new']}">
											<h1 class="page-header">
												<s:message code='addUser' />
											</h1>
										</c:when>
										<c:otherwise>
											<h1 class="page-header">
												<s:message code='updateUser' />
											</h1>
										</c:otherwise>
									</c:choose>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">

										<div class="panel-body">
											<div class="row">
												<div class="col-lg-6">
													<table width="100%"
														class="table table-striped table-bordered table-hover"
														id="dataTables-imoviemembers">

														<s:url value="/user/save" var="userActionUrl" />

														<sf:form class="form-horizontal" method="post" id='form1'
															modelAttribute="userForm" action="${userActionUrl}">

															<sf:hidden path="mempk" />

															<s:bind path="name">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">員工姓名</label>
																	<div class="col-sm-10">
																		<sf:input path="name" class="form-control "
																			placeholder="員工姓名" id="name" name="name" />
																		<sf:errors path="name" class="control-label" />
																	</div>
																</div>
															</s:bind>

															<s:bind path="emailbox">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">員工信箱</label>
																	<div class="col-sm-10">
																		<sf:input path="emailbox" class="form-control "
																			placeholder="員工信箱" id="emailbox"
																			name="emailbox" />
																		<sf:errors path="emailbox"
																			class="control-label" />
																	</div>
																</div>
															</s:bind>

															<s:bind path="memberid">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">員工編號</label>
																	<div class="col-sm-10">
																		<sf:input path="memberid" class="form-control "
																			placeholder="員工編號" id="memberid"
																			name="memberid" />
																		<sf:errors path="memberid"
																			class="control-label" />
																	</div>
																</div>
															</s:bind>

															<s:bind path="password">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">密碼</label>
																	<div class="col-sm-10">
																		<sf:password path="password"
																			class="form-control" placeholder="員工密碼"
																			id="password" name="password" />
																		<sf:errors path="password"
																			class="control-label" />
																	</div>
																</div>
															</s:bind>

															<s:bind path="confirmpassword">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">確認密碼</label>
																	<div class="col-sm-10">
																		<sf:password path="confirmpassword"
																			class="form-control" placeholder="再次確認密碼"
																			id="confirmpassword"
																			name="confirmpassword" />
																		<sf:errors path="confirmpassword"
																			class="control-label" />
																	</div>
																</div>
															</s:bind>

															<s:bind path="cell">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">手機號碼</label>
																	<div class="col-sm-10">
																		<sf:input path="cell" class="form-control"
																			placeholder="員工手機號碼" id="cell"
																			name="cell" />
																		<sf:errors path="cell" class="control-label" />
																	</div>
																</div>
															</s:bind>

															<s:bind path="status">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">狀態</label>
																	<div class="col-sm-5">
																		<sf:select path="status" items="${status1}"
																			multiple="true" size="5"
																			class="form-control" id="status"
																			name="status" />
																		<sf:errors path="status"
																			class="control-label" />
																	</div>
																	<div class="col-sm-5"></div>
																</div>
															</s:bind>

															<s:bind path="salary">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">薪水</label>
																	<div class="col-sm-5">
																		<sf:select path="salary" items="${salary}"
																			multiple="true" size="5"
																			class="form-control" id="salary"
																			name="salary" />
																		<sf:errors path="salary"
																			class="control-label" />
																	</div>
																	<div class="col-sm-5"></div>
																</div>
															</s:bind>

															<s:bind path="skill">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">專業技能</label>
																	<div class="col-sm-5">
																		<sf:select path="skill" items="${skill}"
																			multiple="true" size="5"
																			class="form-control" id="skill"
																			name="skill" />
																		<sf:errors path="skill" class="control-label" />
																	</div>
																	<div class="col-sm-5"></div>
																</div>
															</s:bind>

															<s:bind path="title">
																<div
																	class="form-group ${status.error ? 'has-error' : ''}">
																	<label class="col-sm-2 control-label">後台權限</label>
																	<div class="col-sm-5">
																		<sf:select path="title" class="form-control">
																			<sf:option value="NONE"
																				label="---選擇後台權限---" />
																			<sf:options items="${title}" id="title"
																				name="title" />
																		</sf:select>
																		<sf:errors path="title" class="control-label"
																			size="5" />
																	</div>
																	<div class="col-sm-5"></div>
																</div>
															</s:bind>

															<div class="form-group">
																<div class="col-sm-offset-2 col-sm-10">
																	<c:choose>

																		<c:when test="${userForm['new']}">
																			<button type="button" onclick="aa()"
																				class="btn-lg btn-primary pull-right"
																				id="btn-submit">新增員工</button>

																			<button type="button" 
																				class="btn-lg btn-primary pull-right"
																				id="quick1"
																				onclick='q1();'>一鍵輸入</button>
																		</c:when>

																		<c:otherwise>
																			<button type="button" onclick="aa()"
																				class="btn-lg btn-primary pull-right"
																				id="btn-submit">更新資料</button>

																			<button type="button" 
																				class="btn-lg btn-primary pull-right"
																				id="quick2"
																				onclick='q2();'>一鍵輸入</button>
																		</c:otherwise>

																	</c:choose>
																</div>
															</div>
														</sf:form>

													</table>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>

						<jsp:include page="../administrator/footerback.jsp"></jsp:include>
						<script>



							function q1() {
								var c1 = document.getElementById("name");
								var c2 = document.getElementById("emailbox");
								var c3 = document.getElementById("memberid");
								var c4 = document.getElementById("password");
								var c5 = document.getElementById("confirmpassword");
								var c6 = document.getElementById("cell");
								var c7 = document.getElementById("salary");
								var c8 = document.getElementById("skill");
								var c9 = document.getElementById("title");
								var c10 = document.getElementById("status");
								c1.value = "趙天天";
								c2.value = "brave55551123@gmail.com";
								c3.value = "M111001211";
								c4.value = "Aa123456";
								c5.value = "Aa123456";
								c6.value = "0921720298";
								c7.value = "40000";
								c8.value = "Bootstrap";
								c9.value = "ROLE_USER";
								c10.value = "在職";
							}

							function q2() {
								var form = document.getElementById("form1");
								var c4 = document.getElementById("password");
								console.log(c4)
								var c5 = document.getElementById("confirmpassword");
								console.log(c5)
								c4.value = "Aa123456";
								c5.value = "Aa123456";
								//form.submit();
							}

						</script>
						</body>

						</html>