<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
<script src="  ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<jsp:include page="../administrator/cssback.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<style>
	tr th{
		width: 15%
	}
	td{
		vertical-align: middle
	}
</style> 
</head>
<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"></jsp:include> 



<script type="text/javascript">
	window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/arrangeAllHall.controller' />",true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var halls = JSON.parse(xhr.responseText);
				var content = '<table id ="refundTable" class="table table-bordered table-hover" width="100%">';
				content += "<tr><th>影廳</th><th>容量</th><th>示圖</th><th>設置保留位</th><th>修改影廳配置</th><th></th></tr>";
				for(let i=0 ; i<halls.length ; i++){
					var schematicDiagram = "<c:url value='/schematicDiagram/' />";
					var reservedFigure = "<c:url value='/reservedFigure/' />"
					var modifyHall = "<c:url value='/modifyHall/' />";
					var deleteHall = "<c:url value='/deleteHall/' />";

					content += "<tr><td>" + halls[i].hallName + "</td>"
					content += "<td>" + halls[i].total + "</td>"
					content += "<td><a href='" + schematicDiagram + halls[i].hallId + "'><button type='button'>詳情</button></a></td>"
					content += "<td><a href='" + reservedFigure + halls[i].hallId + "'><button type='button'>設置</button></a></td>"
					content += "<td><a href='" + modifyHall + halls[i].hallId + "'><button type='button'>修改</button></a></td>"
					content += "<td><a href='" + deleteHall + halls[i].hallId + "'><button type='button'>刪除</button></a></td></tr>"
				}
				content += "</table>";
				document.getElementById("hallList").innerHTML = content;
			}
		}
	}
</script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>影廳管理</title>
    <style type="text/css">
/*     	*{ */
/*     		padding: 0; */
/*     		margin: 10px auto;	 */
/*     	} */
    </style>
</head>
<body>
<section class="content">
<h3>影廳管理</h3>
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <!-- /.card-header -->
              <div id="hallList" class="card-body">
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
</body>
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
<script type="text/javascript">
$('#refundTable').DataTable({
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
</script>
</html>