<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../administrator/cssback.jsp"/>
 <jsp:include page="dataTableCss.jsp"/> 
</head>
<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"/>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="page-header">${fm.account}留言管理</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="http://localhost:8080/MovieSTAR/msg/${fm.fid}">返回</a></li>
						<li class="breadcrumb-item"><a style="color: blue">文章留言</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
						<table width="100%"	class="table table-striped table-bordered table-hover"	id="showForum">
							<thead>
								<tr>
									<th style='width: 1%'>ID</th>
									<th style='width: 3%'>會員</th>
									<th style='width: 10%'>留言內容</th>							
									<th style='width: 4%'>發文時間</th>																					
								</tr>
							</thead>
							<tbody>
								<c:forEach var="Message" items="${mg}">
									<tr>
										<td>${Message.mid}</td>
										<td>${Message.account}</td>
										<td>${Message.mcontent}</td>
										<td>${Message.mtime}</td>																																						
									</tr>
								</c:forEach>
							</tbody>
						</table>					
				</div>				
			</div>			
		</div>
	</div>
</div>
<jsp:include page="dataTables.jsp"/>
<jsp:include page="../administrator/footerback.jsp"/>
<script type="text/javascript">
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