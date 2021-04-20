<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/css.jsp"/>
</head>
<jsp:include page="../user/nvigationBar.jsp"></jsp:include>
<jsp:include page="head.jsp"></jsp:include>
<body>

            <!-- END FULL WIDTH BANNER -->
            <!-- PRODUCT LIST VIEW -->
            <div class="container">
                <div class="product-filter">
                            <div class="product-filter-inner">
                                <!-- LIST VIEW OR GRID VIEW -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 sm-width">
                                    <div class="product-filter-list">
<!--                                         <div class="nav" role="tablist"> -->
<!--                                             <ul> -->
<!--                                                 <li class="active"> <a href="#list" data-toggle="tab" role="tab" aria-selected="false" aria-controls="list" class=""><i class="fa fa-th-list" aria-hidden="true"></i></a></li> -->
<!--                                                 <li> <a href="#grid" data-toggle="tab" role="tab" aria-selected="true" aria-controls="grid"><i class="fa fa-th"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
                                    </div>
                                </div>
                                <!-- END LIST VIEW OR GRID VIEW -->
                                <!-- SHORT BY -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  sm-width">
                                    <div class="product-filter-list">
                                        <div class="short-by-show form-inline2">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                    <div class="short-by">
<!--                                                         <select class="selectpicker"> -->
<!--                                                             <option value="" selected="selected">Sort By:</option> -->
<!--                                                             <option value="">Name (A - Z)</option> -->
<!--                                                             <option value="">Name (Z - A)</option> -->
<!--                                                             <option value="">Price (Low &gt; High)</option> -->
<!--                                                             <option value="">Price (High &gt; Low)</option> -->
<!--                                                             <option value="">Rating (Highest)</option> -->
<!--                                                             <option value="">Rating (Lowest)</option> -->
<!--                                                             <option value="">Model (A - Z)</option> -->
<!--                                                             <option value="">Model (Z - A)</option> -->
<!--                                                         </select> -->
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
<!--                                                     <div class="pro-show"> -->
<!--                                                         <select class="selectpicker"> -->
<!--                                                             <option value="" selected="selected">Show:</option> -->
<!--                                                             <option value="">25</option> -->
<!--                                                             <option value="">50</option> -->
<!--                                                             <option value="">75</option> -->
<!--                                                             <option value="">100</option> -->
<!--                                                         </select> -->
<!--                                                     </div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END SHORT BY -->
                                <!-- PAGINATION -->
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 pro-pagination sm-width">
                                    <div class="product-filter-list">
                                        <div class="pagination-wrapper">
                                            <nav aria-label="navigations">
<!--                                                 <ul class="pagination"> -->
<!--                                                     <li class="page-item"><a class="page-link pagefirst" href="#"><i class="fa fa-angle-left"></i></a></li> -->
<!--                                                     <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                                                     <li class="page-item active"><a class="page-link" href="#">2</a></li> -->
<!--                                                     <li class="page-item active"><a class="page-link" href="#">3</a></li> -->
<!--                                                     <li class="page-item"><a class="page-link lastpage" href="#"><i class="fa fa-angle-right"></i></a></li> -->
<!--                                                 </ul> -->
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                                <!-- END PAGINATION -->
                            </div>
                        </div>
                        <!-- END PRODUCT FILTER -->
                <div class="products">
                    <div class="row">
                        <!-- List View -->
                        <div class="tab-pane fade active in" id="list" role="tabpanel">
                            <div class="products product-list">
                                <div class="list-page">
                                <c:forEach var="movie" items="${movie}">
                                    <div class="list-items">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        
                                            <div class="movie-item-contents gradient">
                                                <img src="<c:url value = '/getMoviePicture/${movie.movieId}' />">
                                                <div class="movie-item-content">
                                                    <div class="movie-item-content-center">
                                                        <a href="" class="flat-icons" data-video-url="${movie.movieTrailer}" style="cursor: pointer;"><span class="flaticon-play-button"></span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                                            <div class="dec-review-dec">
                                                <div class="details-title">
                                                    <h2><a href="<c:url value='/movieDetail/${movie.movieId}'/>">${movie.movieName}</a></h2>
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
                                                            <li><img style="width: 60px;" alt="" src="user/images/GSRR_${movie.movieRating}_logo.svg"/></li>
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
                                                <div class="peoduct-dec">
                                                    <p>
                                                       ${movie.movieDetail}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                           <footer class="footer-section">
            <div class="footer-bg">
                <div class="container">
                    <div class="row">
                        <!-- Widget item -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 sm-width">
                            <div class="ft-widget">
                                <div class="ft-content">
                                    <img src="images/ft-about.jpg" alt="">
                                    <p>Mauris malesuada arcu eu posuere eleifen. Ut egestas tortor at leo egestas tincidunt. Nam tincidunt metus tristique tristique viverra. Mauris erat ante, egestas vitae dapibus sed.</p>
                                    <div class="social-link">
                                        <ul>
                                            <li><a href="" class="ft-fb"><span class="fa fa-facebook"></span></a></li>
                                            <li><a href="" class="ft-twitter"><span class="fa fa-twitter"></span></a></li>
                                            <li><a href="" class="ft-pintarest"><span class="fa fa-pinterest"></span></a></li>
                                            <li><a href="" class="ft-youtube"><span class="fa fa-youtube"></span></a></li>
                                            <li><a href="" class="ft-linkedin"><span class="fa fa-linkedin"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Widget item -->
                        <!-- Widget item -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 sm-width">
                            <div class="ft-widget">
                                <h2><span>Movie Category</span></h2>
                                <div class="ft-content">
                                    <ul>
                                        <li><a href="">Movies</a> </li>
                                        <li><a href="">Videos</a></li>
                                        <li><a href="">English</a></li>
                                        <li><a href="">China</a></li>
                                        <li><a href="">Tailor Upcoming Movies</a></li>
                                        <li><a href="">Upcoming Movies</a></li>
                                        <li><a href="">Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Widget item -->
                        <!-- Widget item -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 sm-width">
                            <div class="ft-widget">
                                <h2><span>Information</span></h2>
                                <div class="ft-content">
                                    <ul>
                                        <li><a href="">About Us</a> </li>
                                        <li><a href="">Song</a></li>
                                        <li><a href="">Forums</a></li>
                                        <li><a href="">Hot Collection</a></li>
                                        <li><a href="">Upcoming Movies</a></li>
                                        <li><a href="">Upcoming Events</a></li>
                                        <li><a href="">All Movies</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Widget item -->
                        <!-- Widget item -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 sm-width">
                            <div class="ft-widget">
                                <div class="ft-content twitter-contnt">
                                    <h2><span>Twitter</span></h2>
                                    <div class="ft-twitter-feed">
                                        <div class="ft-twitter-icon">
                                            <span class="fa fa-twitter"></span>
                                        </div>
                                        <div class="twitter-dec">
                                            <a href="">black-one <span class="green">@24Webpro</span></a>
                                            <p>Lorem Ipsum is simply dumy text of the printing.</p>
                                            <div class="twitter-meta">
                                                <ul>
                                                    <li><a href=""><span class="fa fa-mail-reply"></span></a></li>
                                                    <li><a href=""><span class="fa fa-retweet"></span>12</a></li>
                                                    <li><a href=""><span class="fa fa-heart"></span>21</a></li>
                                                    <li><a href=""><span class="fa fa-ellipsis-h"></span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="newsletter">
                                    <h2><span>newsletter</span></h2>
                                    <div class="newsletter-input">
                                        <input type="text" class="form-control" placeholder="Email Address">
                                        <button class="newsletter-btn"><span class="fa fa-paper-plane"></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Widget item -->
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 sm-width">
                            <div class="footer-menu">
                                <ul>
                                    <li><a href="">About Us</a></li>
                                    <li><a href="">Celebrities</a></li>
                                    <li><a href="">News</a></li>
                                    <li><a href="">Contacts</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 sm-width">
                            <div class="copyright-text">
                                <p>CopyRight© 2018 <a href="">Themepul</a> . All Rights Reserved.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- END FOOTER SECTION -->
    </div>
</body>

</html>