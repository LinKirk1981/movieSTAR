<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../administrator/cssback.jsp"/>
  <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</head>
<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"/>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>${fm.account}的檢視文章訊息</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item active"><a>所有文章</a></li>
              <li class="breadcrumb-item">檢視文章</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
<!-- <div id="page-wrapper"> -->
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-12"> -->
<%-- 					<h1 class="page-header">${fm.account}的檢視文章訊息</h1> --%>
<!-- 				</div> -->
<!-- 			</div> -->


<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-12"> -->
<!-- 					<div class="panel panel-default"> -->
<!-- 						<div class="panel-body"> -->


  <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
							<table  width="100%" class="table table-striped table-bordered table-hover"	id="showForum">
								<thead>
									<tr>
										<th style='width: 10%' >欄位名稱</th>
										<th style='width: 90%'>資訊</th>
									</tr>
								</thead>
								<tbody>
									<tr class="odd gradeA">
										<td>姓名:</td>
										<td>${fm.account}</td>
									</tr>
									<tr class="even gradeA">
										<td>主題:</td>
										<td>${fm.fmovie}</td>
									</tr>
									
									<tr class="even gradeA">
										<td>標籤:</td>
										<td>【${fm.tag}】【${fm.theme}】</td>
									</tr>
									
									<tr class="even gradeA">
										<td>標題:</td>
										<td>${fm.article}</td>
									</tr>
									<tr class="odd gradeA">
										<td>內容:</td>
										<td>${fm.content}</td>
									</tr>
									<tr class="odd gradeA">
										<td>發表時間:</td>
										<td>${fm.ftime}</td>
									</tr>										
								</tbody>
							</table>														                    			                    
                 			
							<div class="btn-group">
			                    <button type="button" class="btn btn-info">查看</button>
			                    <button type="button" class="btn btn-info dropdown-toggle dropdown-icon" data-toggle="dropdown">
			                      <span class="sr-only">Toggle Dropdown</span>
			                    </button>
			                    <div class="dropdown-menu" role="menu"> 
			                      <a class="dropdown-item" href="${pageContext.request.contextPath}/msg/seeMyForum?account=${fm.account}">我發過的文章</a>	                     
			                      <div class="dropdown-divider"></div>
			                      <a class="dropdown-item" href="${pageContext.request.contextPath}/msg/seeMyMessage?fk=${fm.fid}">我的留言</a>
		                    	</div>
                 			 </div>
								
				</div>
			</div>
		</div>
	</div>
</div>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<jsp:include page="../administrator/footerback.jsp"/>
<!-- DataTables  & Plugins -->
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/jszip/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/pdfmake/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/pdfmake/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- Page specific script -->
    <!-- Content Header (Page header) -->
<script>
	$(document).ready(function() {
		$('#showForum').DataTable({
			"language": {
                "lengthMenu": "顯示 _MENU_ 項結果",
                "zeroRecords": "沒有符合的結果",
                "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                "infoEmpty": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                "infoFiltered": "(從 _MAX_ 個項目中搜尋)",
                "search": "搜尋:",
                oPaginate: {
                  sFirst: "首頁",
                  sPrevious: "上一頁",
                  sNext: "下一頁",
                  sLast: "尾頁"
                }
              },
		});
	});
</script>

</body>
</html>