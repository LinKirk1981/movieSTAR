<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<jsp:include page="user/css.jsp"/>
</head>

<body>
    <div class="main">
        <jsp:include page="user/nvigationBar.jsp"/>
        <!-- slider section -->
        <div class="slider-section carousel bs-slider fade control-round indicators-line" id="bootstrap-touch-slider" data-ride="carousel" data-pause="hover" data-interval="5000">
            <div class="slider-items carousel-inner" role="listbox">
                <div class="item active">
                    <div class="slider-img">
                        <img src="${pageContext.request.contextPath}/user/images/01.png" alt="">
                    </div>
                </div>
                <div class="item">
                    <div class="slider-img">
                        <img src="${pageContext.request.contextPath}/user/images/02.png" alt="">
                    </div>
                </div>
            </div>
            <!-- Left Control -->
            <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev">
                <span class="flaticon-send" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <!-- Right Control -->
            <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next">
                <span class="flaticon-send" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- end slider section -->
        <!-- CATEGORY MOVIE -->
        <section class="top-rating pt-75">
            <!-- HADDING SECTION -->
            <div class="haddings">
                <div class="container">
                    <div class="hadding-area">
                        <h2 style="font-size: 40px;">熱門電影</h2>
                    </div>
                </div>
            </div>
            <!-- HADDING SECTION -->
            <!-- ITEMS -->
            <div class="Top-rating-items pt-50">
                <div class="container">
                    <div class="row">
                        <ul class="slider" id="toprating">
                            <li class="item">
                                <div class="movie-item-contents gradient">
                                    <img src="https://www.ambassador.com.tw/assets/img/movies/MortalKombat_180x270_Poster.jpg" alt="">
                                    <div class="movie-item-content">
                                        <div class="movie-item-content-center">
                                            <a href="" class="flat-icons" data-video-url="https://youtu.be/f7sQU1Ae3wg"><span class="flaticon-play-button"></span></a>
                                        </div>
                                        <div class="movie-item-content-buttom">
                                            <div class="movie-item-title">
                                                <a style="font-size: 30px;">真人快打</a>
                                            </div>
                                            <div class="item-cat">
                                                <ul>
                                                    <li><span>片長：</span><a>1時53分</a></li>
                                                </ul>
                                                <div class="item-cat-hover">
                                                    <ul>
                                                        <li><span>類型</span></li>
                                                        <li><span>動畫、冒險</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="movie-item-beta">
                                                <div class="movie-details">
                                                    <a style="font-size: 20px;" href="<c:url value='/buyMovieTicket/' />+16" class="btn btn-button button-detals blck-bg">線上訂票</a>
                                                </div>
                                                <div class="view-movie">
                                                    <a style="font-size: 20px;" class="blck-bg" href="<c:url value='/movieDetail/16'/>">電影介紹</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="item">
                                <div class="movie-item-contents gradient">
                                    <img src="https://www.ambassador.com.tw/assets/img/movies/SeoBok_180x270_Poster.jpg" alt="">
                                    <div class="movie-item-content">
                                        <div class="movie-item-content-center">
                                            <a href="" class="flat-icons" data-video-url="https://youtu.be/rteuF8m-zx0"><span class="flaticon-play-button"></span></a>
                                        </div>
                                        <div class="movie-item-content-buttom">
                                            <div class="movie-item-title">
                                                <a style="font-size: 30px;">永生戰</a>
                                            </div>
                                            <div class="item-cat">
                                                <ul>
                                                    <li><span>片長：</span><a>1時53分</a></li>
                                                </ul>
                                                <div class="item-cat-hover">
                                                    <ul>
                                                        <li><span>類型</span></li>
                                                        <li><span>動畫、冒險</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="movie-item-beta">
                                                <div class="movie-details">
                                                    <a style="font-size: 20px;" href="<c:url value='/buyMovieTicket/1' />" class="btn btn-button button-detals blck-bg">線上訂票</a>
                                                </div>
                                                <div class="view-movie">
                                                    <a style="font-size: 20px;" class="blck-bg" href="<c:url value='/movieDetail/1'/>+1">電影介紹</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="item">
                                <div class="movie-item-contents gradient">
                                    <img src="https://www.ambassador.com.tw/assets/img/movies/NobodyNEW_180x270_Poster.jpg" alt="">
                                    <div class="movie-item-content">
                                        <div class="movie-item-content-center">
                                            <a href="" class="flat-icons" data-video-url="https://youtu.be/Cip0TZd4ohQ"><span class="flaticon-play-button"></span></a>
                                        </div>
                                        <div class="movie-item-content-buttom">
                                            <div class="movie-item-title">
                                                <a style="font-size: 30px;">無名弒</a>
                                            </div>
                                            <div class="item-cat">
                                                <ul>
                                                    <li><span>片長：</span><a>1時53分</a></li>
                                                </ul>
                                                <div class="item-cat-hover">
                                                    <ul>
                                                        <li><span>類型</span></li>
                                                        <li><span>動畫、冒險</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="movie-item-beta">
                                                <div class="movie-details">
                                                    <a style="font-size: 20px;" href="<c:url value='/buyMovieTicket/7' />" class="btn btn-button button-detals blck-bg">線上訂票</a>
                                                </div>
                                                <div class="view-movie">
                                                    <a style="font-size: 20px;" class="blck-bg" href="<c:url value='/movieDetail/7'/>">電影介紹</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="item">
                                <div class="movie-item-contents gradient">
                                    <img src="https://www.ambassador.com.tw/assets/img/movies/RayaandtheLastDragon_180x270_Poster.jpg" alt="">
                                    <div class="movie-item-content">
                                        <div class="movie-item-content-center">
                                            <a href="" class="flat-icons" data-video-url="https://youtu.be/rteuF8m-zx0"><span class="flaticon-play-button"></span></a>
                                        </div>
                                        <div class="movie-item-content-buttom">
                                            <div class="movie-item-title">
                                                <a>尋龍使者：拉雅</a>
                                            </div>
                                            <div class="item-cat">
                                                <ul>
                                                    <li><span>片長：</span><a>1時53分</a></li>
                                                </ul>
                                                <div class="item-cat-hover">
                                                    <ul>
                                                        <li><span>類型</span></li>
                                                        <li><span>動畫、冒險</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="movie-item-beta">
                                                <div class="movie-details">
                                                    <a style="font-size: 20px;" href="<c:url value='/buyMovieTicket/5' />" class="btn btn-button button-detals blck-bg">線上訂票</a>
                                                </div>
                                                <div class="view-movie">
                                                    <a style="font-size: 20px;" class="blck-bg" href="<c:url value='/movieDetail/5'/>">電影介紹</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- END ITEMS -->
        </section>
        <!-- END CATEGORY MOVIE -->
        <!-- NEW MOVIE -->
        <section class="new-movie pt-75">
            <!-- HADDING SECTION -->
            
            <!-- HADDING SECTION -->
            
        </section>
        <!-- END NEW MOVIE -->
        
        <!-- LATEST NEWS -->
        <section class="latest-news-section pt-75">
            <!-- HADDING SECTION -->
            
            <!-- HADDING SECTION -->
            
        </section>
        <!-- END LATEST NEWS -->
        <!-- START BUY TICKECT -->
        <div class="buy-ticket-section">
            <div class="buy-ticket-inner">
                <div class="container">
                    <div class="buy-ticket-bg">
                        <div class="row">
                            <form action='<c:url value="/fastBuyView.controller" />' method="POST" id="fastBooking">
                                <div class="buy-ticket-item">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 sm-width">
                                        <div class="buy-ticket-select">
                                            <select name="movie" id="movie" class="form-control" onchange="dateItem()">
                                                <option value="0">選擇電影</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 sm-width">
                                        <div class="buy-ticket-select">
                                            <select name="date" id="date" class="form-control" onchange="timeItem()">
                                                <option value="0">選擇日期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 sm-width">
                                        <div class="buy-ticket-select">
                                            <select name="time" id="time" class="form-control">
                                                <option value="0">選擇時間</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="buy-ticket-btn">
                                    <a style="cursor: pointer;font-size: 20px;" onclick="suBy()" class="btn btn-button">快速購票</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END START BUY TICKECT -->
        <!-- FOOTER SECTION -->
        <footer class="footer-section">
            <div class="footer-bg">
                <div class="container">
                    <div class="row">
                        <!-- Widget item -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 sm-width">
                            <div class="ft-widget">
                                <div class="newsletter"></div>
                            </div>
                        </div>
                        <!-- End Widget item -->
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 sm-width"></div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 sm-width">
                            <div class="copyright-text">
                                <p>CopyRight© 2018 <a>Themepul</a> . All Rights Reserved.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div class="to-top" id="back-top">
            <i class="fa fa-angle-up"></i>
        </div>
        <!-- END FOOTER SECTION -->
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>

        selectMovie();

        function selectMovie(){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/fastMovies.controller" />',true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    schedules = JSON.parse(xhr.responseText);
                    
                    var movieName = '';

                    var movieSelect = '<option style="font-size:18px" value="0">選擇電影</option>';
                    
                    versions = [];

                    for (let i = 0; i < schedules.length; i++){
                        if(versions.indexOf(schedules[i].movie.movieName) == -1){
                            versions.push(schedules[i].movie.movieName);
                            movieSelect += '<option style="font-size:18px">'+schedules[i].movie.movieName+'</option>';
                        }
                    }

                    
                    document.getElementById("movie").innerHTML = movieSelect;
                    dateItem();
                    timeItem();
                }
            }
        }

        function dateItem(){
            selectmv = document.getElementById("movie").value;
            
            var dateSelect = '<option style="font-size:18px" value="0">選擇日期</option>'

            dateArray = [];

            for(let i = 0 ; i < schedules.length ; i++){
                if(selectmv == schedules[i].movie.movieName){
                    var dates = new Date(schedules[i].date);
                    dateArray.push(dates)
                }
            }

            dateArray.sort(function(a, b) {return a - b});

            var sDates = []

            for (let i = 0; i < dateArray.length; i++){
                var theYear = dateArray[i].getFullYear();
                var theMonth = dateArray[i].getMonth() + 1;
                var theDate = dateArray[i].getDate();

                if(sDates.indexOf(theYear+'-'+theMonth+'-'+theDate) == -1){
                    sDates.push(theYear+'-'+theMonth+'-'+theDate);

                    dateSelect += '<option style="font-size:18px">'+theYear+'-'+(theMonth < 10 ? '0'+theMonth:theMonth)+'-'+(theDate < 10 ? '0'+theDate:theDate)+'</option>';
                }
            }
            
            document.getElementById("date").innerHTML = dateSelect;
        }

        function timeItem() {
            selectdt = document.getElementById("date").value;
            
            var timeSelect = '<option style="font-size:18px" value="0">選擇時間</option>'

            timeArray = [];

            for(let i = 0 ; i < schedules.length ; i++){
                if(selectmv == schedules[i].movie.movieName && selectdt == schedules[i].date){
                    var times = new Date(selectdt+'T'+schedules[i].time);
                    timeArray.push(times)
                }
            }

            timeArray.sort(function(a, b) {return a - b});

            var sTimes = []

            for (let i = 0; i < timeArray.length; i++){
                var vieTime = (timeArray[i].getHours() < 10?'0'+timeArray[i].getHours():timeArray[i].getHours())+':'+(timeArray[i].getMinutes() < 10 ? '0'+timeArray[i].getMinutes():timeArray[i].getMinutes())

                if(sTimes.indexOf(vieTime) == -1){
                    sTimes.push(vieTime);
                    timeSelect += '<option style="font-size:18px">'+vieTime+'</option>';
                }
            }
            
            document.getElementById("time").innerHTML = timeSelect;
        }

        function suBy(){

            selecttm = document.getElementById("time").value;
            if(typeof(selectmv) == 'undefined' || selectmv == 0){
                swal("請選擇電影", "", "error", {button: "確認"});
                return;
            }else if(typeof(selectdt) == 'undefined' || selectdt == 0){
                swal("請選擇日期", "", "error", {button: "確認"});
                return;
            }else if(typeof(selecttm) == 'undefined' || selecttm == 0){
                swal("請選擇時間", "", "error", {button: "確認"});
                return;
            }

            document.getElementById("fastBooking").submit();
        }
        </script>
</body>

</html>