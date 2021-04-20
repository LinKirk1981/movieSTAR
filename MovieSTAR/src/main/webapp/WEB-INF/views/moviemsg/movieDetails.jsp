<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<jsp:include page="../user/css.jsp"></jsp:include> 

<body>
<jsp:include page="../user/nvigationBar.jsp"></jsp:include>
<jsp:include page="head.jsp"></jsp:include>

        <div class="inner-page">
            <!-- PRODUCT LIST VIEW -->
            <div class="container">
                <div class="details-page"><br><br><br><br><br><br><br><br><br><br><br>
<!--                     <div class="details-big-img"> -->
<%--                         <img src="<c:url value = '/getMoviePicture/${movie.movieId}'/>"  style="display:block; margin:auto;width:1100px ; height:600px;"> --%>
<!--                         <div class="play-icon"> -->
<%--                             <a href="" class="flat-icons" data-video-url="${movie.movieTrailer}"><span class="flaticon-play-button"></span></a> --%>
<!--                         </div> -->
<!--                     </div> -->
                    <div class="details-contents">
                        <div class="row">
                            <div class="col-md-offset-1 col-lg-offset-1 col-lg-11 col-md-11 col-sm-12 col-xs-12">
                                <div class="details-content">
                                    <!-- REVIEW WITH IMAGE -->
                                    <div class="details-reviews">
                                        <div class="row">
                                            <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                                                <div class="dec-review-img">
                                                   
                                                   
                                                    <img src="data:image/png;base64,${img}" width="auto" height="600px"/>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
                                                <div class="dec-review-dec">
                                                    <div class="details-title">
                                                        <h2>${movie.movieName}</h2>
                                                    </div>
                                                    <div class="ratting">
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                        <a href="">6/5 ratitng</a>
                                                    </div>
                                                    <div class="dec-review-meta">
                                                        <ul>
                                                            <li><span>類型<label>:</label></span><a href="">${movie.movieType}</a></li>
                                                            <li><span>演員<label>:</label></span><a href="">${movie.movieActor}</a></li>
                                                            <li><span>導演 <label>:</label></span><a href="">${movie.movieDirector}</a></li>
                                                            <li><span>上映日期<label>:</label></span><a href="">${movie.movieDate}</a></li>
                                                            <li><span>時長<label>:</label></span><a href="">${movie.movieDuration}</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="social-links">
                                                        <strong>Share :</strong>
                                                        <a href="" class="socila-fb"><span class="fa fa-facebook"></span></a>
                                                        <a href="" class="socila-tw"><span class="fa fa-twitter"></span></a>
                                                        <a href="" class="socila-sk"><span class="fa fa-skype"></span></a>
                                                        <a href="" class="socila-pin"><span class="fa fa-pinterest"></span></a>
                                                        <a href="" class="socila-ins"><span class="fa fa-instagram"></span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END REVIEW WITH IMAGE -->
                                    <!-- DISCRIPTION -->
                                    <div class="details-dectiontion">
                                        <h2 class="title">故事簡介：</h2>
                                        <p>${movie.movieDetail}</p>
                                        <br>
                                        <iframe width="1024" height="768" src="${movie.movieTrailer}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>
                                     
 <jsp:include page="movieMsg.jsp"></jsp:include> 
 
 <section class="category-movie pb-75">
	<!-- HADDING SECTION -->
	<div class="haddings">
		<div class="container">
			<div class="hadding-area">
				<h2>電影快搜</h2>
				<p>猜你喜歡</p>
			</div>
		</div>
	</div>
	<!-- HADDING SECTION -->
	<!-- ITEMS -->
	<div class="category-movie-items col-4">
		<div class="container">
			<div class="cat-menu">
				<ul class="nav nav-tabs tab-menu">
					<li class="active"><a data-toggle="tab" href="#latestmovie"><span>即將上映</span></a></li>
				</ul>
			</div>
			<div class="category-items">
				<div class="tab-contents">
					<div id="latestmovie" class="tab-pane fade active in"
						role="tabpanel">
						<div class="category-slide2">
							<c:forEach var="csmv" items="${csmv}">
							<div class="item">
								<div class="movie-item-contents gradient">
									<img
										src="<c:url value = '/getMoviePicture/${csmv.movieId}'/>"
										alt="" style="height: 400px">
									<div class="movie-item-content">
										<div class="movie-item-content-top">
											<div class="pull-left">
												<span class="movie-count-time hover-left">${csmv.movieDate}</span>
											</div>
											<div class="pull-right">
												<div class="movie-ratting">
													<a href=""><span class="fa fa-star"></span>20/20</a>
												</div>
											</div>
										</div>
										<div class="movie-item-content-center">
											<a href="" class="flat-icons"
												data-video-url="https://www.youtube.com/watch?v=lpVoG37vUls&feature=emb_title"><span
												class="flaticon-play-button"></span></a>
										</div>
										<div class="movie-item-content-buttom">
											<div class="movie-item-title">
												<a href="">${csmv.movieName}</a>
											</div>
											<div class="item-cat">
												
												<div class="item-cat-hover">
													<ul>
														<li><span>上映日期:</span><a href="">${csmv.movieDate}</a></li>
														<li><span>分類:</span><a href="">${csmv.movieType}</a></li>
													</ul>
												</div>
											</div>
											<div class="movie-item-beta">
												<div class="movie-details">
													<a href="" class="btn btn-button button-detals blck-bg">details</a>
												</div>
												<div class="view-movie hover-right">
													<a class="blck-bg" href="">15k view</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
									</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END ITEMS -->
</section>
  
 <jsp:include page="../user/footer.jsp"></jsp:include>                                
</body>

</html>