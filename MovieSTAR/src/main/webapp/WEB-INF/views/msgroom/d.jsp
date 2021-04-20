<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://jaysalvat.github.io/vegas/releases/latest/vegas.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="http://jaysalvat.github.io/vegas/releases/latest/vegas.js"></script>
</head>
<body>
<script>
		$('#example, body').vegas({
		slides : [
					{	
						src : 'https://memes.tw/user-gif/739e3d12f1fb1d1c97e6d4abe9c0ef38.gif'
					},
					{	
// 						src : 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcStzO7SKkN1LoQne7RuOn0PhYDqy4ryCA8COs_aRZisa5Y8txY4'
					},
					{	
// 						src : 'https://movies.yahoo.com.tw/i/o/production/movies/December2020/AvNwik1TN1HBp4rU4Qrd-756x1080.jpg'
					},
					{
// 						src : 'https://www.vscinemas.com.tw/vsweb/upload/film/film_20210111002.jpg'
					},
					{
// 						src :'https://movies.yahoo.com.tw/i/o/production/movies/December2020/DJd7b8fZoY8goPRMJSvY-756x1080.jpg'
					}],
						transition : 'fade'
				});
	</script>
</body>
</html>