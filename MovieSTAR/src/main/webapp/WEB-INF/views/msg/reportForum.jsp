<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/css.jsp"></jsp:include>  
</head>
<body>
<jsp:include page="../user/nvigationBar.jsp"></jsp:include>
        <div class="breadcrumbs">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a style="font-size: 20px;" href="<c:url value="/"/>"><span class="fa fa-home"></span>首頁</a></li>
                    <li><a style="font-size: 20px;" href="<c:url value="/findForum" />">討論區</a></li>
                    <li><a style="font-size: 20px;" href="<c:url value="/saveForum?movie=${fm.fmovie}" />">${fm.fmovie}文章</a></li>
                    <li><a style="font-size: 20px;" href="<c:url value="/message/${fid}" />">留言版</a></li>
                    <li style="font-size: 30px;">檢舉文章</li>
                </ul>
                <ul class="go-home">
                    <li><a style="font-size: 20px;" href="<c:url value="../"/>">返回</a></li>
                </ul>
            </div>
        </div>
<div class="main page-template" >
  <div class="inner-page">
      <div class="container">
		<div class="comment-area">
         <div class="row" >        
<textarea rows="13" cols="150" id="freport"  placeholder="檢舉理由內容" style="background-color: rgb(68, 64, 64); color: #0be01d;" required ></textarea>
	
<div class="tag-category tag-1">
<ul>
<li><a class="tablinks" style="cursor: pointer;" type="button" onclick="ReportForum()">送出</a></li>
<li><a class="tablinks" style="cursor: pointer;" type="button" onclick="fast()">一鍵輸入</a></li>
<li><a class="tablinks" style="cursor: pointer;" type="button" onclick="hide(),seeforum()">查看文章</a></li>
</ul>
</div>
<div id="hide" style="display: none;">
<div class="alert alert-success"  role="alert" id="forum" style=' border:3px #0be01d solid;'></div>
</div>
<script type="text/javascript">
//點選展開
function hide(){
	if(document.getElementById('hide') .style.display=='none'){document.getElementById('hide') .style.display=''}
	else{document.getElementById('hide') .style.display='none'}
	}
	
	//修改
	function ReportForum(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/forumreport.controller' />",true);
		var report = {
				"fid":${fid},
				"freport":document.getElementById("freport").value
		}

		xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr.send(JSON.stringify(report));

		Swal.fire({
			  icon: 'success',
			  title: '檢舉成功!',
			  showConfirmButton: false,
			  timer: 1500
			}).then(function(){window.location.assign("http://localhost:8080/MovieSTAR/message/${fid}");})


	}
//一鍵輸入
function fast(){
	var c1 = document.getElementById("freport");
	c1.value = "據透";
}

//查看要檢舉的文章
function seeforum(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/showOneMsg.controller' />?fid=" +${fid},true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var msg = "<div class='buttons'>"
			var forumMsg = JSON.parse(xhr.responseText);
				reportForum = "<c:url value='/reportForum/' />";
				msg += "<h2><b>【" + forumMsg.tag +"】"+ forumMsg.article +"</b></h2>"
					+  "</h2><div><hr style='height: 1px;background-color:#0be01d'>"
					+  "<h2><span style='border:2px #0be01d solid;width: 85px;'>"
					+  "&nbsp;樓主&nbsp;</span>&nbsp;&nbsp;<a href='#'>" + forumMsg.account+"</a></h2><br>" 
					+  "<h3>" + forumMsg.content + "<br><br>"
					+  "<div style='text-align:right;'><div class='comment-time'>"
					+  "發表時間:&nbsp;&nbsp;"+forumMsg.ftime + "</div></div></h3></div>"
	
					document.getElementById("forum").innerHTML = msg;
			}
		}
	}	
	
</script>
				</div>
	 		</div>
	 	</div>
<jsp:include page="../user/footer.jsp"></jsp:include>     
	</div>
</div>		
</body>
</html>