<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateSchedule.controller" method="post">
電影編號
<input type="text" name="id" value="${schedule.schedule_id}" readonly="readonly"/>
<br>
電影名稱：
<input type="text" name="movieName" value="${schedule.movie.movieName}" readonly="readonly"/>
<br>
影廳名稱：
<input type="text" name="hallName" value="${schedule.hall.hallName}" readonly="readonly"/>
<br>
版本：
<input type="text" name="ticketVersion" value="${schedule.ticketPrice.ticketVersion}" readonly="readonly"/>
<br>
日期：<input type="text" name="scheduleDate" value="${schedule.date}" name ="scheduleDate"/><br>

時間：<input type="text" name="time" value="${schedule.time}" name="time"><br>

<button type="submit">提交</button>
</form>
</body>
</html>