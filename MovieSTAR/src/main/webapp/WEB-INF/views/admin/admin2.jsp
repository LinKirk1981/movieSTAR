<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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
		$('#dataTables-imoviemembers').DataTable({
		});
	});
</script>

</head>

<!-- <body class="hold-transition sidebar-mini"> -->
<div id="page-wrapper">
	<jsp:include page="../administrator/topback.jsp"></jsp:include>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="page-header"><s:message code='listUser'/></h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">首頁</li>
						<li class="breadcrumb-item active"><a style="color: blue">所有會員</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<c:if test="${not empty msg}">
						<div class="alert alert-${css} alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong>${msg}</strong>
						</div>
					</c:if>


					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="dataTables-imoviemembers">
							<thead>
								<tr>
									<th style='width: 2%'>帳號</th>
									<th style='width: 5%'>姓名</th>
									<th style='width: 5%'>信箱</th>
<!-- 									<th style='width: 5%'>編號</th> -->
									<th style='width: 5%'>電話</th>
									<th style='width: 5%'>狀態</th>
                                    <th style='width: 5%'>註冊時間</th>									
									<th style='width: 10%'>修改</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="member" items="${imoviemembers}">
									<tr>
									    <td>${member.account}</td>
										<td>${member.name}</td>
										<td>${member.emailbox}</td>
<%-- 										<td>${member.memberid}</td> --%>
										<td>${member.cell}</td>
										<td>${member.permission}</td>
										<td>${member.registerTime}</td>

										<td>
										    <s:url value="/user/${member.mempk}" var="queryUrl" />
											<s:url value="/user/${member.mempk}/delete" var="deleteUrl" />
											<s:url value="/user/${member.mempk}/update" var="updateUrl" />
											<security:authorize url="/user/*">
												<button onclick="location.href='${queryUrl}'"
													class="btn btn-primary btn-sm"><i class="far fa-eye"></i>查看</button>
											</security:authorize> 
											<security:authorize url="/user/*/update">
												<button onclick="location.href='${updateUrl}'"
													class="btn btn-success btn-sm"><i class="fas fa-check"></i>更新</button>
											</security:authorize> 
											<security:authorize url="/user/*/delete">
												<button onclick="location.href='${deleteUrl}'"
													class="btn btn-danger btn-sm"><i class="fas fa-trash"></i>刪除</button>
											</security:authorize>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
</div>
<jsp:include page="../administrator/footerback.jsp"></jsp:include>
<!-- </body> -->
</html>