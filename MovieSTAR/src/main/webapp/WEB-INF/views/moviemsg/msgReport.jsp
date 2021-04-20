<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/css.jsp"></jsp:include>  
</head>
<body>
<jsp:include page="../user/nvigationBar.jsp"></jsp:include>
        <div class="breadcrumbs">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/"/>"><span class="fa fa-home"></span>首頁</a></li>
                    <li><a href="/MovieSTAR/movieList.controller">電影時刻</a></li>
                    <li><a href="/MovieSTAR/movieDetail/${x}">電影介紹</a></li>
                    <li>檢舉</li>
                </ul>
                <ul class="go-home">
                    <li><a href="<c:url value="../"/>">返回首頁</a></li>
                </ul>
            </div>
        </div>
<div class="main page-template" >
  <div class="inner-page">
      <div class="container">
		<div class="comment-area">
         <div class="row" >
          <ul class="breadcrumb">
			<li><a style="color: #13be13" ><h2>檢舉頁面</h2></a><br></li> <!-- style="color: rgb(24, 194, 46)"  -->
		 </ul>
			 <div class="form-group" >
			     <textarea rows="13" cols="150" id="mreport"  placeholder="檢舉內容" style="background-color: rgb(68, 64, 64); color: white;"	required ></textarea>
		     </div>
	 <div class="buttons">
		<button type="button" id="msgReport" onclick="sendReport()">送出</button>
	 </div>
	
	<script type="text/javascript">
	//修改
	function sendReport(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/msgmovieReport.controller'/>",true);
		var jsonmsgfather = {
				"mid":${mid},
				"mreport":document.getElementById("mreport").value
		}

		xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr.send(JSON.stringify(jsonmsgfather));
		
		Swal.fire({
			  icon: 'success',
			  title: '檢舉成功!',
			  showConfirmButton: false,
			  timer: 1500
			}).then(function(){window.location.assign("http://localhost:8080/MovieSTAR/movieDetail/${x}");})
// 		Swal.fire('檢舉成功!').then(function(){window.location.assign("http://localhost:8080/MovieSTAR/movieDetail/${x}");})
// 		window.location.assign("http://localhost:8080/MovieSTAR/movieDetail/${x}");//回文章列表
	}
	</script>
					</div>
	 			</div>
	 		</div>
<jsp:include page="../user/footer.jsp"></jsp:include>     
		</div>
	 </div>
</body>
</html>