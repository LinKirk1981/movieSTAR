<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

<jsp:include page="../administrator/cssback.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		$('#dataTables-users').DataTable({
			responsive : true
		});
	});
</script>

</head>

<body>
	<jsp:include page="../administrator/topback.jsp"></jsp:include>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">檢視資料明細</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

					<c:if test="${not empty msg}">
						<div class="alert alert-${css} alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong>${msg}</strong>
						</div>
					</c:if>

						<div class="panel-body">
							<table id="dataTables-users" width="100%"
								class="table table-striped table-bordered table-hover">
								  <thead>
									<tr>
										<th>欄位名稱</th>
										<th>人事資料</th>
									</tr>
								  </thead>
								<tbody>
								    <tr class="odd gradeA">
										<td>會員帳號</td>
										<td>${user.account}</td>
									</tr>
									<tr class="odd gradeA">
										<td>會員姓名</td>
										<td>${user.name}</td>
									</tr>
									<tr class="even gradeA">
										<td>員工信箱</td>
										<td>${user.emailbox}</td>
									</tr>
									
									<tr class="odd gradeA">
										<td>員工編號</td>
										<td>${user.memberid}</td>
									</tr>
									<security:authorize url="/user/add">
									<tr class="odd gradeA">
										<td>手機號碼</td>
										<td>${user.cell}</td>
									</tr>
									</security:authorize>
									<tr class="odd gradeA">
										<td>註冊時間</td>
										<td>${user.registerTime}</td>
									</tr>
									
<!--                                     <tr class="odd gradeA"> -->
<!-- 										<td> 後台權限</td> -->
<!-- 										<td> -->
<%-- 											<c:forEach var="title" items="${user.title}" varStatus="loop"> --%>
<%-- 												${title} <c:if test="${not loop.last}">,</c:if> --%>
<%-- 											</c:forEach> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
																		
<!-- 									<tr class="odd gradeA"> -->
<!-- 										<td>專業技能</td> -->
<!-- 										<td> -->
<%-- 											<c:forEach var="skill" items="${user.skill}" varStatus="loop"> --%>
<%-- 												${skill} <c:if test="${not loop.last}">,</c:if> --%>
<%-- 											</c:forEach> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
<%-- 									<security:authorize url="/user/add"> --%>
<!-- 									<tr class="odd gradeA"> -->
<!-- 										<td>薪水</td> -->
<!-- 										<td> -->
<%-- 											<c:forEach var="salary" items="${user.salary}" varStatus="loop"> --%>
<%-- 												${salary} <c:if test="${not loop.last}">,</c:if> --%>
<%-- 											</c:forEach> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
<%-- 									</security:authorize> --%>
									
<!-- 									<tr class="odd gradeA"> -->
<!-- 										<td>狀態</td> -->
<!-- 										<td> -->
<%-- 											<c:forEach var="status" items="${user.status}" varStatus="loop"> --%>
<%-- 												${status} <c:if test="${not loop.last}">,</c:if> --%>
<%-- 											</c:forEach> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  <jsp:include page="../administrator/footerback.jsp"></jsp:include>
</body>
</html>
