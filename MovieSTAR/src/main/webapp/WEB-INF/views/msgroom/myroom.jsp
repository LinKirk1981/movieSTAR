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
                    <li><a style="font-size: 20px;" href="<c:url value="/msgRoom" />">會員中心</a></li>
                    <li style="font-size: 30px;">聊天室</li>
                </ul>
                <ul class="go-home">
<%--                 	<li><a href="<c:url value="/tt"/>">測試業面</a></li>  --%>
                    <li><a style="font-size: 20px;" href="<c:url value="./"/>">返回</a></li>            
                </ul>
            </div>
        </div>
       			
			
<div class="main page-template" >
  <div class="inner-page">
      <div class="container">
		<div class="comment-area">
         <div class="row" >		
					<marquee direction="right"  scrollamount="5" style="color: #1bf717;">				
					<h1><img src="https://media4.giphy.com/media/nR4L10XlJcSeQ/giphy.gif?cid=ecf05e47uskgjv9ndbn92cg1oaezidqn5qibopa9m6glxfu2&rid=giphy.gif" style="width:50px;height:50px;">
					歡迎來到聊天室
					<img src="https://media4.giphy.com/media/nR4L10XlJcSeQ/giphy.gif?cid=ecf05e47uskgjv9ndbn92cg1oaezidqn5qibopa9m6glxfu2&rid=giphy.gif" style="width:50px;height:50px;"></h1>
					
					</marquee>
<div style="float:right">	

		<div class="buttons">
		<div style="background-color:#016550;width:400px;height:730px;">    
			<div style="background-color:#016550;height:30px;"><h2 style="color: white;">
			<img src="https://live.staticflickr.com/27/94690517_c2f91be963.jpg" style="width:50px;height:50px;">
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;廣場聊天室</span></h2></div><br>			
			<div style="overflow:hidden;overflow-y:scroll;width:400px;height:600px;background-color: #ccc7c7;">
			<div id="myroom"></div>
			</div>		
				
				<%if (session.getAttribute("displayusername")!=null){ %>
				<input type="hidden" id="account" name="account" value= "${displayusername}" />	
				<input type="hidden" id="my" value="my" />
				<%}else{ %>
				<input type="hidden" id="account" name="account" value= "訪客" />
				<input type="hidden" id="my" value="訪客" />
				<% }%>				
				&nbsp;<input type="text"  id="content" size="40"  style="background-color: rgb(68, 64, 64); color: white;border-radius:30px;" placeholder="請勿違反站規" required />									
				<input type="hidden" id="room"  value= "1" />						  					
				<button type="button" id="msgAll" onclick="send()" class="btn btn-buttons">送出</button>												
				<center><a href="<c:url value="./"/>" onclick="delroom()"><button type="button" class="btn btn-buttons">離開聊天室</button></a></center>
			</div> 
		</div>
</div>

			<h1><br><b><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;☆最新熱門電影上映～～☆</a></b><br><br></h1>



		<div class="selebritie-list">
                                    <div class="col-lg-4 col-md-4 col-ms-6 col-xs-12 sm-width">
                                        <div class="selebritie-img">
                                            <img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20210219012.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-ms-6 col-xs-12 sm-width">
                                        <div class="row">
                                            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                                <div class="selebritie-contetn animation">
                                                    <a href="">波麗萊多里鬼屋</a>
                                                    <p>有些房子，根本不該入住…改編自1930年代英國真實事件，一位牧師萊納斯（約翰赫夫南 飾演）被教會任命為代理牧師，他帶著妻子瑪麗安（潔西卡布朗芬德莉 飾演）與女兒小愛搬進一座神秘莊園。但在他們入住這間屋子不久後，奇怪事情接二連三發生….
                                                    </p>
                                                    <div class="social-links">
                                                        <strong class="animation">Share :</strong>
                                                        <a href="" class="socila-fb"><span class="fa fa-facebook"></span></a>
                                                        <a href="" class="socila-tw"><span class="fa fa-twitter"></span></a>
                                                        <a href="" class="socila-sk"><span class="fa fa-skype"></span></a>
                                                        <a href="" class="socila-pin"><span class="fa fa-pinterest"></span></a>
                                                        <a href="" class="socila-ins"><span class="fa fa-instagram"></span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							<div class="selebritie-list">
                                    <div class="col-lg-8 col-md-8 col-ms-6 col-xs-12 sm-width">
                                        <div class="row">
                                            <div class="col-lg-offset-3 col-md-offset-3 col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                                <div class="selebritie-contetn animation text-right">
                                                    <a href="">鳴鳥不飛：DONT STAY GOLD</a>
                                                    <p>劇情簡介ABOUT THE STORY


成為醫生後的「影山」，某次跟黑道老大「矢代」會面時，邂逅了剛從感化院出來、有「狂犬」之稱的小混混「久我」；又因為某些原因，影山收留了久我。然而影山有個不為人知的性癖，就是會對燙傷的痕跡癡迷不已。當兩人展開同居生活，面對滿身傷痕的久我，對他主動親密接觸的同時，影山是否將會情陷於久我的誘惑當中？</p>
                                                    <div class="social-links">
                                                        <strong class="animation">Share :</strong>
                                                        <a href="" class="socila-fb"><span class="fa fa-facebook"></span></a>
                                                        <a href="" class="socila-tw"><span class="fa fa-twitter"></span></a>
                                                        <a href="" class="socila-sk"><span class="fa fa-skype"></span></a>
                                                        <a href="" class="socila-pin"><span class="fa fa-pinterest"></span></a>
                                                        <a href="" class="socila-ins"><span class="fa fa-instagram"></span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-ms-6 col-xs-12 sm-width">
                                        <div class="selebritie-img">
                                            <img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20210309005.jpg" alt="">
                                        </div>
                                    </div>
                                </div>

                    
           
                      

<script type="text/javascript">
//顯示電影下的文章
window.onload = function(){
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
				//沒登入
// 				if('${displayusername}' == ''){					
// 					if(myroom.my == '訪客'){
// // 					fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"
// 					fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'></span>"+ myroom.rtime +"</h2>"
// 						+ "<div><h3><span style='border-radius:30px;background-color:rgb(169 173 173);'>&nbsp;" + myroom.content+ "&nbsp;</span>&nbsp;&nbsp;</h3></div></div>"					
// // 					}else if(myroom.admin == '會員'){//寫死
// // 							fa	+= "<h2><span style='color:#13be13'>"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
// // 								+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;"
// // 								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
// 					}else if(myroom.admin !=null){
// 					fa	+= "<h2><span style='color:red'><img src='http://images4.fanpop.com/image/photos/22100000/The-letter-the-alphabet-22187447-2560-2560.jpg' style='width:50px;height:50px;'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
// 						+ "<div><h3 style='margin: 10px 0'>&nbsp;&nbsp;<span style='border-radius:30px;background-color:rgb(169 173 173);'>" + myroom.content + "</span></h3></div>"
// 						}else if(myroom.my != null){
// 							fa	+= "<div><h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>"
// 							+ "(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
// // 							+ "<div style='border-radius:30px;width:ayto;width:auto;'>&nbsp;"
// 							+ "<span white-space: normal;  style ='  background-color:rgb(169 173 173); ' >&nbsp;" + myroom.content + "&nbsp;</span>&nbsp;</div>"
// // 							</div>"					
// 						}
					//沒登入
					if('${displayusername}' == ''){					
						if(myroom.my == '訪客'){
// 							fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"						
							fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'></span>我-"+ myroom.rtime +"</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div></div>"								 					
						}else if(myroom.admin == '會員'){//寫死
							fa	+= "<h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"	
						}else if(myroom.admin !=null){
							fa	+= "<h2><span style='color:red'><img src='http://images4.fanpop.com/image/photos/22100000/The-letter-the-alphabet-22187447-2560-2560.jpg' style='width:50px;height:55px;'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
							}else if(myroom.my != null){
								fa	+= "<div><h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>"
								+ "(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"					
							}
					//登入
				}else{
					if(myroom.my == '訪客'){
						fa	+= "<div><h2><span style='color:#3d423d'><img src='https://img.ixintu.com/download/jpg/20201022/443ba57c008d5d4edf05c4db136234f2_512_512.jpg!bg' style='width:50px;height:55px;'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"
							+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div></div>"											
						}else if(myroom.admin == '會員'){//寫死
							fa	+= "<h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"		
						}else if(myroom.admin !=null){
							fa	+= "<h2><span style='color:red'><img src='http://images4.fanpop.com/image/photos/22100000/The-letter-the-alphabet-22187447-2560-2560.jpg' style='width:50px;height:55px;'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
							}else if(myroom.my != null){
// 								fa	+= "<div style='text-align:right;'><h2><span style='color:#13be13'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
								fa	+= "<div style='text-align:right;'><h2>我-"+ myroom.rtime + "</h2>"							
								+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;"
								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"					
							}
				}
			}
				document.getElementById("myroom").innerHTML = fa;
		}
	}
	//無限ajax
	var t1 = window.setInterval("see()",3000);
}
//離開聊天室
// 	function delroom(){
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("post","<c:url value='/delRoom.controller' />",true);
// 	xhr.send();
// 	xhr.onreadystatechange = function(){
// 		if(xhr.readyState == 4 && xhr.status == 200){
// 			var forums = JSON.parse(xhr.responseText);

// 		}		
// 	}
// }

//聊天+查詢
	function send(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/saveRoom.controller' />",true);
		var jsonmsgfather = {
				"account":document.getElementById("account").value,							
				"content":document.getElementById("content").value,				
				"room":document.getElementById("room").value,
				"my":document.getElementById("my").value
				
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
						//沒登入
						if('${displayusername}' == ''){					
							if(myroom.my == '訪客'){
//	 							fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"						
								fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'></span>我-"+ myroom.rtime +"</h2>"
									+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div></div>"								 					
	 						}else if(myroom.admin == '會員'){//寫死
	 							fa	+= "<h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
	 								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
	 								+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"	
							}else if(myroom.admin !=null){
								fa	+= "<h2><span style='color:red'><img src='http://images4.fanpop.com/image/photos/22100000/The-letter-the-alphabet-22187447-2560-2560.jpg' style='width:50px;height:55px;'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
									+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
									+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
								}else if(myroom.my != null){
									fa	+= "<div><h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>"
									+ "(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
									+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
									+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"					
								}
						//登入
					}else{
						if(myroom.my == '訪客'){
							fa	+= "<div><h2><span style='color:#3d423d'><img src='https://img.ixintu.com/download/jpg/20201022/443ba57c008d5d4edf05c4db136234f2_512_512.jpg!bg' style='width:50px;height:55px;'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"
								+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div></div>"											
							}else if(myroom.admin == '會員'){//寫死
								fa	+= "<h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
									+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
									+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"		
							}else if(myroom.admin !=null){
								fa	+= "<h2><span style='color:red'><img src='http://images4.fanpop.com/image/photos/22100000/The-letter-the-alphabet-22187447-2560-2560.jpg' style='width:50px;height:55px;'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
									+ "<div style='border-radius:30px;background-color:rgb(218 218 218);width:auto;'>&nbsp;"
									+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
								}else if(myroom.my != null){
//	 								fa	+= "<div style='text-align:right;'><h2><span style='color:#13be13'>(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
									fa	+= "<div style='text-align:right;'><h2>我-"+ myroom.rtime + "</h2>"							
									+ "<div style='border-radius:30px;background-color:rgb(153 194 197);width:auto;'>&nbsp;"
									+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"					
								}
						//沒登入
// 						if('${displayusername}' == ''){					
// 							if(myroom.my == '訪客'){
// 							fa	+= "<div style='text-align:right;'><h2><span style='color:#3d423d'></span>"+ myroom.rtime +"</h2>"
// 									+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div></div>"								 					
// 								}else if(myroom.admin !=null){
// 								fa	+= "<h2><span style='color:red'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
// 									+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;"
// 									+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
// 									}else if(myroom.my != null){
// 										fa	+= "<div><h2><span style='color:#13be13'><img src='https://thumbs.dreamstime.com/b/%E5%AD%97%E6%AF%8Dm-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E4%B8%8A-%E8%93%9D%E8%89%B2%E7%81%AB%E7%84%B0%E5%9C%A8%E9%BB%91%E8%89%B2%E5%AD%A4%E7%AB%8B%E8%83%8C%E6%99%AF%E4%B8%8A%EF%BC%8C%E5%85%B7%E6%9C%89%E9%80%BC%E7%9C%9F%E7%9A%84%E7%81%AB%E7%84%B0%E6%95%88%E6%9E%9C%E5%92%8C%E7%81%AB%E8%8A%B1-%E5%AD%97%E6%AF%8D%E9%9B%86%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86-157762892.jpg' style='width:50px;height:55px;'>"
// 										+ "(會員)"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
// 										+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;"
// 										+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"					
// 									}
// 								//登入
// 							}else{
// 								if(myroom.my == '訪客'){
// 									fa	+= "<div><h2><span style='color:#3d423d'><img src='https://img.ixintu.com/download/jpg/20201022/443ba57c008d5d4edf05c4db136234f2_512_512.jpg!bg' style='width:50px;height:55px;'>"+ myroom.account +"</span>-"+ myroom.rtime +"</h2>"
// 										+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;<h3>&nbsp;" + myroom.content+ "&nbsp;</h3>&nbsp;</div></div>"											
// 									}else if(myroom.admin !=null){
// 									fa	+= "<h2><span style='color:red'>【官方】"+ myroom.account +"</span>-"+ myroom.rtime + "</h2>"
// 										+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;"
// 										+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div>"
// 										}else if(myroom.my != null){
// 										fa	+= "<div style='text-align:right;'><h2>"+ myroom.rtime + "</h2>"							
// 											+ "<div style='border-radius:30px;background-color:rgb(169 173 173);width:auto;'>&nbsp;"
// 											+ "<h3>&nbsp;" + myroom.content + "&nbsp;</h3>&nbsp;</div></div>"					
// 										}
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