<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <li><a href="#"><span class="fa fa-home"></span> 首頁</a></li>
                    <li><a href="">會員中心</a></li>
                    <li>票夾</li>
                </ul>
                <ul class="go-home">
                    <li><a href="">返回</a></li>
                </ul>
            </div>
        </div>
        <!-- END BREADCRUMB -->
        <div class="inner-page">
            <!-- PRODUCT LIST VIEW -->
            <div class="container">
            	<div class="comment-area" style="margin-bottom: 0;">
                    <div class="row">
                        <div class="col-lg-offset-1 col-md-offset-1 col-lg-11 col-md-11 col-sm-12 col-xs-12" style="margin-left: 0;width: 100%;">
                            <h2 class="title" style="font-size: 45px;">票夾</h2>    
                            <div class="left-side" style="width: 100%;" id="outer"></div>
                        </div>
                    </div>
                </div>
                <div class="product-filter">
                    <div class="product-filter-inner">
                        <!-- PAGINATION -->
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 pro-pagination sm-width" style="width: 100%">
                            <div class="product-filter-list">
                                <div class="pagination-wrapper">
                                    <nav aria-label="navigations" align="center" >
                                        <ul class="pagination"></ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!-- END PAGINATION -->
                    </div>
                </div>
                <!-- END PRODUCT FILTER -->
            </div>
            <!-- END PRODUCT LIST VIEW -->
        </div>
        <jsp:include page="../user/footer.jsp"/>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        order(1);

        //查出該帳號的交易紀錄並印出
        function order(indexPage){
            var xhr = new XMLHttpRequest();
            xhr.open('get','<c:url value="/orders.controller/"/>'+indexPage,true);
            xhr.send()
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    orders = JSON.parse(xhr.responseText);
                    var orderView = ''
                    
                    for(let i = 0; i < orders.length; i++){
                        orderView += '<div class="call-cation1 call-action-bg margin-30" style="margin: 3px 0;">'
                                   + '<div class="left-side" style="width: 100%;">'
                                   + '<div class="action-content" style="width: 100%;">'
                                   + '<h2>交易序號 : '+orders[i].transactionNumber+'</h2>'
                                   + '<div class="header-search">'
                                   + '<table style="font-size: 20px;width: 100%;">'
                                   + '<tr><th style="width: 300px;"><p>電影 : '+orders[i].schedules.movie.movieName+'</p></th>'
                                   + '<th style="width: 300px;"><p> 排程 : '+orders[i].schedules.date+'　　'+orders[i].schedules.time+'</p></th>';
                                   if(orders[i].orderStatus == 1 && (orders[i].apply == null || orders[i].apply == 3)){
                                        orderView += '<th style="width: 300px;"><p>狀態 :<span style="color: red;"> 未領票</span></p></th></tr>';
                                   }else if(orders[i].orderStatus == 2 && (orders[i].apply == null || orders[i].apply == 3)){
                                        orderView += '<th style="width: 300px;"><p>狀態 :<span style="color: lawngreen;"> 已領票</span></p></th></tr>';
                                   }else if(orders[i].orderStatus == 1 && orders[i].apply == 1){
                                        orderView += '<th style="width: 300px;"><p>狀態 :<span style="color: yellow;"> 退票申請</span></p></th></tr>';
                                   }else if(orders[i].orderStatus == 2 && orders[i].apply == 2){
                                        orderView += '<th style="width: 300px;"><p>狀態 :<span style="color: LightGray;"> 已退款</span></p></th></tr>';
                                   }
                        orderView += '</table>'
                                   + '<button onclick=orderItem('+i+')><span class="fa fa-search"></span></button>'
                                   + '</div>'
                                   + '</div>'
                                   + '<div style="width: 100%;" align="center" id="orderItemView'+i+'"></div>'
                                   + '</div>'
                                   + '</div>'; 
                    }

                    document.getElementById("outer").innerHTML=orderView
                    pages(indexPage)
                }
            }
        }

        function orderItem(index){

            if(document.getElementById("orderItemView"+index).innerHTML != ''){
                document.getElementById("orderItemView"+index).innerHTML ='';
                return;
            }

            oneorder = orders[index];
            var orderItemContainer = '';
            var ticket = '';
            var foods = '';
            var numbers = '';
            var blockades = 0;

            for(let i = 0; i < oneorder.schedules.hall.seats.length; i++){
                if(oneorder.schedules.hall.seats[i].status == 1){
                    blockades += 1;
                }
            }

            var statId = (oneorder.schedules.hall.total+blockades)/oneorder.schedules.hall.row;

            for(let i = 0; i < oneorder.ticketQuantities.length ; i++){
                ticket += oneorder.ticketQuantities[i].ticketSpecies+' x '+oneorder.ticketQuantities[i].ticketQuantity+'<br>';
            }
            for(let i = 0; i < oneorder.orderFoods.length; i++){
                foods += oneorder.orderFoods[i].food.foodname+' x '+oneorder.orderFoods[i].foodQuantity+'<br>';
            }
            for(let i = 0 ; i < oneorder.seatNumbers.length ; i++){
                numbers += String.fromCharCode(65 + Math.floor(oneorder.seatNumbers[i].seatNumber/statId))+((oneorder.seatNumbers[i].seatNumber+1)%statId==0?statId:(oneorder.seatNumbers[i].seatNumber+1)%statId)+'　';
            }
            if(oneorder.orderStatus == 2 && oneorder.apply == 2){
                orderItemContainer += '<table class="table" style="font-size: 20px;color: snow;width: 90%;text-decoration: line-through;font-style: oblique;">';
            }else{
                orderItemContainer += '<table class="table" style="font-size: 20px;color: snow;width: 90%;">';
            }
            orderItemContainer += '<tr>'
                                + '<th style="vertical-align: middle;text-align: center;">票券 : </th>'
                                + '<td>'+ticket+'</td>'
                                + '</tr>'
                                + '<tr>'
                                if(foods != ''){
                                    orderItemContainer += '<th style="vertical-align: middle;text-align: center;">餐點 : </th>'
                                                        + '<td>'+foods+'</td>'
                                                        + '</tr>';

                                }
            orderItemContainer += '<tr>'
                                + '<th style="vertical-align: middle;text-align: center;">座位 : </th>'
                                + '<td>'+numbers+'</td>'
                                + '</tr>'
                                + '<tr>'
                                + '<th style="vertical-align: middle;text-align: center;">總價 : </th>'
                                + '<td>$ '+oneorder.ticketMoney+'</td>'
                                + '</tr>'
                                + '<th style="vertical-align: middle;text-align: center;">購票日期 : </th>'
                                + '<td>'+oneorder.buyDate.slice(0,10)+'</td>'
                                + '</tr>'
                                + '<tr>'
                                + '<th style="vertical-align: middle;text-align: center;">取票方式 : </th>';
                                if(oneorder.receive == 1){
                                    orderItemContainer += '<td>現場取票</td>';
                                }else{
                                    orderItemContainer += '<td>超商取票</td>';
                                }
            orderItemContainer += '</tr>'
                                + '<tr>'
                                + '<th></th>'
                                + '<td style="text-align: right;">'
                                + '<div class="tag-category tag-1">';
                                if(oneorder.orderStatus == 1 && oneorder.apply == null){
                                    orderItemContainer += '<ul>'
                                                            + '<li><a style="background-color: crimson;cursor: pointer;" onclick=refund('+oneorder.ticketId+')>退票</a></li>'
                                                            + '</ul>';
                                    
                                }
            orderItemContainer += '</div>'
                                + '</td>'
                                + '</tr>'
                                + '</table>';
                                if(oneorder.orderStatus == 2 && oneorder.apply == 2){
                                    orderItemContainer += '<p style="font-size: 25px;color: lawngreen;">您的退票申請已通過，請至您的帳戶確認款項，謝謝您的光臨。</p>';
                                }else if(oneorder.orderStatus == 1 && oneorder.apply == 3){
                                    orderItemContainer += '<p style="font-size: 25px;color: red;">您的退票申請未通過，由於不符合本影城規範因此退回申請。</p>';
                                }
            
            document.getElementById("orderItemView"+index).innerHTML = orderItemContainer;
            dynamicallyLoadScript();
        }

        //印出頁數
        function pages(indexPage){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/orderPage.controller" />',true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    pageCount = JSON.parse(xhr.responseText);
                    var pages = '';
                    pages = '<li class="page-item"><a class="page-link pagefirst" onclick=previousPage('+indexPage+')  style="cursor: pointer"><i class="fa fa-angle-left"></i></a></li>';
                    for(let i = 0; i < pageCount; i++){
                        pages += '<li class="page-item" ><a class="page-link" id=order'+(i+1)+' style="cursor: pointer" onclick=change('+(i+1)+')>'+(i+1)+'</a></li>'
                    }
                    pages +='<li class="page-item"><a class="page-link lastpage" onclick=nextPage('+indexPage+') style="cursor: pointer"><i class="fa fa-angle-right"></i></a></li>';
					
                    document.querySelector(".pagination").innerHTML =  pages;
                    if(document.getElementById("order"+indexPage)!=null){
                        document.getElementById("order"+indexPage).style="";
                        document.getElementById("order"+indexPage).parentNode.setAttribute("class","page-item active");
                    }
                }
            }
        }
        //換頁(數字鈕[橫列])
        function change(pageIndex){
        	order(pageIndex);
        }
        //換頁(上一頁[橫列])
        function previousPage(indexPage){
            if(indexPage>1){
            	change(indexPage-1)
            }
        }
        //換頁(下一頁[橫列])
        function nextPage(indexPage){
            if(indexPage<pageCount){
            	change(indexPage+1)
            }
        }
        function refund(id){

            swal({
					title : "確定要退票?",
					text : "退票後1-2個工作天內會回復客戶",
					icon : "warning",
					buttons : true,
					dangerMode : true
				}).then(function(select) {
					if (select) {
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET','<c:url value="/refund.controller/" />'+id,true);
                        xhr.send();
                        xhr.onreadystatechange = function(){
                            if(xhr.readyState == 4 && xhr.status == 200){
                                orders = JSON.parse(xhr.responseText);
                            }
                        }
                        window.location.reload()
					}
				})
        }
		//再次掛載js檔
        function dynamicallyLoadScript() {
            var script = document.createElement("script");
            script.src = "${pageContext.request.contextPath}/user/js/main.js";
            document.head.appendChild(script);
        }
    </script>
</body>

</html>