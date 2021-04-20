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

			<table border="1" cellpadding="1">
				<tr>
					<th>食物編號</th>
					<th>食物名稱</th>
					<th>食物價錢</th>
				</tr>

				<c:forEach var="fd" items="${foods}">
					<tr>
						<td>${fd.foodId}</td>
						<td>${fd.foodName}</td>
						<td>${fd.foodPrice}</td>
					</tr>
				</c:forEach>
			</table>
		
	</div>
</body>
</html>