<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">


<jsp:include page="../administrator/cssback.jsp"></jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<script type="text/javascript">

$(document).ready(function() {
	$('#m').DataTable({
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


</head>
<body class="hold-transition sidebar-mini"> 
<script src="  ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<jsp:include page="../administrator/topback.jsp"></jsp:include> 
<!--   <div class="content-wrapper"> -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>電影後臺</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">後臺首頁</a></li>
              <li class="breadcrumb-item active">行程後臺</li>
              <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/addScheduleIndex.controller">新增行程</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">行程後臺</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <!-- 電影table -->
        <section class="content">
	<div id="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<table width="100%"
							 class="table table-bordered table-hover"
							id="m">
							<thead>
								<tr>
                  <tr>
                      <th style="width: 15%" class="text-center">
                    	編號
                      </th>
                      
                      <th style="width: 15%" class="text-center">
                    	電影名稱
                      </th>
                      
                      <th style="width: 15%" class="text-center">
                    	電影廳位置
                      </th>
                      
                      <th style="width: 15%" class="text-center">
                    	電影版本
                      </th>
                      
                      <th style="width: 15%" class="text-center">
                      	日期
                      </th>
                      
                      <th style="width: 10%" class="text-center">
                    	時間
                      </th>
                      
                      <th style="width: 20%" class="text-center">
                    	控制項
                      </th>
                      
                      
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="as" items="${allSchedules}">
                <tr>
                      <td id="scheduleid" style="vertical-align: middle;">
                          ${as.schedule_id}
                      </td>       
                      
                      <td id="moviename" style="vertical-align: middle;">
                          <a>
                              ${as.movie.getMovieName()}
                          </a>
                      </td>
                      
                      <td id="hallname" style="vertical-align: middle;">
                          ${as.hall.getHallName()}
                      </td>
                      
                      <td id="ticketversion" style="vertical-align: middle;">
                      ${as.ticketPrice.getTicketVersion()}
                      </td>
                      <td id="scheduledate" style="vertical-align: middle;">
                          ${as.date}
                      </td>
                      <td id="scheduletime" style="vertical-align: middle;">
                          <a>
                              ${as.time}
                          </a>
                      </td>
                      
                      <td class="project-actions text-right" >
                           <a class="btn btn-primary btn-sm" onclick="details(${as.schedule_id})">
                              <i class="far fa-eye">
                              </i>	
                              檢視
                          </a>
                          <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/updateSchedule?id=${as.schedule_id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                         	編輯
                          </a>
                          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/deleteSchedule?id=${as.schedule_id}">
                              <i class="fas fa-trash">
                              </i>
                          	刪除
                          </a>
                      </td>
                       
                  </tr>
                </c:forEach>
              </tbody>
          </table>
          <jsp:include page="../administrator/footerback.jsp"/>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
</div>
    </section>
    <!-- /.content -->
<!--   </div> -->
  <!-- /.content-wrapper -->
</body>

<script type="text/javascript">



function details(id){
	var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/searchSchedule.controller' />?id="+id,true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
		var schedule = JSON.parse(xhr.responseText);
		schedule = "<table width='100%' class='table table-striped table-bordered table-hover'>"
			   + "<thead><tr><th style='width: 10%'>行程編號</th></tr></thead>"
			   + "<tbody><tr><td>"+ schedule.schedule_id +"</td></tr></tbody>"
			   + "<thead><tr><th style='width: 10%'>電影名稱</th></tr></thead>"
			   + "<tbody><tr><td>"+ schedule.movie.movieName +"</td></tr></tbody>"
			   + "<thead><tr><th style='width: 10%'>電影廳位置</th></tr></thead>"
			   + "<tbody><tr><td>"+ schedule.hall.hallName +"</td></tr></tbody>"
			   + "<thead><tr><th style='width: 10%'>電影版本</th></tr></thead>"
			   + "<tbody><tr><td>"+ schedule.ticketPrice.ticketVersion +"</td></tr></tbody>"
			   + "<thead><tr><th style='width: 10%'>日期</th></tr></thead>"
			   + "<tbody><tr><td>"+ schedule.date +"</td></tr></tbody>"
			   + "<thead><tr><th style='width: 10%'>時間</th></tr></thead>"
			   + "<tbody><tr><td>"+ schedule.time +"</td></tr></tbody>"
		
		Swal.fire({
		    title: "行程詳情", 
	        html: schedule,
	        width: 800,
	        confirmButtonText: "確認", 
	    });
	}
}
}



</script>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
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
</html>
