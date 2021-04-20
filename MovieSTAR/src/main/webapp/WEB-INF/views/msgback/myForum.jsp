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
					<h1 class="page-header">${account}文章管理</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a style="color: blue">${fmfid}</a></li>
						<li class="breadcrumb-item"><a style="color: blue">${account}的文章</a></li>
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
						<table width="100%"	class="table table-striped table-bordered table-hover" id="showForum">
							<thead>
								<tr>
									<th style='width: 1%'>ID</th>
									<th style='width: 3%'>會員</th>
									<th style='width: 10%'>文章</th>
									<th style='width: 5%'>主題</th>
									<th style='width: 4%'>發文時間</th>
<!-- 									<th style='width: 2%'>查看</th>									 -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="forum" items="${fm}">
									<tr>
										<td>${forum.fid}</td>
										<td>${forum.account}</td>
										<td>${forum.article}</td>
										<td>${forum.fmovie}</td>
										<td>${forum.ftime}</td>																													
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
//點選刪除
function del(id){	
	const swalWithBootstrapButtons = Swal.mixin({
		  customClass: {
		    confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		  },
		  buttonsStyling: false
		})

		swalWithBootstrapButtons.fire({
		  title: '確定要刪除嗎?',
		  text: "刪除了就無法復原了!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: '刪除!',
		  cancelButtonText: '取消!',
		  reverseButtons: true
		}).then((result) => {			
		  if (result.isConfirmed) {
		      var xhr = new XMLHttpRequest();
				xhr.open("POST","<c:url value='/delForum.controller' />?fid="+id,true);
				var delF = {
						"fdel":document.getElementById("fdel").value,
						"article":document.getElementById("article").value
				}
				xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
				xhr.send(JSON.stringify(delF));
		    swalWithBootstrapButtons.fire(
		      '刪除完成!',
		      '您成功刪除文章了.',
		      'success'
		    ).then(function(){window.location.assign("http://localhost:8081/MovieSTAR/msg/showAll");})
			  	    
		 	}else if (
		  
		    /* Read more about handling dismissals below */
		    result.dismiss === Swal.DismissReason.cancel
		  ) {
		    swalWithBootstrapButtons.fire(
		      '取消',
		      '您已取消刪除了',
		      'error'
		    )
		  }
		})
// 	alert("修改成功");
}
function back(){
	window.location.assign("http://localhost:8081/MovieSTAR/msg/showAll");
}

//DataTable
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