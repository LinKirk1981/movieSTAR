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
            <h1>文章管理</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item"><a>所有文章</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

<!-- <body class="hold-transition sidebar-mini"> -->
<!-- <div id="page-wrapper"> -->
<%-- 	<jsp:include page="../administrator/topback.jsp"></jsp:include> --%>

<%-- 	<section class="content-header"> --%>
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row mb-2"> -->
<!-- 				<div class="col-sm-6"> -->
<!-- 					<h1 class="page-header"> -->
<%-- 					<s:message code='listUser'/>文章管理</h1> --%>
<!-- 				</div> -->
<!-- 				<div class="col-sm-6"> -->
<!-- 					<ol class="breadcrumb float-sm-right"> -->
<%-- 						<security:authorize url="/test">  --%>
<%-- 						<li class="breadcrumb-item"><a href="<c:url value="/test"/>" style="color: blue">test</a></li> --%>
<%-- 						</security:authorize>  --%>
<!-- 						<li class="breadcrumb-item"><a style="color: blue">所有文章</a></li> -->
						
<!-- 					</ol> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</section> --%>
	

 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">


<!-- 					<div class="panel-body"> -->
						<table width="100%"	class="table table-striped table-bordered table-hover"	id="showForum">
							<thead>
								<tr>
									<th style='width: 1%'>ID</th>
									<th style='width: 3%'>會員</th>
									<th style='width: 10%'>文章</th>
									<th style='width: 5%'>主題</th>
									<th style='width: 4%'>發文時間</th>								
									<th style='width: 2%'>文章留言</th>
									<th style='width: 5%'>查看</th>
									<security:authorize url="/msg/delForum.controller/*">
									<th style='width: 2%'>檢舉狀態</th>
									<th style='width: 2%'>文章狀態</th>									
									</security:authorize> 
									
<!-- 									<th style='width: 15%'>內容</th> -->
<!-- 									<th style='width: 3%'>標籤</th> -->
<!-- 									<th style='width: 3%'>分類</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="forum" items="${fm}" >
									<tr>
										<td>${forum.fid}</td>
										<td>${forum.account}</td>
										<td>${forum.article}</td>
										<td>${forum.fmovie}</td>
										<td>${forum.ftime}</td>	
										<td>${forum.prestige}</td>								
										<td>
											<s:url value="/msg/${forum.fid}" var="showForum"></s:url>
											<button class='btn btn-primary btn-sm' onclick="seeOneForum(${forum.fid})"><i class="fas fa-eye"></i>查看</button>
											<button class='btn btn-primary btn-sm' onclick="location.href='${showForum}'"><i class="fas fa-eye"></i>查看更多</button>
										</td>
										<security:authorize url="/msg/delForum.controller/*">
											<td>
												<c:choose>											
													<c:when test="${forum.freport == '無'}">
														<a class='btn btn-success btn-sm' ><i class="fas fa-check"></i>良好</a>											
													</c:when>
													<c:otherwise>
														<a class='btn btn-warning btn-sm' onclick="seereport(${forum.fid})"  ><i class="icon fas fa-exclamation-triangle"></i>有檢舉</a>
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${forum.fdel == 1}">
														<a class='btn btn-danger btn-sm' ><i class='fas fa-trash'></i>已刪除</a>
													</c:when>
														
													<c:otherwise>
														<a class='btn btn-info btn-sm'  onclick="del(${forum.fid})" ><i class="fas fa-thumbs-up"></i>未刪除</a>
														<input type="hidden" id="fdel" value=1>										
														<input type="hidden" id="article" value="此文章已被刪除">
	<%-- 													<input type="hidden"  value="${forum.fid}"> --%>
													</c:otherwise>
												</c:choose>
											</td>
										</security:authorize> 										
<!-- 										<td> -->
<%-- 											<c:choose> --%>
<%-- 												<c:when test="${forum.prestige == 0}" > --%>
<!-- 													<a class='btn btn-danger btn-sm' href=''>1未檢舉</a>									 -->
<%-- 												</c:when> --%>
<%-- 												<c:when test="${forum.prestige == 1}"> --%>
<!-- 													<a class='btn btn-info btn-sm' href=''>2未檢舉</a> -->
<%-- 												</c:when> --%>
<%-- 												<c:otherwise> --%>
<!-- 													<a class='btn btn-warning btn-sm' href=''>3未檢舉</a> -->
<%-- 												</c:otherwise> --%>
<%-- 											</c:choose> --%>
<!-- 										</td> -->
<!-- 										<td> -->
<%-- 										<c:if test="${forum.prestige == '0'}"> --%>
<!-- 											<a class='btn btn-danger btn-sm' href=''>未檢舉</a> -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${forum.prestige == '1'}"> --%>
<!-- 											<a class='btn btn-info btn-sm' href=''>以檢舉</a> -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${forum.prestige != ''}"> --%>
<!-- 											123 -->
<%-- 										</c:if> --%>
<!-- 										</td> -->
<%-- 										<td>${forum.fdel}</td> --%>
										
<%-- 										<td>${forum.content}</td> --%>
<%-- 										<td>${forum.tag}</td> --%>
<%-- 										<td>${forum.theme}</td> --%>
										
										
<!-- 										<td> -->
<%-- 											<c:forEach var="title" items="${member.title}" varStatus="loop"> --%>
<%-- 												${title} <c:if test="${not loop.last}">,</c:if> --%>
<%-- 											</c:forEach> --%>
<!-- 										</td> -->
<!-- 										<td> -->
<%-- 											<c:forEach var="title" items="${member.skill}" varStatus="loop"> --%>
<%-- 												${title} <c:if test="${not loop.last}">,</c:if> --%>
<%-- 											</c:forEach> --%>
<!-- 										</td> -->
<!-- 										<td> -->
<%-- 										    <s:url value="/user/${member.mempk}" var="queryUrl" /> --%>
<%-- 											<s:url value="/user/${member.mempk}/delete" var="deleteUrl" /> --%>
<%-- 											<s:url value="/user/${member.mempk}/update" var="updateUrl" /> --%>
<%-- 											<security:authorize url="/user/*"> --%>
<%-- 												<button onclick="location.href='${queryUrl}'" --%>
<!-- 													class="btn btn-info">查看</button> -->
<%-- 											</security:authorize>  --%>
<%-- 											<security:authorize url="/user/*/update"> --%>
<%-- 												<button onclick="location.href='${updateUrl}'" --%>
<!-- 													class="btn btn-primary">更新</button> -->
<%-- 											</security:authorize>  --%>
<%-- 											<security:authorize url="/user/*/delete"> --%>
<%-- 												<button onclick="location.href='${deleteUrl}'" --%>
<!-- 													class="btn btn-danger">刪除</button> -->
<%-- 											</security:authorize> --%>
<!-- 										</td> -->
									</tr>

								</c:forEach>
							</tbody>
						</table>
					

				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
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
				xhr.open("POST","<c:url value='/msg/delForum.controller' />?fid="+id,true);
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
		    ).then(function(){window.location.assign("http://localhost:8080/MovieSTAR/msg/showAll");})
			  	    
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
// 查看檢舉內容
function seereport(id){
	 var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/msg/SeeReport.controller' />?fid="+id,true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
			var report = JSON.parse(xhr.responseText);
			report = "<table width='100%' class='table table-striped table-bordered table-hover'>"
				   + "<thead><tr><th style='width: 10%'>檢舉內容</th></tr></thead>"
				   + "<tbody><tr><td>"+ report.freport +"</td></tr></tbody>"
			
			Swal.fire({
// 		        title: "檢舉內容", 
		        html: report,
		        width: 800,
		        confirmButtonText: "確認", 
		    });
		}
	}
}

//查看
function seeOneForum(id){
	 var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/msg/seeOneForum' />?fid="+id,true);
		xhr.send();	
		console.log(${fid})
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
			var MyForum = JSON.parse(xhr.responseText);
			MyForum = "<table width='100%' class='table table-striped table-bordered table-hover'>"
				   + "<thead><tr><th style='width: 10%' >欄位名稱</th>"
				   + "<th style='width: 90%'>資訊</th></tr></thead>"
				   + "<tbody><tr class='odd gradeA'><td>姓名:</td>"
				   + "<td>" + MyForum.account + "</td></tr>"
				   + "<tr class='even gradeA'><td>主題:</td>"
				   + "<td>" + MyForum.fmovie + "</td></tr>"
				   + "<tr class='even gradeA'><td>標籤:</td>"
				   + "<td>【" + MyForum.tag + "】【"+ MyForum.theme +"】</td></tr>"
				   + "<tr class='even gradeA'><td>標題:</td>"
				   + "<td>" + MyForum.article + "</td></tr>"
				   + "<tr class='even gradeA'><td>內容:</td>"
				   + "<td>" + MyForum.content + "</td></tr>"
				   + "<tr class='even gradeA'><td>發表時間:</td>"
				   + "<td>" + MyForum.ftime + "</td></tr></tbody></table>"
				   		
			Swal.fire({
		        html: MyForum,
		        width: 1200,
		        confirmButtonText: "確認", 
		    });
// 				   Swal.fire({
// // 					   title: 'Are you sure?',
// 					   text: "You won't be able to revert this!",
// // 					   icon: 'warning',
// 					   html: MyForum,
// 				       width: 1200,
// // 					   showCancelButton: true,
// 					   confirmButtonColor: '#3085d6',
// 					   cancelButtonColor: '#d33',
// 					   confirmButtonText: 'Yes, delete it!'
// 					 }).then((result) => {
// 					   if (result.isConfirmed) {
// 					     Swal.fire(
// 					       'Deleted!',
// 					       'Your file has been deleted.',
// 					       'success'
// 					     )
// 					   }
// 					 })
		}
	}
}


//dataTable
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