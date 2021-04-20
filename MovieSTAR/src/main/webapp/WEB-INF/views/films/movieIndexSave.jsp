<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

<jsp:include page="../administrator/cssback.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<script>
	$(document).ready(function() {
		$('#m').DataTable({
			"language" : {
				"lengthMenu" : "顯示 _MENU_ 項結果",
				"zeroRecords" : "沒有符合的結果",
				"info" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
				"infoEmpty" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
				"infoFiltered" : "(從 _MAX_ 個項目中搜尋)",
				"search" : "搜尋:",
				oPaginate : {
					sFirst : "首頁",
					sPrevious : "上一頁",
					sNext : "下一頁",
					sLast : "尾頁"
				}
			},
		});
	});
</script>

</head>

<!-- <body class="hold-transition sidebar-mini"> -->
<div id="page-wrapper">
	<jsp:include page="../administrator/topback.jsp"></jsp:include>

	<section class="content">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<%-- 					<h1 class="page-header"><s:message code='listUser'/>會員管理</h1> --%>
					<h1 class="page-header">電影管理</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">首頁</li>
						<li class="breadcrumb-item active"><a style="color: blue">電影</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div id="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<table width="100%" class="table table-bordered table-hover"
								id="m">
								<thead>
									<tr>
										<th style="width: 10%" class="text-center">編號</th>

										<th style="width: 10%" class="text-center">電影名稱</th>

										<th style="width: 10%" class="text-center">電影類型</th>

										<!--                       <th style="width: 10%" class="text-center"> -->
										<!--                     	圖片 -->
										<!--                       </th> -->

										<th style="width: 5%" class="text-center">分級</th>

										<th style="width: 10%" class="text-center">時長</th>

										<th style="width: 25%" class="text-center">詳情</th>

										<th style="width: 5%" class="text-center">狀態</th>
										<th style="width: 15%" class="text-center">操作</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="mv" items="${allMovies}">

										<tr>
											<td style="vertical-align: middle;">${mv.movieId}</td>

											<td style="vertical-align: middle;"><a>
													${mv.movieName} </a> <br /> <small> ${mv.movieDate} </small></td>

											<td style="vertical-align: middle;">${mv.movieType}</td>

											<!--                       <td class="text-center"> -->
											<%--                       <img src="${pageContext.request.contextPath}/image/${mv.movieId}.jpg" width="200px" height="200px"> --%>
											<!--                       </td> -->
											<td style="vertical-align: middle;">
												<ul class="list-inline">
													<li class="list-inline-item"><img alt="Avatar"
														class="table-avatar"
														src="user/images/GSRR_${mv.movieRating}_logo.svg"></li>

												</ul>
											</td>
											<td style="vertical-align: middle;"><a>
													${mv.movieDuration} </a></td>

											<td style="vertical-align: middle;">${mv.movieDetail}</td>
											<td style="vertical-align: middle;">
												<c:choose>
													<c:when test="${mv.movieState==1}">
															熱映中
													</c:when>
													<c:otherwise>
															已下架
													</c:otherwise>
												</c:choose>
											</td>
											<td style="vertical-align: middle;"><a
												class="btn btn-primary btn-sm" href="#"> <i
													class="far fa-eye"> </i> 檢視
											</a> <a class="btn btn-info btn-sm"
												href="${pageContext.request.contextPath}/editMovie?id=${mv.movieId}">
													<i class="fas fa-pencil-alt"> </i> 編輯
											</a> <a class="btn btn-danger btn-sm"
												href="<%= request.getContextPath()%>/updateState.controller?id=${mv.movieId}">
													<i class="fas fa-trash"> </i> 上下架
											</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
							<jsp:include page="../administrator/footerback.jsp" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
</div>

<!-- </body> -->

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>

<!-- DataTables  & Plugins -->
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/jszip/jszip.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/pdfmake/pdfmake.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/pdfmake/vfs_fonts.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script
	src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- Page specific script -->
</html>