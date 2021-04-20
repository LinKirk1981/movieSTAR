<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../administrator/cssback.jsp"></jsp:include> 
</head>
<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"></jsp:include> 
<script src=" ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
	<div align="left">
		<h2>電影修改</h2>
		<form id="updatemv" action="updateMovie" method="POST" Enctype="Multipart/Form-Data">
		<div>
		<c:forEach var="mv1" items="${mvList}">
					<div class="row" >
        <div class="col-md-6">
          <div class="card card-primary" >
            <div class="card-header">
              <h3 class="card-title">電影修改</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">編號</label>
                <input type="text" name="movieId" id="movieId" class="form-control" value="${mv1.movieId}">
              </div>
            
              <div class="form-group">
                <label for="inputName">電影名稱</label>
                <input type="text" name="movieName" id="movieName" class="form-control" value="${mv1.movieName}">
              </div>
              
              <div class="form-group">
                <label for="inputName">電影演員</label>
                <input type="text" name="movieActor" id="movieActor" class="form-control" value="${mv1.movieActor}">
              </div>
              
              <div class="form-group">
                <label for="inputName">電影導演</label>
                <input type="text" name="movieDirector" id="movieDirector" class="form-control" value="${mv1.movieDirector}">
              </div>
              
              <div class="form-group">
                <label for="inputName">電影分級</label>
                <input type="text" name="movieRating" id="movieRating" class="form-control" value="${mv1.movieRating}">
              </div>
              
              <div class="form-group">
                <label for="inputName">電影類型</label>
                <input type="text" name="movieType" id="movieType" class="form-control" value="${mv1.movieType}">
              </div>
              
              <div class="form-group">
                <label for="inputDescription">電影詳情</label>
                <textarea name = "movieDetail" id="movieDetail" class="form-control" rows="4"">${mv1.movieDetail}</textarea>
              </div>
              
              <div class="form-group">
                <label for="inputDescription">電影預告</label>
                <input type="text" name="movieTrailer" id="movieTrailer" class="form-control" value="${mv1.movieTrailer}">
              </div>
              
              <div class="form-group">
                <label for="inputDescription">電影圖片</label>
                <input type="file" name="movieImage" id="movieImage" value="${mv1.movieImage}" class="form-control"/>
              </div>
              
              <div class="form-group">
                <label for="inputDescription">電影日期</label>
                <input type="date" name="movieDate" id="movieDate" value="${mv1.movieDate}" class="form-control">
              </div>
              
              <div class="form-group">
                <label for="inputDescription">電影時長</label>
                <input type="text" name="movieDuration" id="movieDuration" value="${mv1.movieDuration}" class="form-control">
              </div>
              
              <div class="form-group">
                <label for="inputClientCompany">電影公司</label>
                <input type="text" name="movieCompany" id="movieCompany" value="${mv1.movieCompany}" class="form-control">
              </div>
              
              <div class="form-group">
                <label for="inputStatus">電影狀態</label>
                <input type="text" name="movieState" id="movieState" class="form-control" value="${mv1.movieState}">
              </div>
<!--               <input type="submit"  value="提交"> -->
              <button type="button" onclick="sb()">提交</button>
              
              
            </div>
					</c:forEach>
		</div>
		</form>
	</div>
	<jsp:include page="../administrator/footerback.jsp"></jsp:include>
	<script type="text/javascript">
	function sb(){
	Swal.fire({
		  title: '是否提交?',
		  showDenyButton: true,
		  showCancelButton: true,
		  confirmButtonText: `是`,
		  denyButtonText: `否`,
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			  Swal.fire({
			      icon: 'success',
			      title: '儲存成功',
			      showConfirmButton: false,
			      timer: 1500
			    });
		    setTimeout(function(){document.getElementById("updatemv").submit()},1500)
		  } else if (result.isDenied) {
		    Swal.fire('Changes are not saved', '', 'info')
		  }
		})
	}
	</script> 
</body>
</html>