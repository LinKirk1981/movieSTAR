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
            <h1 style="margin-bottom: 10px;">會員訂單</h1>
            <div id="rebu"></div>
          </div>
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item"><a>訂單管理</a></li>
              <li class="breadcrumb-item active">會員訂單</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
                <table id="refundTable" class="table table-bordered table-hover"></table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
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
    allApply();

    //印出所有退款申請
    function allApply(){

      if(typeof(tableMb) != "undefined"){
        tableMb.destroy();
        document.getElementById("rebu").innerHTML="";
      }

      var xhr = new XMLHttpRequest();
      xhr.open('GET','<c:url value="/shopping/allMemberOrder.controller" />',true);
      xhr.send();
      xhr.onreadystatechange = function(){
          if(xhr.readyState == 4 && xhr.status == 200){
              allMemberOrder = JSON.parse(xhr.responseText);
              var members = [];

              var printAllMemberOrder = '<thead>'+
                                        '<tr>'+
                                        '<th style="width: 17%;">會員編號</th>'+
                                        '<th style="width: 17%;">會員姓名</th>'+
                                        '<th style="width: 17%;">訂單筆數</th>'+
                                        '<th style="width: 17%;">消費總額</th>'+
                                        '<th style="width: 17%;">交易未完成</th>'+
                                        '<th style="width: 15%;"></th>'+
                                        '</tr>'+
                                        '</thead>'+
                                        '<tbody>';

              for(let i = 0 ; i < allMemberOrder.length ; i++){

                var orderCount = 0;
                var orderTotal = 0;
                var orderUnfinished = 0;

                
                  if(members.indexOf(allMemberOrder[i].member.mempk)==-1){

                    members.push(allMemberOrder[i].member.mempk)

                    for(let j = 0 ; j < allMemberOrder.length ; j++){

                      if(allMemberOrder[i].member.mempk == allMemberOrder[j].member.mempk){
                        orderCount += 1;
                        orderTotal += allMemberOrder[j].ticketMoney;
                        if(allMemberOrder[j].orderStatus == 1){
                          orderUnfinished += 1;
                        }
                      }
                    }
                    printAllMemberOrder += '<tr>'+
                      '<td style="vertical-align: middle;">'+allMemberOrder[i].member.mempk+'</td>'+
                      '<td style="vertical-align: middle;">'+allMemberOrder[i].member.name+'</td>'+
                      '<td style="vertical-align: middle;">'+orderCount+'</td>'+
                      '<td style="vertical-align: middle;">'+orderTotal+'</td>'+
                      '<td style="color: red;vertical-align: middle;">'+orderUnfinished+'</td>'+
                      '<td style="text-align: center;">'+
                      '<button type="button" class="btn btn-info" onclick = memberOrderItem('+allMemberOrder[i].member.mempk+')><i class="far fa-file-alt"></i>　內容</button>'+
                      '</td>'+
                      '</tr>';
                      
                  }
              }
                printAllMemberOrder += '</tbody>';
                document.getElementById("refundTable").innerHTML = printAllMemberOrder;
                table = $('#refundTable').DataTable({
                  "language": {
                    "lengthMenu": "顯示 _MENU_ 項結果",
                    "zeroRecords": "沒有符合的結果",
                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    "infoEmpty": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    "infoFiltered": "(從 _MAX_ 個項目中搜尋)",
                    "search": "搜尋:",
                    oPaginate: {
                      sFirst: "首頁",
                      sPrevious: "上一頁",
                      sNext: "下一頁",
                      sLast: "尾頁"
                    }
                  },
                  
                });
              
          }
      }
    }

    function memberOrderItem(memberId){
      
      var orderItemView = '<thead>'+
                          '<tr>'+
                          '<th style="width: 17%;">訂單編號</th>'+
                          '<th style="width: 17%;">交易序號</th>'+
                          '<th style="width: 17%;">狀態</th>'+
                          '<th style="width: 17%;">申請項目</th>'+
                          '<th style="width: 17%;">總額</th>'+
                          '<th style="width: 15%;"></th>'+
                          '</tr>'+
                          '</thead>'+
                          '<tbody>';

      for(let i = 0; i < allMemberOrder.length ; i++){

        if(allMemberOrder[i].member.mempk == memberId){

              orderItemView += '<tr>'+
                              '<td style="vertical-align: middle;">'+allMemberOrder[i].ticketId+'</td>'+
                              '<td style="vertical-align: middle;">'+allMemberOrder[i].transactionNumber+'</td>';
          
                              if(allMemberOrder[i].orderStatus == 1){
              orderItemView += '<td style="vertical-align: middle;color:red">未領票</td>';
          }else if(allMemberOrder[i].orderStatus == 2 && allMemberOrder[i].apply == 2){
              orderItemView += '<td style="vertical-align: middle;color:red">取消交易</td>';
          }else{
              orderItemView += '<td style="vertical-align: middle;color:green">已領票</td>';
          }

          if(allMemberOrder[i].apply == 3){
              orderItemView += '<td style="vertical-align: middle;">退款申請已駁回</td>';
          }else if(allMemberOrder[i].apply == 1){
              orderItemView += '<td style="vertical-align: middle;color:red">申請退票</td>';
          }else if(allMemberOrder[i].apply == 2){
              orderItemView += '<td style="vertical-align: middle;color:green">已退款</td>';
          }else{
              orderItemView += '<td style="vertical-align: middle">無</td>';
          }
              orderItemView += '<td style="vertical-align: middle;">'+allMemberOrder[i].ticketMoney+'</td>'+
                                '<td style="text-align: center;">'+
                                '<button type="button" class="btn btn-primary" onclick=orderItem('+i+')><i class="fas fa-eye"></i>　詳情</button>'+
                                '</td>'+
                                '</tr>';
        }
      }
      orderItemView += '</tbody>';

      table.destroy();
      document.getElementById("refundTable").innerHTML = orderItemView;
      document.getElementById("rebu").innerHTML = '<button type="button" onclick=allApply() class="btn btn-secondary">返回</button>'
      
      tableMb = $('#refundTable').DataTable({
                "language": {
                  "lengthMenu": "顯示 _MENU_ 項結果",
                  "zeroRecords": "沒有符合的結果",
                  "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                  "infoEmpty": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                  "infoFiltered": "(從 _MAX_ 個項目中搜尋)",
                  "search": "搜尋:",
                  oPaginate: {
                    sFirst: "首頁",
                    sPrevious: "上一頁",
                    sNext: "下一頁",
                    sLast: "尾頁"
                  }
                },
                
              });     
    }

    function orderItem(index){
      var orderItem = allMemberOrder[index];
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

        var orderItemView = '<table class="table table-striped" style="font-size: 20px;">'+
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
                            '<tr>'+
                            '<th style="vertical-align: middle;text-align: center;">取票方式</th>'+
                            '<td>'+checkIn+'</td>'+
                            '</tr>';

            orderItemView += '</table>';

        Swal.fire({
            title: "訂單明細", 
            html: orderItemView,
            width: 800,
            confirmButtonText: "確認", 
        });
    }
</script>
</body>
</html>