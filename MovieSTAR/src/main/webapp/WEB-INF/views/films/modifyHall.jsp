<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../administrator/cssback.jsp"></jsp:include> 

<body class="hold-transition sidebar-mini">
<jsp:include page="../administrator/topback.jsp"></jsp:include> 
<script
		src="  ${pageContext.request.contextPath}/administrator/plugins/jquery/jquery.min.js"></script>
<meta charset="UTF-8">
<title>設置保留位</title>
<style>
/*         * { */
/*             padding: 0; */
/*             margin: 10px 0; */
/*         } */

/*         td { */
/*             border: 1px solid black; */
/*             width: 20px; */
/*             height: 20px; */
/*             margin: 20px 0; */
/*         } */

        table {
            border-spacing: 10px;
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
<script>
        window.onload = function () {

        	var vacancyId = document.getElementsByClassName("vacancyId");
        	var retainedId=[];

        	
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "<c:url value='/schematicDiagram.controller'/>?hallId=" + ${id}, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var hall = JSON.parse(xhr.responseText);
                    var content = "";
                    for (let i = 0; i < hall.row; i++) {
                        content += "<tr><th>" + String.fromCharCode(65 + i) + "<td style='border: none;'></td>"
                        if (hall.specification == 'CBABC') {
                            for (let j = 0; j < hall.areaC; j++) {
                                content += "<td class='vacancyId'></td>";
                            }
                            content += "<td style='border: none;'></td>";
                        }
                        if (hall.specification == 'BA' || hall.specification == 'BAB' || hall.specification == 'CBABC') {
                            for (let j = 0; j < hall.areaB; j++) {
                                content += "<td class='vacancyId'></td>";
                            }
                            content += "<td style='border: none;'></td>";
                        }
                        for (let j = 0; j < hall.areaA; j++) {
                            content += "<td class='vacancyId'></td>";
                        }
                        if (hall.specification == 'AB' || hall.specification == 'BAB' || hall.specification == 'CBABC') {
                            content += "<td style='border: none;'></td>";
                            for (let j = 0; j < hall.areaB; j++) {
                                content += "<td class='vacancyId'></td>";
                            }
                        }
                        if (hall.specification == 'CBABC') {
                            content += "<td style='border: none;'></td>";
                            for (let j = 0; j < hall.areaC; j++) {
                                content += "<td class='vacancyId'></td>";
                            }
                        }
                        content += "<td style='border: none;'></td><th>" + String.fromCharCode(65 + i) + "</th></tr>"
                        document.getElementById("seat").innerHTML = content;                        
                    }

					var vacancyIds = hall.seats;
                    for (let i = 0; i < vacancyId.length; i++) {
       	                for (let j = 0; j < vacancyIds.length; j++) {
       	                	if(i==vacancyIds[j].vacancyId){
								if(vacancyIds[j].status == 1){
									vacancyId[i].style.background="black";
									retainedId.push(i);
								}else{
									vacancyId[i].style.background="yellow";
								}
							}
						}
       	                vacancyId[i].addEventListener("click",function(){
           	                
							if(vacancyId[i].style.background!="yellow"){
	       		                if(vacancyId[i].style.background==''){
	       		                    vacancyId[i].style.background="black";
	       		                    retainedId.push(i);
	       		                }else{
	       		                    vacancyId[i].style.background=""
	       		                    retainedId.splice(retainedId.indexOf(i),1)
	       		                }
							}       		                
       	            	})
                	}
         	       document.getElementById("title").innerHTML = hall.hallName;
                }

                var send = document.getElementById("send");
                send.onclick = function() {
        			xhr.open("POST","<c:url value='/arrangeModifyHall.controller'/>",true);
        			var jsonHall = {
                		"hallId":hall.hallId,
        				"vacancyIds":retainedId
        				}
        			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        			xhr.send(JSON.stringify(jsonHall));
        			alert("修改成功");
        		}
            }
        }
</script>
</head>
<body>
    <div style="width: 80%;margin: 0 auto;">
        <h2 style="text-align: center;" id="title"></h2>
        <a href="<c:url value='/arrangeHallMain.controller'/>" style="margin: auto;">管理頁面</a>
        <hr>
        <p style="background-color: grey;width: 50%;height: 30px;margin: auto;text-align: center;">螢幕</p>
        <table style="margin: auto;" id="seat"></table>
        <br>
        <div style="text-align: center;">
            <button type="button" id="send">修改</button>
        </div>
        <jsp:include page="../administrator/footerback.jsp"></jsp:include> 
    </div>
</body>
</html>