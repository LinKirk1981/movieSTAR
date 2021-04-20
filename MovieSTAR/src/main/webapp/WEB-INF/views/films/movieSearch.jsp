<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieSearch</title>
</head>
<body>
	<table border="1" cellpadding="1">
		<tr>
					<th>MOVIE_ID</th>
					<th>MOVIE_NAME</th>
					<th>MOVIE_ACTOR</th>
					<th>MOVIE_DIRECTOR</th>
					<th>MOVIE_RATING</th>
					<th>MOVIE_TYPE</th>
					<th>MOVIE_DETAIL</th>
					<th>MOVIE_TRAILER</th>
					<th>MOVIE_IMAGE</th>
					<th>MOVIE_DATE</th>
					<th>MOVIE_DURATION</th>
					<th>MOVIE_COMPANY</th>
					<th>MOVIE_STATE</th>
			        <th>MOVIE_SCHEDULE</th>
		</tr>

		<c:forEach var="mv" items="${mvList}">
			<tr>
				<th>${mv.movieId}</th>
				<th>${mv.movieName}</th>
				<th>${mv.movieActor}</th>
				<th>${mv.movieDirector}</th>
				<th>${mv.movieRating}</th>
				<th>${mv.movieType}</th>
				<th>${mv.movieDetail}</th>
				<td>
					<iframe width="200" height="200" src="${mv.movieTrailer}"></iframe>
				</td>
				<th><img src="${pageContext.request.contextPath}/image/${mv.movieId}.jpg" width="200px" height="200px"></th>
				<th>${mv.movieDate}</th>
				<th>${mv.movieDuration}</th>
				<th>${mv.movieCompany}</th>
				<th>${mv.movieState}</th>
				<th>${mv.schedules}</th>
			</tr>
			<a href="movieIndex.controller">回到首頁</a>
		</c:forEach>
	</table>
</body>
</html>