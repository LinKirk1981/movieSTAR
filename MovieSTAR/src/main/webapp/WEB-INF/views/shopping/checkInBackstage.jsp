<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../administrator/cssback.jsp"/>
  <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</head>
<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"/>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>取票系統</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item"><a>訂單管理</a></li>
              <li class="breadcrumb-item active">取票系統</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row"></div>
        <!-- /.row -->
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<jsp:include page="../administrator/footerback.jsp"/>
<!-- DataTables  & Plugins -->
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/jszip/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/pdfmake/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/pdfmake/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/administrator/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- Page specific script -->
<script>
  selectView();

  //查詢畫面
  function selectView(){
    selectForm = '<div class="col-md-6" style="margin:0px auto;">'+
                 ' <div class="card card-primary">'+
                 '<div class="card-header">'+
                 '<h3 class="card-title">輸入交易序號　<small>查看訂單並確認取票狀態</small></h3>'+
                 '</div>'+
                 '<div id="quickForm">'+
                 '<div class="card-body">'+
                 '<div class="form-group">'+
                 '<label for="number">交易序號</label>'+
                 '<input type="text" class="form-control" id="number" placeholder="請輸入序號編碼">'+
                 '</div>'+
                 '</div>'+
                 '<div class="card-footer">'+
                 '<button type="button" onclick=selectOrder() class="btn btn-primary">確認</button>'+
                 '</div>'+
                 '</div>'+
                 '</div>'+
                 '</div>';
    
    document.querySelector(".row").innerHTML = selectForm;
  }

  function selectOrder(){
    var tr = (document.getElementById("number").value != ''?document.getElementById("number").value:0);

    var xhr = new XMLHttpRequest();
    xhr.open('GET','<c:url value="/shopping/orderItem.controller/"/>'+tr,true);
    xhr.send();
    xhr. onreadystatechange = function(){
      if(xhr.readyState == 4 && xhr.status == 200){
        orderItem = JSON.parse(xhr.responseText);

        if (orderItem.ticketId == null) {

          Swal.fire({
            icon: 'error',
            title: '錯誤',
            text: '查詢不到此序號',
            showConfirmButton: false,
            timer: 1500
          })

          selectView();
          return;
		    }
        
        var ticket = '';
        var foods = '';
        var numbers = '';
        var checkIn = '';
        var blockades = 0;

        for(let i = 0; i < orderItem.schedules.hall.seats.length; i++){
            if(orderItem.schedules.hall.seats[i].status == 1){
                blockades += 1;
            }
        }
        for(let i = 0; i < orderItem.ticketQuantities.length ; i++){
                ticket += orderItem.ticketQuantities[i].ticketSpecies+' x '+orderItem.ticketQuantities[i].ticketQuantity+'<br>';
        }
        for(let i = 0; i < orderItem.orderFoods.length; i++){
            foods += orderItem.orderFoods[i].food.foodname+' x '+orderItem.orderFoods[i].foodQuantity+'<br>';
        }

        var statId = (orderItem.schedules.hall.total+blockades)/orderItem.schedules.hall.row;

        for(let i = 0 ; i < orderItem.seatNumbers.length ; i++){
            numbers += String.fromCharCode(65 + Math.floor(orderItem.seatNumbers[i].seatNumber/statId))+((orderItem.seatNumbers[i].seatNumber+1)%statId==0?statId:(orderItem.seatNumbers[i].seatNumber+1)%statId)+'　';
        }

        if(orderItem.receive == 1){
            checkIn = '現場取票';
        }else{
            checkIn = '超商取票';
        }

        var orderItemView = '<div class="col-md-6" style="margin:0px auto;">'+
                            '<div class="card card-primary">'+
                            '<div class="card-header">'+
                            '<h3 class="card-title">訂單明細</h3>'+
                            '</div>'+
                            '<table class="table table-striped" style="font-size: 20px;">'+
                            '<tr>'+
                            '<th style="vertical-align: middle;text-align: center;">電影名稱</th>'+
                            '<td>'+orderItem.schedules.movie.movieName+'</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<th style="vertical-align: middle;text-align: center;">電影場次</th>'+
                            '<td>'+orderItem.schedules.date+'　'+orderItem.schedules.time+'</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<th style="vertical-align: middle;text-align: center;">票種</th>'+
                            '<td>'+ticket+'</td>'+
                            '</tr>';
                            if(foods != ''){
                               orderItemView += '<tr>'+
                                                '<th style="vertical-align: middle;text-align: center;">餐點</th>'+
                                                '<td>'+foods+'</td>'+
                                                '</tr>';
                            }
           orderItemView += '<tr>'+
                            '<th style="vertical-align: middle;text-align: center;">座位</th>'+
                            '<td>'+numbers+'</td>'+
                            '</tr>'+
                            '<tr>';
                            if(orderItem.orderStatus == 2 && orderItem.apply == 2){
                              orderItemView += '<th style="vertical-align: middle;text-align: center;">狀態</th>'+
                                               '<td style="color: green;">已退款</td>'+
                                               '</tr>'+
                                               '<tr>'+
                                               '<td colspan="2" style="text-align: center;">';

                            }else if(orderItem.orderStatus == 1){
                              orderItemView += '<th style="vertical-align: middle;text-align: center;">狀態</th>'+
                                               '<td style="color: red;" id="status">未取票</td>'+
                                               '</tr>'+
                                               '<tr>'+
                                               '<td colspan="2" style="text-align: center;" id="But">'+
                                               '<button type="button" id="checkInBut" class="btn btn-block btn-success btn-lg" onclick=getTickets('+orderItem.ticketId+')>取票</button>';

                            }else if(orderItem.orderStatus == 2 && (orderItem.apply == 1 || orderItem.apply == 3)){
                              orderItemView += '<th style="vertical-align: middle;text-align: center;">狀態</th>'+
                                               '<td style="color: green;">已取票</td>'+
                                               '</tr>'+
                                               '<tr>'+
                                               '<td colspan="2" style="text-align: center;">';
                            }
            orderItemView += '<button type="button" class="btn btn-block btn-secondary btn-lg" onclick=selectView()>返回查詢</button>'+
                             '</td>'+
                             '</tr>'+
                             '</table>'+
                             '</div>'+
                             '</div>';

            document.querySelector(".row").innerHTML = orderItemView;
      }
    }

  }

  function getTickets(id){
    var xhr = new XMLHttpRequest();
    xhr.open('GET','<c:url value="/shopping/getTickets.controller/"/>'+id,true);
    xhr.send();
    
    Swal.fire({
      icon: 'success',
      title: '以取票',
      showConfirmButton: false,
      timer: 1500
    });
    document.getElementById("status").style="color: green";
    document.getElementById("status").innerHTML="已取票";
    document.getElementById("But").removeChild(document.getElementById("checkInBut"));
  }
</script>
</body>
</html>