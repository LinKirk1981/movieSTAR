<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../administrator/cssback.jsp"></jsp:include> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition sidebar-mini">
<script src="  ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<jsp:include page="../administrator/topback.jsp"></jsp:include> 

<div style="margin:0px auto">
<form action="saveSchedule" method="post">

電影名稱：
<select name="movieName">
<c:forEach var="mv" items="${mv}">
<option value="${mv.movieName}">${mv.movieName}</option>
</c:forEach>
</select>
<br>
影廳名稱：
<select name="hallName">
<c:forEach var="ha" items="${ha}">
<option value="${ha.hallName}">${ha.hallName}</option>
</c:forEach>
</select>
<br>
版本：
<select name="ticketVersion">
<c:forEach var="tp" items="${tp}">
<option value="${tp.ticketVersion}">${tp.ticketVersion}</option>
</c:forEach>
</select>
<br>
日期：<input type="text" name ="scheduleDate"/><br>

時間：<input type="text" name="time"><br>


<input type="submit" value="submit">


</form>
</div>
<jsp:include page="../administrator/footerback.jsp"></jsp:include> 
</body>
</html>