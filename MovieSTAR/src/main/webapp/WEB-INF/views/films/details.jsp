<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
<jsp:include page="../administrator/cssback.jsp"></jsp:include> 
<jsp:include page="../administrator/topback.jsp"></jsp:include> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            padding: 0;
            margin: 10px 0;
        }

        td {
            border: 1px solid black;
            width: 20px;
            height: 20px;
            margin: 20px 0;
        }

        table {
            border-spacing: 10px;
        }
    </style>
    <script>
        window.onload = function () {
 
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "<c:url value='/arrangeConfirmHall.controller'/>", true);
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

                    var vacancyId = document.getElementsByClassName("vacancyId");
					var vacancyIds = hall.vacancyIds;
                    for (let i = 0; i < vacancyId.length; i++) {
        	                for (let j = 0; j < vacancyIds.length; j++) {
								if(i==vacancyIds[j]){
									vacancyId[i].style.border="none";
								}
							}
                	}
                }
            }
        }
    </script>
</head>

<body>
    <div style="width: 80%;margin:auto;">
        <p style="background-color: grey;width: 50%;height: 30px;margin: auto;text-align: center;">螢幕</p>
        <table style="margin: auto;" id="seat"></table>
    </div>
    <jsp:include page="../administrator/footerback.jsp"></jsp:include> 
</body>

</html>