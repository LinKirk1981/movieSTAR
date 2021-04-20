<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="../user/css.jsp"></jsp:include>
    <style>
    .sweetAlert {
        width: 800px;
    }
    </style>
</head>

<body>

    <div class="main page-template">
        <jsp:include page="../user/nvigationBar.jsp" />
        <!-- START BREADCRUMB -->
        <div class="breadcrumbs">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a style="font-size: 20px;" href="<c:url value="/" />"><span class="fa fa-home"></span> 首頁</a></li>
                    <li><a style="font-size: 20px;" href="<c:url value="/movieList.controller" />">電影時刻</a></li>
                    <li style="font-size: 30px;">線上訂票</li>
                </ul>
                <ul class="go-home">
                    <li><a style="font-size: 20px;" href="<c:url value="/movieList.controller" />">返回</a></li>
                </ul>
            </div>
        </div>
        
        <!-- END BREADCRUMB -->
        <div class="inner-page">
            <!-- PRODUCT LIST VIEW -->
            <div class="container">
                <div class="details-page">
                    <div class="details-contents">
                        <div class="details-content">
                            <!-- REVIEW WITH IMAGE -->
                            <div class="celebritie-single pt-75 tb-75">
                                <div class="row">
                                    <div id="movieItem" class="col-lg-4 col-md-4 col-sm-6 col-xs-12"></div>
                                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12"></div>
                                    <form method="POST" action='<c:url value="/addOrderTicket.controller" />' id="orderTicketSub">
                                        <input type="hidden" name="orderTicket" value="" id="orderTicket">
                                        <input type="hidden" name="id" value="" id="id">
                                    </form>
                                </div>
                            </div>
                            <!-- END REVIEW WITH IMAGE -->
                        </div>
                    </div>
                    <!-- CATEGORY MOVIE -->
                    <section class="category-movie pt-75 pb-75" />
                    <!-- END CATEGORY MOVIE -->
                </div>
            </div>
            <!-- END PRODUCT LIST VIEW -->
        </div>
        <jsp:include page="../user/footer.jsp"></jsp:include>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        
        movieItem();

        //印出電影資訊
        function movieItem() {
            
            swal({
                title:'購票須知',
                text: "1.每筆訂票張數以 10 張為限。\n"+
                    　"2.請注意此交易金額將於購票步驟完成後，即刻於您的信用卡帳戶或儲值金帳戶中進行扣款。\n"+
                      "3.完成付款後，請憑「訂票序號」至購票影城進行取票。\n"+
                      "4.購票完成亦可至超商進行取票，但若交易內含餐飲品項，須至購票影城臨櫃領取電影票與餐點。",
                className:"sweetAlert",
            });

            var xhr = new XMLHttpRequest();
            xhr.open('GET', '<c:url value="/movieItem.controller/"/>', true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    movie = JSON.parse(xhr.responseText);
                    var movieItem = '<div class="dec-review-img">' +
                        '<img src="data:image/png;base64,' + movie.movieImage + '" alt="" />'+
                        '</div><div class="celerite-info" style="font-size: 20px"><ul><li>' +
                        '<label>電影名稱：</label><span>' + movie.movieName + '</span>' +
                        '</li><li>' +
                        '<label>上映日期：</label><span>' + movie.movieDate + '</span>' +
                        '</li><li>' +
                        '<label>電影類別：</label><span>' + movie.movieType + '</span>' +
                        '</li><li>' +
                        '<label>電影片長：</label><span>' + movie.movieDuration + '</span>' +
                        '</li><li>' +
                        '<label>電影級數：</label><span><img style="width: 60px;" alt="" src="${pageContext.request.contextPath}/user/images/GSRR_' + movie.movieRating + '_logo.svg"/></span>' +
                        '</li></ul></div><div class="social-links">' +
                        '<strong style="font-size: 18px">分享：</strong>' +
                        '<a style="font-size: 18px" href="" class="socila-fb"><span class="fa fa-facebook"></span></a>' +
                        '<a style="font-size: 18px" href="" class="socila-tw"><span class="fa fa-twitter"></span></a>' +
                        '<a style="font-size: 18px" href="" class="socila-sk"><span class="fa fa-skype"></span></a>' +
                        '<a style="font-size: 18px" href="" class="socila-pin"><span class="fa fa-pinterest"></span></a>' +
                        '<a style="font-size: 18px" href="" class="socila-ins"><span class="fa fa-instagram"></span></a>' +
                        '</div>';
                    document.querySelector('#movieItem').innerHTML = movieItem;
                    version();
                }
            }
        }

        //印出電影版本
        function version() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '<c:url value="/movieSchedules.controller"/>', true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    schedules = JSON.parse(xhr.responseText);
              
                    var versions = [];
                    var map = new Map();
                    
                    for (let i = 0; i < schedules.length; i++){
                        if(versions.indexOf(schedules[i].ticketPrice.ticketVersion) == -1){
                            versions.push(schedules[i].ticketPrice.ticketVersion);
                            map.set(schedules[i].ticketPrice.ticketId,schedules[i].ticketPrice.ticketVersion);
                        }
                    }
                    
                    var aryVersion = Array.from(map);
                    aryVersion.sort(function(a,b){return a[0]-b[0]})
                    
                    var version = '<div class="hadding-area">'+
                        '<h1>線上訂票</h1>'+
                        '<ul class="breadcrumb">'+
                        '<li style="font-size: 25px">選擇版本與場次</li>'+
                        '<li><a>選擇票種與數量</a></li>'+
                        '<li><a>選擇座位</a></li>'+
                        '<li><a>餐點選購</a></li>'+
                        '<li><a>結帳</a></li>'+
                        '</ul></div>'+
                        '<div class="cat-menu"><ul class="nav nav-tabs tab-menu">';
                    for (let i = 0; i < aryVersion.length; i++) {
                        version += '<li><a data-toggle="tab" href="" onclick=planning('+aryVersion[i][0]+')><span style="font-size: 23px;font-weight: bold">' + aryVersion[i][1] + '</span></a></li>';
                    }
                    version += '</ul></div><div class="tag-category tag-2"></div>';
                    document.querySelector('.col-lg-8').innerHTML = version;
                        
                    planning(aryVersion[0][0]);
                }
            }
        }

        //印出排程
        function planning(ticketId) {
            
            var scheduleItem = '';
            var dateTime = [];

            for(let i=0; i < schedules.length; i++){
                if(schedules[i].ticketPrice.ticketId == ticketId){
                    var realDateTime = new Date(schedules[i].date+'T'+schedules[i].time);
                    dateTime.push(realDateTime);
                }
            }

            dateTime.sort(function(a, b) {return a - b});
            var datas = [];
            for(let i = 0 ; i < dateTime.length ; i++){
                var theYear = dateTime[i].getFullYear();
                var theMonth = dateTime[i].getMonth() + 1;
                var theDate = dateTime[i].getDate();
                var theDay = dateTime[i].getDay();
                var weekDay ;

                switch(theDay){
                    case 0:weekDay="日";break;
                    case 1:weekDay="一";break;
                    case 2:weekDay="二";break;
                    case 3:weekDay="三";break;
                    case 4:weekDay="四";break;
                    case 5:weekDay="五";break;
                    case 6:weekDay="六";break;           
                }

                var dateTimeFormat = theYear+'年'+theMonth+'月'+theDate+'日　星期'+weekDay;

                if(datas.indexOf(dateTimeFormat) == -1){
                    scheduleItem += '<h3 style="font-weight: bold;font-size: 20px" class="sortcode-title">'+dateTimeFormat+'</h3><ul>';
                    for(let j = 0; j < dateTime.length ; j++){
                        var rTD = new Date(dateTime[j]);
                        if(rTD.getFullYear()==theYear&&(rTD.getMonth()+1)==theMonth&&rTD.getDate()==theDate){
                            scheduleItem += '<li><a style="cursor: pointer;font-size: 17px;font-weight: bold"  onclick=ticket('+rTD.getTime()+')>'+(rTD.getHours() < 10?'0'+rTD.getHours():rTD.getHours())+':'+(rTD.getMinutes() < 10?'0'+rTD.getMinutes():rTD.getMinutes())+ '</a></li>';
                        }
                    }
                    scheduleItem += '</ul>';
                    datas.push(dateTimeFormat);
                }

            }

            document.querySelector(".tag-category").innerHTML = scheduleItem;    
        }

        function ticket(dateTime) {

            scheduleIndex = 0;
            for(let i = 0; i < schedules.length; i++){
                var dt = new Date(schedules[i].date+'T'+schedules[i].time);
                if(dateTime == dt.getTime()){
                    scheduleIndex = i;
                }
            }
            selectTime = new Date(dateTime);
            schedule = schedules[scheduleIndex];
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/orderSeat.controller/"/>'+schedule.schedule_id,true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    orderSeat = JSON.parse(xhr.responseText);
                }
            }
            
            //上方購票進度條
            var bPicture = '<div class="hadding-area">' +
                '<h1 >線上訂票</h1>' +
                '<ul class="breadcrumb">' +
                '<li><a>選擇版本與場次</a></li>' +
                '<li style="font-size: 25px">選擇票種與數量</li>' +
                '<li><a>選擇座位</a></li>' +
                '<li><a>餐點選購</a></li>'+
                '<li><a>結帳</a></li>' +
                '</ul></div>' +
                //訂票內容
                '<div class="alert alert-warning" role="alert">' +
                '<i  style="width: 25px; font-size: 20px" class="fa fa-list-alt" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">訂票內容</strong>' +
                '</div>' +
                '<table style="text-align: center;font-size: 20px; font-weight: bold; color:white; width: 100%"><tr>' +
                '<td><i style="width: 32px;" class="fa fa-university" aria-hidden="true"></i>影廳 :</td>' +
                '<td>' + schedule.hall.hallName + '</td>' +
                '<td><i style="width: 30px;"  class="fa fa-calendar" aria-hidden="true"></i>場次日期 :</td>' +
                '<td>' + schedule.date + '</td>' +
                '<td><i style="width: 30px;" class="fa fa-clock-o" aria-hidden="true"></i></i>場次時間 :</td>' +
                '<td>' + schedule.time + '</td>' +
                '</tr></table>' +
                '<br>' +
                //選擇票種
                '<div class="alert alert-warning" role="alert">' +
                '<i  style="width: 25px; font-size: 20px" class="fa fa-ticket" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">選擇票種</strong>' +
                '</div>' +
                '<div class="faq-items">' +
                '<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">' +
                '<div class="panel panel-default">' +
                '<div class="panel-heading active" role="tab" id="headingOne">' +
                '<h4 class="panel-title">' +
                '<a role="button" style="font-size: 23px" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">' +
                '一般票種' +
                '</a></h4></div>' +
                '<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">' +
                '<div class="panel-body">' +
                '<table class="table" style="font-size: 20px">' +
                '<tr><th>票種</th><th>價格</th><th>數量</th><th>合計</th></tr>';
                if(selectTime.getHours() < 22 && selectTime.getHours() > 12){
                    bPicture += '<tr><td>全票</td>' +
                    '<td>$ '+schedule.ticketPrice.ticketPrice+'</td>' +
                    '<td style="width: 30%;">'+
                    '<select class="form-control" style="color: black; width: 70%;" onchange=total(this,"general",'+schedule.ticketPrice.ticketPrice+')>'+
                    '<option selected value=0>請選擇票數</option>';
                    for (let i = 0; i < 10; i++) {
                        bPicture += '<option>' + (i+1) + '</option>'
                    }
                    bPicture += '</select></span></span>'+
                    '</td>' +
                    '<td id="general" style="width: 25%;">$ 0</td></tr>' +
                    '<tr><td>優待票</td>' +
                    '<td>$ '+(schedule.ticketPrice.ticketPrice-20)+'</td>' +
                    '<td style="width: 30%;">' +
                    '<select class="form-control" style="color: black; width: 70%;" onchange=total(this,"cutBack",'+(schedule.ticketPrice.ticketPrice-20)+')>'+
                    '<option selected value=0>請選擇票數</option>';
                    for (let i = 0; i < 10; i++) {
                        bPicture += '<option>' + (i+1) + '</option>'
                    }
                    bPicture += '</select></span></span>'+
                    '</td>' +
                    '<td id="cutBack" style="width: 25%;">$ 0</td></tr>' ;
                }else if(selectTime.getHours() >= 22 || selectTime.getHours() < 6){
                    bPicture += '<tr><td>夜貓場</td>' +
                    '<td>$ '+(schedule.ticketPrice.ticketPrice-50)+'</td>' +
                    '<td style="width: 30%;">'+
                    '<select class="form-control" style="color: black; width: 70%;" onchange=total(this,"night",'+(schedule.ticketPrice.ticketPrice-50)+')>'+
                    '<option selected value=0>請選擇票數</option>';
                    for (let i = 0; i < 10; i++) {
                        bPicture += '<option>' + (i+1) + '</option>'
                    }
                    bPicture += '</select></span></span>'+
                    '</td>'+
                    '<td id="night" style="width: 25%;">$ 0</td></tr>' ;
                }else if(selectTime.getHours() > 6 && selectTime.getHours() <= 12 ){
                    bPicture += '<tr><td>早場</td>' +
                    '<td>$ '+(schedule.ticketPrice.ticketPrice-70)+'</td>' +
                    '<td style="width: 30%;">'+
                    '<select class="form-control" style="color: black; width: 70%;" onchange=total(this,"morning",'+(schedule.ticketPrice.ticketPrice-70)+')>'+
                    '<option selected value=0>請選擇票數</option>';
                    for (let i = 0; i < 10; i++) {
                        bPicture += '<option>' + (i+1) + '</option>'
                    }
                    bPicture += '</select></span></span>'+
                    '</td>'+
                    '<td id="morning" style="width: 25%;">$ 0</td></tr>' ;
                }
                bPicture += '</table></div></div></div></div></div>' +
                '<div align="right" class="tag-category tag-1 radius">' +
                '<ul><li><a style="cursor: pointer;font-size: 20px" onclick=version() ><i class="fa fa-arrow-left" aria-hidden="true"></i> 上一步</a></li>'+
                '<a style="cursor: pointer;font-size: 20px" onclick=sub() >繼續 <i class="fa fa-arrow-right" aria-hidden="true"></i></a></li></ul></div>';

            document.querySelector(".col-lg-8").innerHTML = bPicture;
            dynamicallyLoadScript()
            ticketType = new Map();
        }

        //再次掛載js檔
        function dynamicallyLoadScript() {
            var script = document.createElement("script");
            script.src = "${pageContext.request.contextPath}/user/js/main.js";
            document.head.appendChild(script);
        }

        //計算金錢總額
        function total(sel,species,price) {
            document.getElementById(species).innerHTML ='$ '+ sel.value*price;
            ticketType.set(species,sel.value);
        }

        //取得票數，並切換至下一頁
        function sub() {
            //全票
            general = (ticketType.get("general")==undefined? 0 : parseInt(ticketType.get("general")));
            //優待票
            cutBack = (ticketType.get("cutBack")==undefined? 0 : parseInt(ticketType.get("cutBack")));
            //夜貓場
            night = (ticketType.get("night")==undefined? 0 : parseInt(ticketType.get("night")));
            //早場
            morning = (ticketType.get("morning")==undefined? 0 : parseInt(ticketType.get("morning")));

            volumes = general+cutBack+night+morning;
            blockades = 0;

            for(let i = 0; i < schedule.hall.seats.length; i++){
                if(schedule.hall.seats[i].status == 1){
                    blockades += 1;
                }
            }
            
            if(volumes > 10){
                swal("單筆消費上限為10張票", "", "error", {button: "確認"});
                return;
            }else if(general+cutBack+night+morning == 0){
                swal("請至少選購1張票", "", "error", {button: "確認"});
                return;
            }else if(schedule.hall.total-(schedule.hall.seats.length-blockades+orderSeat.length) < volumes){
                swal("本場次只剩"+(schedule.hall.total-(schedule.hall.seats.length-blockades+orderSeat.length))+"個座位", "", "error", {button: "確認"});
                return;
            }

            var seats = '<div class="hadding-area">' +
                '<h1 >線上訂票</h1>' +
                '<ul class="breadcrumb">' +
                '<li><a>選擇版本與場次</a></li>' +
                '<li><a>選擇票種與數量</a></li>' +
                '<li style="font-size: 25px">選擇座位</li>' +
                '<li><a>餐點選購</a></li>'+
                '<li><a>結帳</a></li>' +
                '</ul></div>' +
                '<div class="alert alert-warning" role="alert">' +
                '<i  style="width: 25px; font-size: 20px" class="fa fa-film" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">選擇座位</strong>' +
                '</div>'+
                '<table style="font-size: 20px; font-weight: bold; color:white; width: 100%"><tr>' +
                '<td style="width: 100px;text-align: center;"><i style="width: 30px;" class="fa fa-tags" aria-hidden="true"></i>座位 :</td>' +
                '<td id="position"></td>' +
                '</tr></table>' +
                '<br>' +
                '<div class="details-contents"><div class="details-content"><div class="details-dectiontion">'+
                '<div align="center"><div style="width: 500px;" class="alert alert-success" role="alert">'+
                '<strong style="font-size: 30px">螢　　　　幕</strong>'+
                '</div></div></div></div></div>'+
                '<div align="center"><table>'+
                seating()+
                '</table><br><h4 style="color: white;">'+ywBut+'現場劃位　　'+
                '<ul style="margin: 0;" class="pagination"><li class="page-item"><a style="background-color: LightGray;height: 24px;"></a></li></ul>可選擇　　'+grBut+'您的座位　　'+rdBut+'已售出</h4></div>'+
                '<br>'+
                '<div align="right" class="tag-category tag-1 radius">' +
                '<ul><li><a style="cursor: pointer;font-size: 20px" onclick=ticket('+selectTime.getTime()+') ><i class="fa fa-arrow-left" aria-hidden="true"></i>上一步</a></li>'+
                '<li><a style="cursor: pointer;font-size: 20px" onclick=food() >繼續<i style="width: 30px;" class="fa fa-arrow-right" aria-hidden="true"></i></a></li></ul></div></div>';
                
            document.querySelector(".col-lg-8").innerHTML = seats;
            adjust();
            dynamicallyLoadScript();
        }

        //印出空座位表
        function seating() {
            //透明按鈕
            trBut = '<ul style="margin: 0;" class="pagination"><li class="page-item"><a style="background-color: transparent;"></a></li></ul>';
            //黃色保留位
            ywBut = '<ul style="margin: 0;" class="pagination"><li class="page-item"><a style="background-color: yellow;height: 24px;"></a></li></ul>';
            //選擇的座位
            grBut = '<ul style="margin: 0;" class="pagination"><li class="page-item active"><a class="page-link" style="height: 24px;cursor: pointer;"></a></li></ul>';
            //可選座位
            nlBut = '<ul style="margin: 0;" class="pagination"><li class="page-item"><a style="background-color: LightGray;height: 24px;cursor: pointer;"></a></li></ul>';
            //已被購選
            rdBut = '<ul style="margin: 0;" class="pagination"><li class="page-item"><a style="background-color: red;height: 24px;"></a></li></ul>';


            var content = '';
            for (let i = 0; i < schedule.hall.row; i++) {
                content += "<tr><th style='color: white;'>" + String.fromCharCode(65 + i) + "</th><td>"+trBut+"</td>"
                if (schedule.hall.specification == 'CBABC') {
                    for (let j = 0; j < schedule.hall.areaC; j++) {
                        content += "<td class='vacancyId'>"+nlBut+"</td>";
                    }
                    content += "<td>"+trBut+"</td>";
                }
                if (schedule.hall.specification == 'BA' || schedule.hall.specification == 'BAB' || schedule.hall.specification == 'CBABC') {
                    for (let j = 0; j < schedule.hall.areaB; j++) {
                        content += "<td class='vacancyId'>"+nlBut+"</td>";
                    }
                    content += "<td>"+trBut+"</td>";
                }
                for (let j = 0; j < schedule.hall.areaA; j++) {
                    content += "<td class='vacancyId'>"+nlBut+"</td>";
                }
                if (schedule.hall.specification == 'AB' || schedule.hall.specification == 'BAB' || schedule.hall.specification == 'CBABC') {
                    content += "<td>"+trBut+"</td>";
                    for (let j = 0; j < schedule.hall.areaB; j++) {
                        content += "<td class='vacancyId'>"+nlBut+"</td>";
                    }
                }
                if (schedule.hall.specification == 'CBABC') {
                    content += "<td>"+trBut+"</td>";
                    for (let j = 0; j < schedule.hall.areaC; j++) {
                        content += "<td class='vacancyId'>"+nlBut+"</td>";
                    }
                }
                content += "<td>"+trBut+"</td><th style='color: white;'>" + String.fromCharCode(65 + i) + "</th></tr>"
            }
                return content;
        }

        //將未開放座位印出
        function adjust() {

            var vacancyId = document.getElementsByClassName("vacancyId");
            var vacancyIds = schedule.hall.seats;
                for (let i = 0; i < vacancyId.length; i++) {
                    for (let j = 0; j < vacancyIds.length; j++) {
                        if(i==vacancyIds[j].vacancyId){
                            if(vacancyIds[j].status==1){
                                vacancyId[i].innerHTML = trBut;
                                vacancyId[i].className="vacancyId trBut";
                            }else{
                                vacancyId[i].innerHTML = ywBut;
                                vacancyId[i].className="vacancyId ywBut";
                            }
                        }
                    }
                    for(let k = 0; k < orderSeat.length; k ++){
                        if(i==orderSeat[k].seatNumber){
                            vacancyId[i].innerHTML = rdBut;
                            vacancyId[i].className="vacancyId rdBut";
                        }
                    }
            }
                select();
                
            

        }

        //對座位進行選擇
        function select() {
            //取得所有座位
            var vacancyId = document.getElementsByClassName("vacancyId");
            var statId = (schedule.hall.total+blockades)/schedule.hall.row;
            detail = '';
            //被選取的座位
            retainedId = [];
            toQuantity = volumes;
            
            for(let i = 0 ; i < vacancyId.length ; i++){
                if(vacancyId[i].className != "vacancyId trBut" && vacancyId[i].className != "vacancyId ywBut" && vacancyId[i].className != "vacancyId rdBut"){
                    vacancyId[i].addEventListener("click",function(){
                        if(vacancyId[i].className != "vacancyId grBut"){
                            var grButs = document.querySelectorAll(".grBut");
                            if(grButs.length == toQuantity){
                                var rId = retainedId.shift();
                                vacancyId[rId].innerHTML = nlBut;
                                vacancyId[rId].className = "vacancyId";
                            }
                            vacancyId[i].innerHTML = grBut;
                            vacancyId[i].className = "vacancyId grBut";
                            retainedId.push(i);
                            detail = '';
                            for (let i = 0; i < retainedId.length; i++) {
                                var retaineds =  parseInt(retainedId[i]);
                                console.log(retaineds)
                                detail += String.fromCharCode(65 + Math.floor(retaineds/statId))+((retaineds+1)%statId==0?statId:(retaineds+1)%statId)+'　'
                            }
                            document.getElementById("position").innerHTML = detail;
                        }else{
                            vacancyId[i].innerHTML = nlBut;
                            vacancyId[i].className = "vacancyId";
                            retainedId.splice(retainedId.indexOf(i),1);
                            detail = '';
                            for (let i = 0; i < retainedId.length; i++) {
                                var retaineds =  parseInt(retainedId[i]);
                                detail += String.fromCharCode(65 + Math.floor(retaineds/statId))+((retaineds+1)%statId==0?statId:(retaineds+1)%statId)+'　'
                            }
                            document.getElementById("position").innerHTML = detail;
                        }
                    })
                }
                }
        }

        function food(){
            if(retainedId.length != toQuantity){
                swal("請根據購票數來選位", "", "error", {button: "確認"});
                return;
            }
            
            var foodItem = '';
            var xhr = new XMLHttpRequest();
            xhr.open('GET','<c:url value="/foods.controller"/>',true);
            xhr.send();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    foods = JSON.parse(xhr.responseText);
                    foodSpecies = [];
                    var map = new Map();
            
                    for (let i = 0; i < foods.length; i++){
                        if(foodSpecies.indexOf(foods[i].foodSpecies.foodSpecies) == -1){
                            foodSpecies.push(foods[i].foodSpecies.foodSpecies);
                            map.set(foods[i].foodSpecies.id,foods[i].foodSpecies.foodSpecies);
                        }
                    }
            
                var foodArray = Array.from(map);
                foodArray.sort(function(a,b){return a[0]-b[0]})
                    foodItem = '<div class="hadding-area">' +
                        '<h1 >線上訂票</h1>' +
                        '<ul class="breadcrumb">' +
                        '<li><a>選擇版本與場次</a></li>' +
                        '<li><a>選擇票種與數量</a></li>' +
                        '<li><a>選擇座位</a></li>' +
                        '<li style="font-size: 25px">餐點選購</li>'+
                        '<li><a>結帳</a></li>' +
                        '</ul></div>' +
                        '<div class="alert alert-warning" role="alert">' +
                        '<i style="width: 25px; font-size: 20px" class="fa fa-cutlery" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">餐點選購(可略過)</strong>' +
                        '</div>'+
                        '<div class="cat-menu"><ul class="nav nav-tabs tab-menu">';
                        for (let i = 0; i < foodArray.length; i++) {
                            foodItem += '<li><a data-toggle="tab" href="" onclick=foodInner('+foodArray[i][0]+')><span style="font-size: 23px;font-weight: bold">'+foodArray[i][1]+'</span></a></li>';
                        }
                        foodItem += '</ul></div><div class="tag-category tag-2"></div><div id="foodcontent"></div>';

                        document.querySelector(".col-lg-8").innerHTML = foodItem;
                        foodInner(foodArray[0][0]);
                        dynamicallyLoadScript();
                        foodMap = new Map();
                }
            }
        }

        function foodInner(index){

            foodClass = [];

            for(let i = 0; i < foods.length ; i++){
                if(foods[i].foodSpecies.id==index){
                    foodClass.push(foods[i])
                }
            }
                var judgment = false
                var foodAll = '<table class="table">';
                for(let i = 0 ; i < foodClass.length; i++){
                    if(i%2==0){
                        foodAll += '<tr>';
                    }
                    var fdItem = JSON.stringify(foodClass[i]);
                    foodAll += '<td style="width: 25%;">' +
                                '<img style="" src="data:image/png;base64,' + foodClass[i].foodimage + '" alt="" />'+
                                '</td>'+
                                '<td style="width: 25%;">'+
                                '<h3 style="color:white; font-weight: bold">'+foodClass[i].foodname+'</h3><br>'+
                                '<p style="color:white;font-size: 20px">售價 : $ '+foodClass[i].foodprice+'</p><br>'+
                                '<select class="form-control" style="color: black; width: 70%;" onchange = foodChecklist('+fdItem+',this)>';
                                if(typeof(foodMap) != "undefined"){
                                    for (let j = 0; j <= 10; j++) {
                                        if(foodMap.get(foodClass[i].foodid+'q') == j){
                                            foodAll += '<option selected>' + j + '</option>';
                                        }else{
                                            foodAll += '<option>' + j + '</option>';
                                        }
                                    }
                                }else{
                                    for (let j = 0; j <= 10; j++) {
                                        foodAll += '<option>' + j + '</option>';
                                    }
                                }
                                foodAll += '</select>';
                    if(i%2!=0 || i == foodClass.length){
                        foodAll +='</tr>';
                    }
                }
                foodAll +='</table>'+
                        '<div align="right" class="tag-category tag-1 radius">' +
                        '<ul><li><a style="cursor: pointer;font-size: 20px" onclick=sub() ><i class="fa fa-arrow-left" aria-hidden="true"></i>上一步</a></li>'+
                        '<li><a style="cursor: pointer;font-size: 20px" onclick=bill() >繼續<i style="width: 30px;" class="fa fa-arrow-right" aria-hidden="true"></i></a></li></ul></div>';
                document.getElementById("foodcontent").innerHTML = foodAll;
        }

        function foodChecklist(foodClass,quantity){
            if(quantity.value==0){
                foodMap.delete(foodClass.foodid)
                foodMap.delete(foodClass.foodid+'q')
            }else{
                foodMap.set(foodClass.foodid+'q',quantity.value);
                foodMap.set(foodClass.foodid,foodClass);
                
            }            
        }

        function bill(){
            totalAmount = 0;
            resMap = new Map();
            ticketQuantities = []
            

            resMap.set("receive",1)
            var billItem = '<div class="hadding-area">' +
                        '<h1 >線上訂票</h1>' +
                        '<ul class="breadcrumb">' +
                        '<li><a>選擇版本與場次</a></li>' +
                        '<li><a>選擇票種與數量</a></li>' +
                        '<li><a>選擇座位</a></li>' +
                        '<li><a>餐點選購</a></li>'+
                        '<li style="font-size: 25px">結帳</li>' +
                        '</ul></div>' +
                        //訂票內容
                        '<div class="alert alert-warning" role="alert">' +
                        '<i  style="width: 25px; font-size: 20px" class="fa fa-list-alt" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">訂票內容</strong>' +
                        '</div>' +
                        '<table style="text-align: center;font-size: 20px; font-weight: bold; color:white; width: 100%;border-collapse:separate; border-spacing:0px 10px;"><tr>' +
                        '<td><i style="width: 32px;" class="fa fa-university" aria-hidden="true"></i>影廳 :</td>' +
                        '<td>' + schedule.hall.hallName + '</td>' +
                        '<td><i style="width: 30px;"  class="fa fa-calendar" aria-hidden="true"></i>場次日期 :</td>' +
                        '<td>' + schedule.date + '</td>' +
                        '<td><i style="width: 30px;" class="fa fa-clock-o" aria-hidden="true"></i></i>場次時間 :</td>' +
                        '<td>' + schedule.time + '</td>' +
                        '</tr><tr>'+
                        '<td><i style="width: 30px;" class="fa fa-tags" aria-hidden="true"></i>座位 :</td>'+
                        '<td colspan="5" style="text-align:left;">'+detail+'</td>'+
                        '</tr></table>' +
                        '<br>' +
                        '<table align="center" class="table" style="width: 90%; color:white; font-size: 20px">' +
                        '<tr><th>商品</th><th>價格</th><th>數量</th><th>合計</th></tr>';
                        if(general!=0){
                            var ticket ={ "ticketSpecies": "全票", "ticketQuantity": general }
                            ticketQuantities.push(ticket);
                            billItem += '<tr><td>全票</td><td>$ '+schedule.ticketPrice.ticketPrice+'</td><td>'+general+'</td><td>$ '+(schedule.ticketPrice.ticketPrice*general)+'</td></tr>';
                            totalAmount += schedule.ticketPrice.ticketPrice*general;
                        }
                        if(cutBack!=0){
                            var ticket ={ "ticketSpecies": "優待票", "ticketQuantity": cutBack }
                            ticketQuantities.push(ticket);
                            billItem += '<tr><td>優待票</td><td>$ '+(schedule.ticketPrice.ticketPrice-20)+'</td><td>'+cutBack+'</td><td>$ '+((schedule.ticketPrice.ticketPrice-20)*cutBack)+'</td></tr>';
                            totalAmount += (schedule.ticketPrice.ticketPrice-20)*cutBack;
                        }
                        if(night!=0){
                            var ticket ={ "ticketSpecies": "夜貓場", "ticketQuantity": night }
                            ticketQuantities.push(ticket);
                            billItem += '<tr><td>夜貓場</td><td>$ '+(schedule.ticketPrice.ticketPrice-50)+'</td><td>'+night+'</td><td>$ '+((schedule.ticketPrice.ticketPrice-50)*night)+'</td></tr>';
                            totalAmount += (schedule.ticketPrice.ticketPrice-50)*night;
                        }
                        if(morning!=0){
                            var ticket ={ "ticketSpecies": "早場", "ticketQuantity": morning }
                            ticketQuantities.push(ticket);
                            billItem += '<tr><td>早場</td><td>$ '+(schedule.ticketPrice.ticketPrice-70)+'</td><td>'+morning+'</td><td>$ '+((schedule.ticketPrice.ticketPrice-70)*morning)+'</td></tr>';
                            totalAmount += (schedule.ticketPrice.ticketPrice-70)*morning;
                        }
                        if(typeof(foodMap) != "undefined"){
                            for(let i = 0; i < foods.length; i++){
                                if(typeof(foodMap.get(foods[i].foodid)) != "undefined"){
                                    billItem +='<tr><td>'+foodMap.get(foods[i].foodid).foodname+'</td><td>$ '+foodMap.get(foods[i].foodid).foodprice+'</td><td>'+foodMap.get(foods[i].foodid+'q')+'</td><td>$ '+(foodMap.get(foods[i].foodid+'q')*foodMap.get(foods[i].foodid).foodprice)+'</td></tr>';
                                    totalAmount += foodMap.get(foods[i].foodid+'q')*foodMap.get(foods[i].foodid).foodprice;
                                }
                            }
                        }
                        billItem +='<tr><td>總額</td>' +
                        '<td></td>' +
                        '<td></td>' +
                        '<td>$ '+totalAmount+'</td>' +
                        '</table>'+
                        '<br>'+
                        '<div class="alert alert-warning" role="alert" >' +
                        '<i  style="width: 25px; font-size: 20px" class="fa fa-check-square-o" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">取票方式</strong>' +
                        '</div>'+
                        '<table><tr><td  valign="center">'+
                        '<div class="gallery-menu" style="margin-bottom:60px">'+
                        '<ul class="active" style="margin:0px;">'+
                        '<li style="float:left;margin-right:25px;border:1px ;font-size: 20px" onclick=receive(this) class="filter active" value="1">現場取票</li>'+
                        '<li style="float:left;margin-right:25px;border:1px ;font-size: 20px" onclick=receive(this) class="filter" value="2">超商取票</li>'+
                        '</ul></div>'+
                        '</td></tr></table>'+
                        '<div class="alert alert-warning" role="alert">' +
                        '<i  style="width: 25px; font-size: 20px" class="fa fa-credit-card" aria-hidden="true"></i><strong  style="font-size: 20px; font-weight: bold;">付費方式</strong>' +
                        '</div>'+
                        '<table style="font-size: 20px; font-weight: bold; color:white; width: 100%; border-collapse:separate; border-spacing:0px 10px;"><tr>'+
                        '<td><i style="width: 30px;" class="fa fa-cc-visa" aria-hidden="true"></i>信用卡</td>'+
                        '</table>'+
                        '<div align="right" class="tag-category tag-1 radius">' +
                        '<ul><li><a style="cursor: pointer;font-size: 20px" onclick=food() ><i class="fa fa-arrow-left" aria-hidden="true"></i>上一步</a></li>'+
                        '<li><a style="cursor: pointer;font-size: 20px" onclick=checkouts() ><i class="fa fa-shopping-cart" aria-hidden="true"></i> 付款</a></li></ul></div>';
                
                        document.querySelector(".col-lg-8").innerHTML = billItem;
        }

        function receive(resele){
            resMap.set("receive",resele.value)

            var recseles =  document.getElementsByClassName("filter");
            if(resele.className != "filter active"){
                for(let i = 0; i < recseles.length; i++){
                    if(recseles[i].className=="filter active"){
                        recseles[i].className = "filter";
                    }
                }
                resele.className = "filter active";
            }
        }


        function checkouts(){
            swal({
					title : "確定要結帳?",
					text : "確定後將跳至付款頁面",
					icon : "warning",
					buttons : true,
					dangerMode : false
				}).then(function(select) {
					if (select) {
                        //選擇座位(json)
                        retary = [];
                        for (let retained of retainedId) {
                            var retJson = { "seatNumber" : retained };
                            retary.push(retJson);
                        }
                        foodArray = [];
                        //食物訂單(json)
                        if(typeof(foodMap) != "undefined"){
                            for(let i = 0; i < foods.length; i++){
                                if(typeof(foodMap.get(foods[i].foodid)) != "undefined"){
                                    var foodJson = {
                                        "food":foodMap.get(foods[i].foodid), 
                                        "foodQuantity":parseInt(foodMap.get(foods[i].foodid+'q'))
                                    }
                                    foodArray.push(foodJson);
                                }
                            }
                        }
						var json = {
                            "ticketMoney":totalAmount,
                            "receive" : resMap.get("receive"),
                            "orderStatus" : 1,
                            "seatNumbers" : retary,
                            "orderFoods": foodArray,
                            "ticketQuantities" : ticketQuantities,
                        }

                        ajaxJson = JSON.stringify(json);
                        document.getElementById("orderTicket").setAttribute("value",ajaxJson);
                        document.getElementById("id").setAttribute("value",schedule.schedule_id);
                        document.getElementById("orderTicketSub").submit()
					}
				})

        }
    </script>
</body>

</html>