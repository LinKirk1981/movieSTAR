<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="saveFood" method="post" enctype="multipart/form-data">
		輸入食物：<input type="text" name="foodName"><br>
		輸入價錢：<input type="text" name="foodPrice"><br>
		輸入圖片：<input type="file" name="foodImage">
		<input type="submit" value="提交">
	</form>
</body>
</html>