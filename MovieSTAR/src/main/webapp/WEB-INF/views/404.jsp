<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <jsp:include page="user/css.jsp" />
</head>

<body>
    <div class="main page-template">
        <jsp:include page="user/nvigationBar.jsp" />
        <div class="inner-page">
            <div class="error-page">
                <div class="error-bg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-offset-4 col-md-offset-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="error-content text-center">
                                    <h2><span>404</span></h2>
                                    <ul>
                                        <li><span>MovieSTAR 即將提供您全新的網站體驗! 敬請期待</span></li>
                                    </ul>
                                    <p>MovieSTAR工程師團隊日以繼夜的思考如何帶給網站使用者不一樣的電影資訊讓看電影更愉快. MovieSTAR特派員在世界各地的追星貓時時刻刻都在追尋第一手的消息提供給愛看電影的您!</p>
                                    <div class="buttons">
                                        <a href="<c:url value="/"/>" class="btn btn-button green-bg button-1">回首頁</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- FOOTER SECTION -->
        <jsp:include page="user/footer.jsp" />
    </div>
    <!-- END FOOTER SECTION -->
    
</body>

</html>