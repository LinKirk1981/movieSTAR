<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/css.jsp"></jsp:include>

<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
    
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: rgb(230, 230, 255);
}

/* Style the buttons inside the tab */
.tab button {
	margin:0,auto;
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 20px;
	transition: 0.3s;
	font-size: 20px;
}

/* Change background color of buttons on hover*/
.tab button:hover {
	background-color: #ffffff;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: red;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 5px solid green;
	border-top: none;
}

.gallerycontainer{
 position: relative; 
/*Add a height attribute and set to largest image's height to prevent overlaying*/
}

.thumbnail img{
visibility: visible; 
border: 1px solid white;
margin: 0 ;
}

.thumbnail:hover{
background-color: transparent;
}

.thumbnail:hover img{
/* border: 1px solid blue; */
}

.thumbnail span{ /*CSS for enlarged image*/
position: absolute;
background-color:#0be01d ;
padding: 1px;
left: -1000px;
/* border: 1px dashed gray; */
visibility: hidden;
color: black;
text-decoration: none;
}

.thumbnail span img{ /*CSS for enlarged image*/
border-width: 0;
padding: 1px;
}

.thumbnail:hover span{ /*CSS for enlarged image*/
visibility: visible; 
top: 450px;
left: 800px; /*position where enlarged image should offset horizontally */
z-index: inherit;
}


</style>

</head>

<body>
	<jsp:include page="../user/nvigationBar.jsp"></jsp:include>
	<div class="breadcrumbs">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="<c:url value="/"/>"><span class="fa fa-home"></span>首頁</a></li>
				<li>討論區</li>
			</ul>
			<ul class="go-home">
				<li><a href="<c:url value="./"/>">返回首頁</a></li>
			</ul>
		</div>
	</div>
	<div class="main page-template">
		<div class="inner-page">
			<div class="container">
				<div class="comment-area">
					<div class="row" align="left">
						<div class="tab" >
							<button class="tablinks" onclick="openMovie(event, 'HotMovie')"
								id="defaultOpen" >熱門電影</button>
							<button class="tablinks"
								onclick="openMovie(event, 'ComingSoonMovie')">即將上映</button>
						</div>

						<div id="HotMovie" class="tabcontent">
							<table class="tbst" width="auto" height="auto">
								<tbody style="text-align: left;">
									<c:forEach var='Movie' items='${Movies}'>
										<tr>
											<td><h1 style="color:#0be01d">${Movie.movieId}.</h1></td>
											<td>
											<div class="tag-category tag-1" >
											     <ul>
											       <li><a class="thumbnail" href="saveForum?movie=${Movie.movieName}"  type="button"
											        style=" font-size: 24px">${Movie.movieName}<span><img src="<c:url value = '/getMoviePicture/${Movie.movieId}'/>"  width="600px" height="auto" >
											       </span></a></li>
											     </ul> 
											</div>
											</td>										
										</tr>
									</c:forEach>				
								</tbody>

							</table>
							<img src="" id="imageshow"  style="display:none"/>
						</div>

						<div id="ComingSoonMovie" class="tabcontent" >
							<table class="tbst" height="1000px">
								<tbody style="text-align: left;">
									<c:forEach var='csmv' items='${csmv}'>
										<tr>
											<td><h1 style="color:#0be01d">${csmv.movieId}.</h1></td>
											<td>
											<div class="tag-category tag-1">
											     <ul>
											       <li><a class="thumbnail" href="saveForum?movie=${csmv.movieName}"  type="button"
											        style=" font-size: 24px">${csmv.movieName}<span><img src="<c:url value = '/getMoviePicture/${csmv.movieId}'/>"  width="600px" height="auto" >
											       </span></a></li>     
											     </ul>
											</div>											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>



					</div>
				</div>
			</div>
			<jsp:include page="../user/footer.jsp"></jsp:include>
		</div>
	</div>
	<%-- <a href="<c:url value="/saveForum" />">發表文章</a> --%>

	<script>
	
	
// 		function showPic(){
			
// 			document.getElementById('imageshow').style.display='block';
			
// 		}
		
// 		function hideIt()
// 		{
// 		document.getElementById('imageshow').style.display='none';
// 		}
	
		function openMovie(evt, movieName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(movieName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>
</html>