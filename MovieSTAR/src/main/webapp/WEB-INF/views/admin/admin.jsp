<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="../administrator/cssback.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</head>

<body class="hold-transition sidebar-mini">
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
 
   <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
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


      <div class="card-body">
      <table width="100%"
       class="table table-striped table-bordered table-hover"
       id="dataTables-imoviemembers">
       <thead>
        <tr>
         <th style='width: 5%'>姓名</th>
         <th style='width: 5%'>信箱</th>
         <th style='width: 5%'>編號</th>
         <th style='width: 5%'>電話</th>
         <th style='width: 5%'>職稱</th>
         <th style='width: 5%'>技能</th>
         <th style='width: 10%'>修改</th>
        </tr>
       </thead>
       <tbody>
        <c:forEach var="member" items="${imoviemembers}">
         <tr>
          <td>${member.name}</td>
          <td>${member.emailbox}</td>
          <td>${member.memberid}</td>
          <td>${member.cell}</td>
          <td>
           <c:forEach var="title" items="${member.title}" varStatus="loop">
            ${title} <c:if test="${not loop.last}">,</c:if>
           </c:forEach>
          </td>
          <td>
           <c:forEach var="title" items="${member.skill}" varStatus="loop">
            ${title} <c:if test="${not loop.last}">,</c:if>
           </c:forEach>
          </td>
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
<script>
 $(document).ready(function() {
  $('#dataTables-imoviemembers').DataTable({
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