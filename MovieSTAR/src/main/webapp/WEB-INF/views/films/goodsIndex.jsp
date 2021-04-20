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
		<h1>Movie Index</h1>
		<form method="get" action="searchGoods.controller">
			<input type="text" name="goodsId" /> 
			<input type="submit" value="Search" />
		</form>
		<h2>
			<a href="<%= request.getContextPath()%>/addGoodsIndex.controller">新增食物</a>
		</h2>

			<table border="1" cellpadding="1">
				<tr>
					<th>食物編號</th>
					<th>食物名稱</th>
					<th>食物價錢</th>
				</tr>

				<c:forEach var="gd" items="${allGoods}">
					<tr>
						<td>${gd.goodsId}</td>
						<td>${gd.goodsName}</td>
						<td>${gd.goodsPrice}</td>
					</tr>
				</c:forEach>
			</table>
		
	</div>
</body>
</html>