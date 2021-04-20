<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Index</title>
</head>
<body>
	<div align="center">
		<h1>Food Index</h1>
		<form method="get" action="searchFood.controller">
			<input type="text" name="foodId" /> <input type="submit"
				value="Search" />
		</form>
		<h2>
			<a href="<%=request.getContextPath()%>/addFoodIndex.controller">新增食物</a>
		</h2>

		<table border="1" cellpadding="1">
			<tr>
				<th>食物編號</th>
				<th>食物圖片</th>
				<th>食物名稱</th>
				<th>食物價錢</th>
			</tr>

			<c:forEach var="fd" items="${allFoods}">
<%-- 				<c:forEach var="img" items="${img}"> --%>
					<tr>
						<td>${fd.foodid}</td>
						<td><img src="<c:url value = '/getPicture/${fd.foodid}'/>"></td>
						<td>${fd.foodname}</td>
						<td>${fd.foodprice}</td>
					</tr>
<%-- 				</c:forEach> --%>
			</c:forEach>
		</table>

	</div>
</body>
</html>