<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">

<head>

<jsp:include page="../administrator/cssback.jsp"></jsp:include> 

<body class="hold-transition sidebar-mini">
<script src="  ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<jsp:include page="../administrator/topback.jsp"></jsp:include> 

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增影廳</title>
    <style>
        td {
/*             border: 1px solid black; */
            width: 50px;
            height: 50px;
            margin: 20px 0;
            
        }

        table {
            border-spacing: 10px;
            margin-left:auto; 
            margin-right:auto;
            
        }
        td.vacancyId{
			width: 35px;
    		height: 50px;
    		border-radius: 7px;
    		 background: linear-gradient(to top, #761818, #761818, #761818, #761818, #761818, #B54041,  #F3686A);
    margin-bottom: 10px;
/*     transform: skew(20deg); */
    margin-top: -32px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5)
        }
    </style>
</head>

<body>
    <div style="width: 80%;margin: 0 auto;">
        <h2 style="text-align: center;">新增影廳</h2>
        <div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
        <hr>
        <div style="float: left; width: 60%;text-align: center;background-color: black">
        	<img src="https://o.remove.bg/downloads/5e756442-7925-46b5-a2e2-facc28a2f8bc/images-removebg-preview.png">
            <p></p>
            <table style="margin: auto;" id="seat"></table>
        </div>
        <div style="width: 38%;float:right;">
            <h4>區域配置</h4>
			影廳名稱: <input type="text" name="hallName" id="hallName">
            <br>
            <br>
           	 配置:
            <select id="specification">
                <option value="A">A</option>
                <option value="BA">BA</option>
                <option value="AB">AB</option>
                <option value="BAB">BAB</option>
                <option value="CBABC">CBABC</option>
            </select>
            <br>
            <br>
			排數:
            <input type="number" min="0" value="5" name="row" id="row">
            <br>
            <br>
            A區大小:
            <input type="number" min="0" value="5" id="a">
            <br>
            <br>
            B區大小:
            <input type="number" min="0" value="3" id="b">
            <br>
            <br>
            C區大小:
            <input type="number" min="0" value="1" id="c">
            <br>
            <br>
           	 總容量：
            <input type="text" value="" id="total" disabled>
            <br>
            <br>
            <a href="<c:url value="/confirmMain.controller"/>"><button type="button" id="send">確認</button></a>
            <button type="button" id="preview">預覽</button>
        </div>
    </div>
    <script src="user/js/jquery-3.5.1.min.js"></script>
    <script src="user/js/popwin.js"></script>
    <script>
    	var hallName = document.getElementById("hallName");
        var specification = document.getElementById("specification");
        var row = document.getElementById("row");
        var a = document.getElementById("a");
        var b = document.getElementById("b");
        var c = document.getElementById("c");
        var total = document.getElementById("total");
        var seat = document.getElementById("seat");
        var vacancyId = document.getElementsByClassName("vacancyId");
        var vacancyIds=[];
        sequence();
        
        specification.addEventListener("change",sequence);
        row.addEventListener("change",sequence);
        a.addEventListener("change",sequence);
        b.addEventListener("change",sequence);
        c.addEventListener("change",sequence);

        //創建座位表
        function sequence() {
            var content = "";
            for (let i = 0; i < row.value; i++) {
                content += "<tr><th>" + String.fromCharCode(65 + i) + "<td style='border: none;'></td>"
                if(specification.value=='CBABC'){
                    for (let j = 0; j < c.value; j++) {
                        content += "<td class='vacancyId'></td>";
                    }
                    content += "<td style='border: none;'></td>";
                }
                if(specification.value=='BA' || specification.value=='BAB' || specification.value=='CBABC'){
                    for (let j = 0; j < b.value; j++) {
                        content += "<td class='vacancyId'></td>";
                    }
                    content += "<td style='border: none;'></td>";
                }
                for (let j = 0; j < a.value; j++) {
                    content += "<td class='vacancyId'></td>";
                }
                if(specification.value=='AB' || specification.value=='BAB' || specification.value=='CBABC'){
                    content += "<td style='border: none;'></td>";
                    for (let j = 0; j < b.value; j++) {
                        content += "<td class='vacancyId'></td>";
                    }
                }
                if(specification.value=='CBABC'){
                    content += "<td style='border: none;'></td>";
                    for (let j = 0; j < c.value; j++) {
                        content += "<td class='vacancyId'></td>";
                    }
                }
                content += "<td style='border: none;'></td><th>" + String.fromCharCode(65 + i) + "</th></tr>"
            }
            seat.innerHTML = content;
            var calculate = 0;
        	for (let i = 0; i < vacancyId.length; i++){
        		 if(vacancyId[i].style.background==''){
        			 calculate += 1;
        		 }
            }
        	total.value = calculate;

            for (let i = 0; i < vacancyId.length; i++) {
                vacancyId[i].addEventListener("click",function(){
	                if(vacancyId[i].style.background==''){
	                    vacancyId[i].style.background="black";
	                    vacancyIds.push(i);
	                }else{
	                    vacancyId[i].style.background=""
	                    vacancyIds.splice(vacancyIds.indexOf(i),1)
	                }

	                var calculate = 0;
	            	for (let i = 0; i < vacancyId.length; i++){
	            		 if(vacancyId[i].style.background==''){
	            			 calculate += 1;
	            		 }
	                }
	            	total.value = calculate;

	                
            	})
        	}
        }

		var send = document.getElementById("send");
		send.onclick = function() {
	        //新增到後台
	        var xhr = new XMLHttpRequest();
	
			xhr.open("POST","<c:url value='/arrangeAddHall.controller'/>","true");
			var jsonHall = {
				"hallName":hallName.value,
				"specification":specification.value,
				"row":row.value,
				"areaA":a.value,
				"areaB":b.value,
				"areaC":c.value,
				"total":total.value,
				"vacancyIds":vacancyIds
					}
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(JSON.stringify(jsonHall));
			alert("影廳已新增成功");
		}

		var preview = document.getElementById("preview");
		preview.onclick = function() {
			var xhr = new XMLHttpRequest();
			
			xhr.open("POST","<c:url value='/arrangePreviewHall.controller'/>","true");
			var jsonHall = {
				"hallName":hallName.value,
				"specification":specification.value,
				"row":row.value,
				"areaA":a.value,
				"areaB":b.value,
				"areaC":c.value,
				"total":total.value,
				"vacancyIds":vacancyIds
					}
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(JSON.stringify(jsonHall));

			popWin.showWin('<c:url value="/detailsMain.controller"/>',"800","600")
		}
    </script>
     <jsp:include page="../administrator/footerback.jsp"></jsp:include> 
</body>

</html>