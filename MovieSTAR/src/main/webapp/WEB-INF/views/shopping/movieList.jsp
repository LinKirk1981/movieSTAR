<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
<jsp:include page="../user/css.jsp"/>
</head>

<body>
    <div class="main page-template">
        <jsp:include page="../user/nvigationBar.jsp"/>
        <!-- START BREADCRUMB -->
        
        <div class="breadcrumbs">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a style="font-size: 20px;" href="<c:url value="/"/>"><span class="fa fa-home"></span> 首頁</a></li>
                    <li style="font-size: 30px;">電影時刻</li>
                </ul>
                <ul class="go-home">
                    <li><a style="font-size: 20px;" href="<c:url value="/"/>">返回</a></li>
                </ul>
            </div>
        </div>
        <!-- END BREADCRUMB -->
        <div class="inner-page">
            <!-- FULL WIDTH BANNER -->
            <div class="container">
                <div class="full-withbanner pt-75 pb-75">
                    <div class="banner-img zoom">
                        <img src="${pageContext.request.contextPath}/user/images/04.jpg" >
                        <div class="full-withcon">
                            <h2 class="fullwithhadidng"><span>當男人戀愛時</span></h2>
                            <p></p>
                            <a class="btn-button btn-no-bg" href="">電影詳情</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END FULL WIDTH BANNER -->
            <!-- PRODUCT LIST VIEW -->
            <div class="container">
                <!-- LEFT SIDE AREA -->
                <div class="row">
                    <aside class="col-lg-9 col-md-9 col-sm-6 col-xs-12">
                        <div class="product-filter">
                            <div class="product-filter-inner">
                                <!-- LIST VIEW OR GRID VIEW -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 sm-width">
                                    <div class="product-filter-list">
                                        <div class="nav" role="tablist">
                                            <ul>
                                                <li onclick=grid(1) class="active"> <a href="#grid" data-toggle="tab" role="tab" aria-selected="true" aria-controls="grid"><i class="fa fa-th"></i></a></li>
                                                <li onclick=row(1)> <a href="#list" data-toggle="tab" role="tab" aria-selected="false" aria-controls="list" ><i class="fa fa-th-list" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- END LIST VIEW OR GRID VIEW -->
                                <!-- SHORT BY -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  sm-width">
                                    <div class="product-filter-list">
                                        <div class="short-by-show form-inline2">
                                            <div class="row"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END SHORT BY -->
                            </div>
                        </div>
                        <!-- END PRODUCT FILTER -->
                        <div class="row">
                            <div class="products">
                                <div class="tab-pane fade active in" id="grid" role="tabpanel">
                                    <div class="products product-list" id="concentrated"></div>
                                </div>
                                <div class="tab-pane fade in" id="list" role="tabpanel">
                                    <div class="products product-list">
                                        <div class="list-page"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PRODUCT FILTER -->
                        <div class="product-filter">
                            <div class="product-filter-inner">
                                <!-- LIST VIEW OR GRID VIEW -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 sm-width">
                                </div>
                                <!-- END LIST VIEW OR GRID VIEW -->
                                <!-- PAGINATION -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 pro-pagination sm-width" style="width: 100%">
                                    <div class="product-filter-list">
                                        <div class="pagination-wrapper">
                                            <nav aria-label="navigations"  align="center" >
                                                <ul class="pagination"></ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                                <!-- END PAGINATION -->
                            </div>
                        </div>
                        <!-- END PRODUCT FILTER -->
                        <!-- END PRODUCT FILTER -->
                    </aside>
                    <aside class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="widget mb-50">
                            <div class="widget-title"><i class="fa fa-list"></i><span>即將上映</span></div>
                            <div class="widget-slide">
                            <c:forEach var="csmv" items="${csmv}">
                                <div class="item">
                                  
                                    <div class="single-item">
                                        <div class="img">
                                            <img src="<c:url value = '/getMoviePicture/${csmv.movieId}'/>" width="101px"  height="100px">
                                        </div>
                                        <div class="widget-slide-content">
                                        
                                            <a class="title" style="font-size: 20px ;font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${csmv.movieName}</a>
                                            <span></span>
                                            <a class="catagory" style="font-size: 14px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${csmv.movieType}</a>
                                        </div>
                                    </div>
                                    
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- END WIDGET -->
                    </aside>
                </div>
                <!-- END LEFT SIDE AREA -->
            </div>
            <!-- END PRODUCT LIST VIEW -->
        </div>
         <jsp:include page="../user/footer.jsp"/>     
       </div>
    <script>
        grid(1);
        
        //印出網格視窗
		function grid(indexPage){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/moviesPage.controller/"/>'+indexPage,true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    var grMovies = JSON.parse(xhr.responseText);
                    var gridItem = '';
                    
                    var tmp = "<c:url value='/buyMovieTicket/' />";	
	                var tmp2 = "<c:url value='/movieDetail/'/>";
	                
                    for(let i = 0 ; i < grMovies.length ; i++){
                        gridItem += '<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12"><div class="movie-item-contents gradient">'
                                    +'<img style="width: 363px; height: 375px;" src="data:image/png;base64,'+grMovies[i].movieImage+'" alt="">'
                                    +'<div class="movie-item-content"><div class="movie-item-content-top"><div class="pull-left">'
                                    +'<span class="movie-count-time hover-left">'+grMovies[i].movieDate.substr(5)+'</span>'
                                    +'</div><div class="pull-right"><div class="movie-ratting"><a href="">'
                                    +'</div></div></div><div class="movie-item-content-center">'
                                    +'<a class="flat-icons" href="" data-video-url="'+grMovies[i].movieTrailer+'"><span class="flaticon-play-button"></span></a>'
                                    +'</div><div class="movie-item-content-buttom"><div class="movie-item-title">'
                                    +'<a href="">'+grMovies[i].movieName+'</a>'
                                    +'</div><div class="item-cat">'
                                    +'<ul><li><span>片長 :</span><a href="">'+grMovies[i].movieDuration+'</a></li>'
                                    +'</ul><div class="item-cat-hover"><ul>'
                                    +'<li><span>類型 :</span></li><li><a href="">'+grMovies[i].movieType+'</a></li>'
                                    +'</ul></div></div><div class="movie-item-beta"><div class="movie-details">'
                                    +'<a class="btn btn-button button-detals black-bg" href="'+tmp+grMovies[i].movieId+'">線上購票</a>'
                                    +'</div><div class="view-movie hover-right">'
                                    +'<a class="black-bg" href="'+tmp2+grMovies[i].movieId+'">電影介紹</a></div></div></div></div></div></div>'
                    }
                    document.querySelector("#concentrated").innerHTML= gridItem;
                    pages(indexPage);
                    dynamicallyLoadScript();
                }
            }
        }

        //印出頁數(網格)
        function pages(indexPage){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/moviePagesCount.controller" />',true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    pageCount = JSON.parse(xhr.responseText);
                    var pages = '';
                    pages = '<li class="page-item"><a class="page-link pagefirst" onclick=previousPage('+indexPage+')  style="cursor: pointer"><i class="fa fa-angle-left"></i></a></li>';
                    for(let i = 0; i < pageCount; i++){
                        pages += '<li class="page-item" ><a class="page-link" id='+(i+1)+' style="cursor: pointer" onclick=change('+(i+1)+')>'+(i+1)+'</a></li>'
                    }
                    pages +='<li class="page-item"><a class="page-link lastpage" onclick=nextPage('+indexPage+') style="cursor: pointer"><i class="fa fa-angle-right"></i></a></li>';
					
                    document.querySelector(".pagination").innerHTML =  pages;
                    document.getElementById(indexPage).style="";
                    document.getElementById(indexPage).parentNode.setAttribute("class","page-item active");
                }
            }
        }
        //換頁(數字鈕[網格])
        function change(pageIndex){
            grid(pageIndex);
        }
        //換頁(上一頁[網格])
        function previousPage(indexPage){
            if(indexPage>1){
                change(indexPage-1)
            }
        }
        //換頁(下一頁[網格])
        function nextPage(indexPage){
            if(indexPage<pageCount){
                change(indexPage+1)
            }
        }

        //印出橫列視窗
		function row(indexPage){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/moviePagesCountRow.controller/"/>'+indexPage,true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    var rwMovies = JSON.parse(xhr.responseText);
                    var rwidItem = '';
                    
                    var tmp = "<c:url value='/buyMovieTicket/' />";	
	                var tmp2 = "<c:url value='/movieDetail/'/>";
	                
                    for(let i = 0 ; i < rwMovies.length ; i++){
                        rwidItem += '<div class="list-items"><div class="col-lg-5 col-md-5 col-sm-6 col-xs-12"><div class="movie-item-contents gradient">'
                                    +'<img style="width:370px" src="data:image/png;base64,'+rwMovies[i].movieImage+'" alt=""><div class="movie-item-content"><div class="movie-item-content-center">'
                                    +'<a class="flat-icons" href="" data-video-url="'+rwMovies[i].movieTrailer+'" style="cursor: pointer;"><span class="flaticon-play-button"></span></a>'
                                    +'</div></div></div></div><div class="col-lg-7 col-md-7 col-sm-6 col-xs-12"><div class="dec-review-dec"><div class="details-title">'
                                    + '<h2 style="font-size:40px"><a href="'+tmp2+rwMovies[i].movieId+'">'+rwMovies[i].movieName+'</a></h2>'
                                    +'</div>'
                                    +'<div class="ratting">'
                                    +'</div><div class="dec-review-meta"><ul>'
                                    +'<li><br><img style="width: 70px;" alt="" src="user/images/GSRR_'+rwMovies[i].movieRating+'_logo.svg"/></li>'
                                    +'<li style="font-size:20px"><br><span>上映時間 <label></label></span><a href="">'+rwMovies[i].movieDate+'</a></li>'
                                    +'<li style="font-size:20px"><span style="font-weight:bold;">類型 <label>:</label></span><a href="">'+rwMovies[i].movieType+'</a></li>'
                                    +'<li style="font-size:20px"><span style="font-weight:bold;">片長 <label>:</label></span><a href="">'+rwMovies[i].movieDuration+'</a></li>'
                                    +'</ul></div>'
                                    +'<div class="social-links">'
                                    +'</div><div class="tag-category tag-1"><ul>'
                                    +'<li><a href="'+tmp+rwMovies[i].movieId+'">線上訂票</a></li>'
                                    +'</ul></div></div></div></div>'
                    }
                    document.querySelector(".list-page").innerHTML= rwidItem;
                    pagesRow(indexPage);
                    dynamicallyLoadScript();
                }
            }
        }

        //印出頁數(橫列)
        function pagesRow(indexPage){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/moviePagesCountRow.controller" />',true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    pageCountRow = JSON.parse(xhr.responseText);
                    var pagesRow = '';
                    pagesRow = '<li class="page-item"><a class="page-link pagefirst" onclick=previousPageRow('+indexPage+')  style="cursor: pointer"><i class="fa fa-angle-left"></i></a></li>';
                    for(let i = 0; i < pageCountRow; i++){
                        pagesRow += '<li class="page-item" ><a class="page-link" id=row'+(i+1)+' style="cursor: pointer" onclick=changeRow('+(i+1)+')>'+(i+1)+'</a></li>'
                    }
                    pagesRow +='<li class="page-item"><a class="page-link lastpage" onclick=nextPageRow('+indexPage+') style="cursor: pointer"><i class="fa fa-angle-right"></i></a></li>';
					
                    document.querySelector(".pagination").innerHTML =  pagesRow;
                    document.getElementById("row"+indexPage).style="";
                    document.getElementById("row"+indexPage).parentNode.setAttribute("class","page-item active");
                }
            }
        }
        //換頁(數字鈕[橫列])
        function changeRow(pageIndex){
        	row(pageIndex);
        }
        //換頁(上一頁[橫列])
        function previousPageRow(indexPage){
            if(indexPage>1){
            	changeRow(indexPage-1)
            }
        }
        //換頁(下一頁[橫列])
        function nextPageRow(indexPage){
            if(indexPage<pageCountRow){
            	changeRow(indexPage+1)
            }
        }

// 		再次掛載js檔
        function dynamicallyLoadScript() {
            var script = document.createElement("script");
            script.src = "${pageContext.request.contextPath}/user/js/main.js";
            document.head.appendChild(script);
        }
    </script>
</body>

</html>