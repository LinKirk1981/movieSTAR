<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../administrator/cssback.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini">
	<jsp:include page="../administrator/topback.jsp"></jsp:include>
	<script
		src="  ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>

	<!-- Main content -->
	<!--     <section class="content" > -->
	<div class="row">
		<div class="col-md-6">
			<div class="card card-primary">
				<div class="card-header">
					<h3 class="card-title">電影新增</h3>

					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<form id="saveMovie" action="saveMovie" method="POST" Enctype="Multipart/Form-Data"
					style="width: 600; height: 600">
					<div class="card-body">

						<div class="form-group">
							<label for="inputName">電影名稱</label> <input type="text"
								name="movieName" id="movieName" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputName">電影演員</label> <input type="text"
								name="movieActor" id="movieActor" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputName">電影導演</label> <input type="text"
								name="movieDirector" id="movieDirector" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputName">電影分級</label> <input type="text"
								name="movieRating" id="movieRating" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputName">電影類型</label> <input type="text"
								name="movieType" id="movieType" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputDescription">電影詳情</label>
							<textarea name="movieDetail" id="movieDetail"
								class="form-control" rows="4"></textarea>
						</div>

						<div class="form-group">
							<label for="inputDescription">電影預告</label> <input type="text"
								name="movieTrailer" id="movieTrailer" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputDescription">電影圖片</label> <input type="file"
								name="movieImage" id="movieImage" class="form-control" />
						</div>

						<div class="form-group">
							<label for="inputDescription">電影日期</label> <input type="date"
								name="movieDate" id="movieDate" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputDescription">電影時長</label> <input type="text"
								name="movieDuration" id="movieDuration" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputClientCompany">電影公司</label> <input type="text"
								name="movieCompany" id="movieCompany" class="form-control">
						</div>

						<div class="form-group">
							<label for="inputStatus">電影狀態</label> <input type="text"
								name="movieState" id="movieState" class="form-control" placeholder="0=下架 1=上架">
						</div>
						<button type="button"  onclick="sb()">提交</button>
						<button type="button" id="addfast" onclick="addfast()">一鍵輸入</button>


					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var addfast = document.getElementById("addfast");
	addfast.onclick =function(){
		var movieName = document.getElementById("movieName");
		var movieActor = document.getElementById("movieActor");
		var movieDirector = document.getElementById("movieDirector");
		var movieRating = document.getElementById("movieRating");
		var movieType = document.getElementById("movieType");
		var movieDetail = document.getElementById("movieDetail");
		var movieTrailer = document.getElementById("movieTrailer");
		var movieDate = document.getElementById("movieDate");
		var movieDuration = document.getElementById("movieDuration");
		var movieCompany = document.getElementById("movieCompany");
		var movieState = document.getElementById("movieState");
		movieName.value="死亡連鎖";
		movieActor.value="瓊休塔斯(Jon Huertas) 、 伊莎貝拉戈梅茲(Isabella Gomez) 、 琳賽拉凡琪(Lindsay LaVanchy) 、 佛洛伊古提爾雷斯(Froy Gutierrez)";
		movieDirector.value="約翰貝拉多(John Berardo)";
		movieRating.value="PG_15";
		movieType.value="懸疑、驚悚、恐怖";
		movieDetail.value="接二連三的死亡事件引起惠頓大學學生的恐慌，兇手透過一個社群媒體遊戲來決定下手目標。三名姊妹會成員決定在成為下一位受害者之前，追查出兇手的真實身分，卻意外挖掘出這所大學背後隱藏的黑暗祕密……。";
		movieTrailer.value="https://www.youtube.com/embed/etPeUjqSpFk";
		movieDate.value="2021-05-07";
		movieDuration.value="未提供";
		movieCompany.value="車庫娛樂";
		movieState.value="0";
	}
        function sb(){
		Swal.fire({
			  title: '是否新增電影?',
			  showDenyButton: true,
// 			  showCancelButton: true,
			  confirmButtonText: `是`,
			  denyButtonText: `否`,
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  Swal.fire({
				      icon: 'success',
				      title: '新增成功',
				      showConfirmButton: false,
				      timer: 1500
				    });
			    setTimeout(function(){document.getElementById("saveMovie").submit()},1500)
			  } else if (result.isDenied) {
			    Swal.fire('Changes are not saved', '', 'info')
			  }
			})
		
		
	}
	


</script>
</html>
<jsp:include page="../administrator/footerback.jsp"></jsp:include>
