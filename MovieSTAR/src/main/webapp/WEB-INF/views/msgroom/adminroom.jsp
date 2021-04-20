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
                    <li><a style="font-size: 20px;" href="<c:url value="/msgAdminRoom" />">會員中心</a></li>
                    <li><a style="font-size: 20px;" href="<c:url value="/msgRoom" />">聊天室</a></li>
                    <li style="font-size: 30px;">官方聊天室</li>
                </ul>
                <ul class="go-home">
                    <li><a style="font-size: 20px;" href="<c:url value="./"/>">返回</a></li> 
<%--                    <li>  <a href="<c:url value="/123"/>">hhhhh</a>  </li>           --%>
                </ul>
            </div>
        </div>
<div class="main page-template" >
  <div class="inner-page">
      <div class="container">
		<div class="comment-area">
         <div class="row" >		
         	<marquee direction="right"  scrollamount="5" style="color: #1bf717;" behavior="alternate"><h1>★☆最熱門電影預告片!~~~☆★</h1></marquee>
       			<iframe width="650" height="500" src="https://www.youtube.com/embed/s1DUC_wBUvY"  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			
					
			
			
			<div style="float:right">	

		<div class="buttons">
		<div style="background-color:#016550;width:400px;height:728px;">    
			<div style="background-color:#016550;height:30px;"><h2 style="color: white;">
			<img src="https://i.pinimg.com/originals/19/88/b9/1988b9193a59703291edf2381219081a.jpg" style="width:50px;height:55px;">
			<span style="color:#f1de00;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方廣場聊天室&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://i.pinimg.com/originals/19/88/b9/1988b9193a59703291edf2381219081a.jpg" style="width:50px;height:55px;">
			</span></h2></div><br>
					
			<div style="overflow:hidden;overflow-y:scroll;width:400px;height:600px;background-color: #ccc7c7;">
			<div id="myroom">		
				</div>
			</div>		
						
				<input type="hidden" id="account" name="account" value= "${displayusername}" />	
								
				&nbsp;<input type="text"  id="content" size="40"  style="background-color: rgb(68, 64, 64); color: white;border-radius:30px;" placeholder="請勿違反站規" required />									
				<button type="button" id="msgAll" onclick="send()" class="btn btn-buttons">送出</button>												
				<select id="admin" width="300" style="width: 100px">
						  <option selected disabled>選擇您的身份</option>
						  <option value="admin" >管理者</option>						  
						  <option value="會員" >會員</option>
				</select>
				<input type="hidden" id="room"  value= "1" />						  					
				<center><a href="<c:url value="./"/>"><button type="button" class="btn btn-buttons">離開聊天室</button></a>
				<a  onclick="delroom()"><button type="button" class="btn btn-buttons">清空聊天室</button></a></center>
				
			</div> 
		</div>
</div>
			
							
<div id="AllForum"></div>


<script type="text/javascript">
//顯示電影下的文章
window.onload = function(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/msgRoom.controller' />",true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var myrooms = JSON.parse(xhr.responseText);			
					var fa = ""
					for(i = 0; i<myrooms.length; i++){
						var myroom = myrooms[i] 		
					
						if(myroom.my == '訪客'){
						fa	+= "<h2><span style='color:#3d423d'><img src='https://img.ixintu.com/download/jpg/20201022/443ba57c008d5d4edf05c4db136234f2_512_512.jpg!bg' style='width:50px;height:55px;'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div>"					
						}else if(myroom.admin == '會員'){
							fa	+= "<div style='text-align:right;'><h2><span style='color:#039a03'></span>我-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"
						}else if(myroom.admin !=null){
							fa	+= "<div style='text-align:right;'><h2><span style='color:red'>【官方】</span>我-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"
						}else if(myroom.my != null){
							fa	+= "<h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
							
						}
							

					}
						document.getElementById("myroom").innerHTML = fa;
				}
			}
	//無限ajax
	var t1 = window.setInterval("see()",3000);
}
//離開聊天室
	function delroom(){
	var xhr = new XMLHttpRequest();
	xhr.open("post","<c:url value='/delRoom.controller' />",true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var forums = JSON.parse(xhr.responseText);

		}		
	}
	see()
}

//聊天+查詢
	function send(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/saveRoom.controller' />",true);
		var jsonmsgfather = {
				"account":document.getElementById("account").value,							
				"content":document.getElementById("content").value,				
				"room":document.getElementById("room").value,
				"admin":document.getElementById("admin").value
				
		}

		xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr.send(JSON.stringify(jsonmsgfather));
		
		var c1 = document.getElementById("content");
		c1.value ="";
		see()
		
}
	function see(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/msgRoom.controller' />",true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var myrooms = JSON.parse(xhr.responseText);
				console.log( myrooms )
					var fa = ""
					for(i = 0; i<myrooms.length; i++){
						var myroom = myrooms[i] 		
					
						if(myroom.my == '訪客'){
						fa	+= "<h2><span style='color:#3d423d'><img src='https://img.ixintu.com/download/jpg/20201022/443ba57c008d5d4edf05c4db136234f2_512_512.jpg!bg' style='width:50px;height:55px;'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"
							+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div>"					
						}else if(myroom.admin == '會員'){
							fa	+= "<div style='text-align:right;'><h2><span style='color:#039a03'></span>我-"+ myroom.rtime + "</h2>"
							+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;"
							+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"
						}else if(myroom.admin !=null){
						fa	+= "<div style='text-align:right;'><h2><span style='color:red'>【官方】</span>我-"+ myroom.rtime + "</h2>"
							+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;"
							+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"
							}else if(myroom.my != null){
								fa	+= "<h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
							
						}

					}
						document.getElementById("myroom").innerHTML = fa;
				}
			}
		console.log(1)
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