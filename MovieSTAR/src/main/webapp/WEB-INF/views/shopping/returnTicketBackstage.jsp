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
            <h1>退票辦理</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item"><a>訂單管理</a></li>
              <li class="breadcrumb-item active">退票辦理</li>
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
        var xhr = new XMLHttpRequest();
        xhr.open('GET','<c:url value="/shopping/allApply.controller" />',true);
        xhr.send();
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                allApplyItem = JSON.parse(xhr.responseText);
                var printAllApply = '<thead>'+
                                    '<tr>'+
                                    '<th style="width: 15%;">訂單編號</th>'+
                                    '<th style="width: 15%;">交易序號</th>'+
                                    '<th style="width: 15%;">訂票日期</th>'+
                                    '<th style="width: 15%;">會員編號</th>'+
                                    '<th style="width: 15%;">狀態</th>'+
                                    '<th style="width: 25%;"></th>'+
                                    '</tr>'+
                                    '</thead>'+
                                    '<tbody>';
                
                for(let i = 0 ; i < allApplyItem.length ; i++){
                   printAllApply += '<tr>'+
                                    '<td style="vertical-align: middle;">'+allApplyItem[i].ticketId+'</td>'+
                                    '<td style="vertical-align: middle;">'+allApplyItem[i].transactionNumber+'</td>'+
                                    '<td style="vertical-align: middle;">'+allApplyItem[i].buyDate.substring(0,10)+'</td>'+
                                    '<td style="vertical-align: middle;">'+allApplyItem[i].member.mempk+'</td>';
                                    if(allApplyItem[i].apply == 1){
                                        printAllApply += '<td style="color: red;vertical-align: middle;">申請中</td>'+
                                                         '<td style="text-align: center;">'+
                                                         '<button type="button" class="btn btn-primary" onclick = details('+i+')><i class="far fa-eye"></i>查看</button>　'+
                                                         '<button type="button" class="btn btn-success" onclick = permit('+allApplyItem[i].ticketId+')><i class="fas fa-check"></i>准許</button>　'+
                                                         '<button type="button" class="btn btn-danger" onclick = overrule('+allApplyItem[i].ticketId+')><i class="fas fa-ban"></i>駁回</button>'+
                                                         '</td>'+
                                                         '</tr>';
                                    }else{
                                        printAllApply += '<td style="color: green;vertical-align: middle;">已處理</td>'+
                                                         '<td style="text-align: center;">'+
                                                         '<button type="button" class="btn btn-primary" onclick = details('+i+')><i class="fas fa-eye"></i>詳情</button>　'+
                                                         '<button type="button" class="btn btn-success" disabled><i class="fas fa-check"></i>准許</button>　'+
                                                         '<button type="button" class="btn btn-danger" disabled><i class="fas fa-ban"></i>駁回</button>'+
                                                         '</td>'+
                                                         '</tr>';
                                    }
                                    
                }
                    printAllApply += '</tbody>';
                document.getElementById("refundTable").innerHTML = printAllApply;
                $('#refundTable').DataTable({
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

    //檢視訂單詳情
    function details(index){
        var orderItem = allApplyItem[index];
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
                            console.log(orderItem.apply)
                            if(orderItem.apply == 2){
                              orderItemView += '<tr>'+
                                               '<th style="vertical-align: middle;text-align: center;">退票申請</th>'+
                                               '<td style="color: green;">已退款</td>'+
                                               '</tr>';
                            }else if(orderItem.apply == 3){
                              orderItemView += '<th style="vertical-align: middle;text-align: center;">退票申請</th>'+
                                               '<td style="color: red;">已駁回</td>'+
                                               '</tr>';
                            }
            orderItemView += '</table>';

        Swal.fire({
            title: "訂單明細", 
            html: orderItemView,
            width: 800,
            confirmButtonText: "確認", 
        });
    }

    function permit(id){
        Swal.fire({
            title: '確定要允許退票?',
            text: "允許退票後將會退還客戶款項",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '確定',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
                var xhr = new XMLHttpRequest();
                xhr.open('GET','<c:url value="/shopping/permit.controller/" />'+id,true);
                xhr.send();

                Swal.fire({
                  icon: 'success',
                  title: '已同意申請',
                  showConfirmButton: false,
                  timer: 1500
                });
                setTimeout(function(){window.location.reload()},1500)
            }
        })
      }

      function overrule(id){
        Swal.fire({
            title: '確定要駁回申請?',
            text: "駁回申請後將無法變更",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '確定',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {

                var xhr = new XMLHttpRequest();
                xhr.open('GET','<c:url value="/shopping/overrule.controller/" />'+id,true);
                xhr.send();

                Swal.fire({
                  icon: 'success',
                  title: '已駁回申請',
                  showConfirmButton: false,
                  timer: 1500
                });
                setTimeout(function(){window.location.reload()},1500)
                
            }
        })
      }
</script>
</body>
</html>