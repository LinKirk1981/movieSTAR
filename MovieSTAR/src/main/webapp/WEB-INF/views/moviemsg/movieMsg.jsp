<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style type="text/css">
A.class1 {color:#ffffff;}
A.class1:hover  {text-decoration: none; color: rgb(0 236 40);}
</style>
</head>
<div class="comment-area" style='background-color: #0c0b0c9e;'>

<div id='allMSG' ></div>
<nav aria-label="navigations" align="center">
    <ul class="pagination"></ul>
</nav>
                                        <!-- COMMENT RESPOND -->
                                        <div class="comment-respond">
                                        <br><br>
                                            <h2 class="title">我要留言</h2>

                                           <%if (session.getAttribute("displayusername")!=null){ %>
                                            <div class="respons-box">
                                                <div class="form">
                                                    <form>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                <h3>
                                                                          <label >會員 : <a href="<c:url value="/profiles"/>"><span style="color: rgb(0 236 40)">${displayusername}</span></a></label>
                                                                          
                                                                    <input id="account" class="form-control form-mane" type="hidden" value= "${displayusername}" required>
<%--                                                                     <input type="text" id="account" name="account" value= "${displayusername}"/>${displayusername} --%>
                                                                </h3>
                                                                </div>																		
                                                            </div>
                                                             <div class="col-md-6">
                                                                <div class="form-group">
                                                                   <h3>
                                                                    <label>評分 :</label>
                                                                    <div style="cursor: pointer;">
																	  <span id="1" onclick="mouseOnClick(this.id)" onmouseover="mouseOver(this.id)" onmouseout="mouseOut(this.id)" style="color: white;">☆</span>
																	  <span id="2" onclick="mouseOnClick(this.id)" onmouseover="mouseOver(this.id)" onmouseout="mouseOut(this.id)" style="color: white;">☆</span>
																	  <span id="3" onclick="mouseOnClick(this.id)" onmouseover="mouseOver(this.id)" onmouseout="mouseOut(this.id)" style="color: white;">☆</span>
																	  <span id="4" onclick="mouseOnClick(this.id)" onmouseover="mouseOver(this.id)" onmouseout="mouseOut(this.id)" style="color: white;">☆</span>
																	  <span id="5" onclick="mouseOnClick(this.id)" onmouseover="mouseOver(this.id)" onmouseout="mouseOut(this.id)" style="color: white;">☆</span>																	  
																	  <input type="hidden" id="mstar" name="mstar" value= "☆☆☆☆☆" />
                                                                      <a id="mstar1"  style="color:greenyellow"></a> 
																	  <a id="message" style="color: green;"></a>   
																	  <input type="hidden" id="statistic" name="mstar" value= "0" />                                                                  
																	  
                                                              		</h3>
                                                                    </div>
                                                                  																 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <h3><label for="mcontent">留言內容 :</label></h3>
                                                            <textarea id="mcontent" class="form-control form-comment" cols="10" rows="8" name="mcomment" style="color:  #0be01d; background-color: rgb(66, 66, 66);" required></textarea>
                                                        </div>
                                                        <div class="buttons">                                                        
                                                        	<input type="hidden" id="mreport" name="mreport" value= "無" />
                                                        	<input type="hidden" id="mdel" name="mdel" value= "0" />
                                                        	<input type="hidden" id="mmovie" name="mmovie" value= "${movie.movieName}" />
                                                            <button type="button" id="msgAll" onclick="send()" class="btn btn-buttons">送出</button>&nbsp;&nbsp;
                                                            <button type="button"  onclick="fast()" class="btn btn-buttons">一鍵輸入</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <%} else{%>
                                            	<h3 class='comment-title' style="color: white"><a href="${pageContext.request.contextPath}/loginMM">登入</a>後即可留言，歡迎討論劇情或分享心得。</h3>
                                            <%} %>
                                        </div>
                                        <!-- END COMMENT RESPOND -->
                                    </div>
                              
<script type="text/javascript">
var x =  ${movie.movieId};
console.log(x);
////顯示全部電影留言
//		window.onload = function(){
//			var xhr = new XMLHttpRequest();
//			xhr.open("GET","<c:url value='/showMovieMsg.controller' />?mmovie="+"${movie.movieName}"+,true);
//			xhr.send();
//			xhr.onreadystatechange = function(){
//				if(xhr.readyState == 4 && xhr.status == 200){
//					var msgs = JSON.parse(xhr.responseText);
//						var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
//									 +	"<span style='cursor: pointer;'>"
//									 +       "<a class='class1' onclick='star()'>評分</a>&nbsp;&nbsp;"
//									 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
//									 +       "<a class='class1' onclick='newtime()'>發表時間</a>"
//									 +	"</span>"
//									 + "</h3>";
//						for(i = 0; i<msgs.length; i++){
//							var msg = msgs[i]
//							reportMsg = "<c:url value='/reportMsg/' />";
//							msgMovie += "<ol class='comment-list'>" 
//			                      +  "<li class='single-comment'>"
//			                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
//			                      +  "<div class='comment-img'>"
//			                      if( msg.account == '會員'){
//			                    	  msgMovie += "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
//			                      }else if( msg.account == '林先生'){
//			                    	  msgMovie +=  "<img src='https://img.ltn.com.tw/Upload/news/600/2021/04/11/phpUxsOGp.jpg'>"  
//			                      }else  {
//			                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
//			                      }                   
//			                     msgMovie +=  "</div>"                 
//					                      +  "<div class='comment-content'>"
//					                      +  "<div class='comment-header'>"
//					                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
//					                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
//					                      +  "</div><br>"
//					                      +  "<h3>" + msg.mcontent + "</h3><br>"
//					                      +  "<div class='blog-details-reply-box'>"	                      
//					                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
//										  +  "<div class='comment-reply'>"
//					    				  +  "<a href='" + reportMsg + msg.mid + "' class='Repost' >檢舉</a></h4>"
//					                      +  "</div>"
//					                      +  "</div>"
//					                      +  "</div>"	
//					                      +  "</div>"
//					                      +  "</li>" 
//					                   	  +	 "</ol>"	
	                 	  		                  
//						}
					
//							document.getElementById("allMSG").innerHTML = msgMovie;
//				} 
//			}
//		}
pageMsg(1);
//顯示全部電影留言+分頁
		 function pageMsg(indexPages){
			var xhr = new XMLHttpRequest();
			xhr.open("GET","<c:url value='/showMovieMsg.controller/' />"+"${movie.movieName}"+'/'+indexPages,true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var msgs = JSON.parse(xhr.responseText);
						var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
									 +	"<span style='cursor: pointer;'>"
									 +       "<a class='class1' onclick='star("+indexPages+")'>評分</a>&nbsp;&nbsp;"
									 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
									 +       "<a class='class1' onclick='newtime("+indexPages+")'>發表時間</a>"
									 +	"</span>"
									 + "</h3>";
						for(i = 0; i<msgs.length; i++){
							var msg = msgs[i]
							reportMsg = "<c:url value='/reportMsg/' />";
							msgMovie += "<ol class='comment-list'>" 
			                      +  "<li class='single-comment'>"
			                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
			                      +  "<div class='comment-img'>"
			                      if( msg.account == '會員'){
			                    	  msgMovie += "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
			                      }else if( msg.account == '林邱秋'){
			                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4Ss9Qhn63xLweZqw9EM2Ifahx9g0C-0Ajxxpg6InYJ_xsZR-1Rz1-nhjaFTGxTicmkU&usqp=CAU'>"  
			                      }else if ( msg.account == '馬高麗'){
			                    	  msgMovie +=  "<img src='https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'>" 		                    	  
			                      } else  if ( msg.account == '堂中青'){
			                    	  msgMovie +=  "<img src='http://n.sinaimg.cn/translate/20150925/tyIj-fxieyqm7655066.jpg'>" 		                    	  
			                      }  else  if ( msg.account == '黃冠雪'){
			                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
			                      }  else  if ( msg.account == '孫碧穗'){
			                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_gYdpcoWz5LGcVhnn162h8G2gr8AHnzfT7w&usqp=CAU'>" 		                    	  
			                      }  else if ( msg.account == '古志至') {
			                    	  msgMovie +=  "<img src='data:image/jpeg;base64,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'>" 		                    	  
			                      }   else  if ( msg.account == '魯天天'){
			                    	  msgMovie +=  "<img src='https://i.keaitupian.net/up/f9/92/25/cea9432deff142d2d85c9a8a5f2592f9.jpg'>" 		                    	  
			                      }  else if ( msg.account == '林先生') {
			                    	  msgMovie +=  "<img src='https://i02piccdn.sogoucdn.com/8b6a98f0af5c583b'>" 		                    	  
			                      }   else  if ( msg.account == '趙方怡'){
			                    	  msgMovie +=  "<img src='https://i01piccdn.sogoucdn.com/47274abeb9784d99'>" 		                    	  
			                      }   else if ( msg.account == '張學習') {
			                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
			                      }   else  if ( msg.account == '唐納·川普'){
			                    	  msgMovie +=  "<img src='https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2020/11/21/4/9115826.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600'>" 		                    	  
			                      }   else  if ( msg.account == '王曉目'){
			                    	  msgMovie +=  "<img src='https://p0.ssl.img.360kuai.com/t01eda6a7c1d8eb6ca1.jpg?size=1000x882'>" 		                    	  
			                      }   else  if ( msg.account == '鎖馨桐'){
			                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
			                      }   else  if ( msg.account == '山中青'){
			                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_cu6w9XNzuh9MEJ-6zn2LWlayJBIHCsTX0Q&usqp=CAU'>" 		                    	  
			                      }   else  {
			                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
			                      }  
			                      
			                      
			                     msgMovie +=  "</div>"                 
					                      +  "<div class='comment-content'>"
					                      +  "<div class='comment-header'>"
					                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
					                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
					                      +  "</div><br>"
					                      +  "<h3>" + msg.mcontent + "</h3><br>"
					                      +  "<div class='blog-details-reply-box'>"	                      
					                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
										  +  "<div class='comment-reply'>"
					    				  +  "<a href='" + reportMsg + msg.mid +"/"+ x +"' class='Repost' >檢舉</a></h4>"
					                      +  "</div>"
					                      +  "</div>"
					                      +  "</div>"	
					                      +  "</div>"
					                      +  "</li>" 
					                   	  +	 "</ol>";	
						}
							document.getElementById("allMSG").innerHTML = msgMovie;
							pagesRowMM(indexPages);							
					
				} 
			}
		}
		
		   //印出頁數(橫列)
	        function pagesRowMM(indexPages){
	            var xhr = new XMLHttpRequest();
	            xhr.open('GET','<c:url value="/moviePagesCountRowMM.controller" />',true);
	            xhr.send();
	            xhr.onreadystatechange = function(){
	                if(xhr.readyState == 4 && xhr.status == 200){
	                		msg = JSON.parse(xhr.responseText);
	                    var pagesRowMM = '';
	                    	pagesRowMM = '<li class="page-item"><a class="page-link pagefirst" onclick=previousPageRow('+indexPages+')  style="cursor: pointer"><i class="fa fa-angle-left"></i></a></li>';
	                    for(let i = 0; i < msg; i++){
	                    	pagesRowMM += '<li class="page-item" ><a class="page-link" id=row'+(i+1)+' style="cursor: pointer" onclick=changeRow('+(i+1)+')>'+(i+1)+'</a></li>'
	                    }
	                    	pagesRowMM +='<li class="page-item"><a class="page-link lastpage" onclick=nextPageRow('+indexPages+') style="cursor: pointer"><i class="fa fa-angle-right"></i></a></li>';
						
	                    document.querySelector(".pagination").innerHTML =  pagesRowMM;
	                    document.getElementById("row"+indexPages).style="";
	                    document.getElementById("row"+indexPages).parentNode.setAttribute("class","page-item active");
	                   
	                }
	            }
	        }
		//換頁(數字鈕[橫列])
	        function changeRow(pageIndex){
	        	pageMsg(pageIndex);
	        }
	        //換頁(上一頁[橫列])
	        function previousPageRow(indexPages){
	            if(indexPages>1){
	            	changeRow(indexPages-1)
	            }
	        }
	        //換頁(下一頁[橫列])
	        function nextPageRow(indexPages){
	            if(indexPages<msg){
	            	changeRow(indexPages+1)
	            }
	        }
//一鍵輸入
function fast(){
	var a = document.getElementById("mcontent");
	a.value = "這部超好看 超推!!";
}

	//新增後顯示留言
	function send(){
		var xhr = new XMLHttpRequest();
		xhr.open("post","<c:url value='/movieMsgSave.controller'/>?mmovie="+"${movie.movieName}",true);
		var jsonmsgfather = {
				"account":document.getElementById("account").value,
				"mcontent":document.getElementById("mcontent").value,
				"mmovie":document.getElementById("mmovie").value,
				"mstar":document.getElementById("mstar").value,
				"statistic":document.getElementById("statistic").value,
				"mreport":document.getElementById("mreport").value,
				"mdel":document.getElementById("mdel").value
		}
		
		xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr.send(JSON.stringify(jsonmsgfather));
		Swal.fire({
			  icon: 'success',
			  title: '留言成功!',
			  showConfirmButton: false,
			  timer: 1500
			})
			
			var a = document.getElementById("mcontent");
			var b = document.getElementById("message");
			var b = document.getElementById("mstar");
			var b = document.getElementById("mstar1");
			
			a.value = "";
			b.innerHTML = "";
		
		
		
	}
	//星星
    function mouseOver(mstar) {
        for(let i = 1 ; i <= parseInt(mstar) ; i ++){
            document.getElementById(i).innerHTML = "★";
            document.getElementById("message").innerHTML = "打分中..." + i;
     
        }

        document.getElementById("mstar").innerHTML = "";
     
    }

    function mouseOut(mstar) {
        for(let i = 1 ; i <= parseInt(mstar) ; i ++)
            document.getElementById(i).innerHTML = "☆";
        	
    }

    function mouseOnClick(mstar){
        document.getElementById("message").innerHTML = "感謝您的評分";

        
        switch(parseInt(mstar)){
        case 1:
            document.getElementById("mstar").value = "★☆☆☆☆";
            document.getElementById("mstar1").innerHTML = "您給了一顆星";
            document.getElementById("statistic").value = 1;
            
            break;
        case 2:
            document.getElementById("mstar").value = "★★☆☆☆";
            document.getElementById("mstar1").innerHTML = "您給了二顆星";
            document.getElementById("statistic").value = 2;
            break;
        case 3:
            document.getElementById("mstar").value = "★★★☆☆";
            document.getElementById("mstar1").innerHTML = "您給了三顆星";
            document.getElementById("statistic").value = 3;
            break;
        case 4:
            document.getElementById("mstar").value = "★★★★☆";
            document.getElementById("mstar1").innerHTML = "您給了四顆星";
            document.getElementById("statistic").value = 4;
            break;
        case 5:
            document.getElementById("mstar").value = "★★★★★";
            document.getElementById("mstar1").innerHTML = "您給了五顆星";
            document.getElementById("statistic").value = 5;
            break;
        default :
            document.getElementById("mstar").value = "☆☆☆☆☆";
        	document.getElementById("statistic").value = 0;
        }
        
    }
    //d
// 	function a(){
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET","<c:url value='/showMovieMsg.controller/' />"+"${movie.movieName}"+'/'+indexPages,true);
// 		xhr.send();
// 		xhr.onreadystatechange = function(){
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var msgs = JSON.parse(xhr.responseText);
// 					var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
// 						 +	"<span style='cursor: pointer;'>"
// 						 +       "<a class='class1' onclick='star()'>評分</a>&nbsp;&nbsp;"
// 						 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
// 						 +       "<a class='class1' onclick='newtime()'>發表時間</a>"
// 						 +	"</span>"
// 						 + "</h3>";
// 					for(i = 0; i<msgs.length; i++){
// 						var msg = msgs[i]
// 						reportMsg = "<c:url value='/reportMsg/' />";
// 						msgMovie += "<ol class='comment-list'>" 
// 		                      +  "<li class='single-comment'>"
// 		                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
// 		                      +  "<div class='comment-img'>"
// 		                      +  "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
//                               +  "</div>"                 
// 		                      +  "<div class='comment-content'>"
// 		                      +  "<div class='comment-header'>"
// 		                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
// 		                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
// 		                      +  "</div><br>"
// 		                      +  "<h3>" + msg.mcontent + "</h3><br>"
// 		                      +  "<div class='blog-details-reply-box'>"	                      
// 		                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
// 							  +  "<div class='comment-reply'>"
// 		    				  +  "<a href='" + reportMsg + msg.mid + "' class='Repost' >檢舉</a></h4>"
// 		                      +  "</div>"
// 		                      +  "</div>"
// 		                      +  "</div>"	
// 		                      +  "</div>"
// 		                      +  "</li>" 
// 		                   	  +	 "</ol>"
                 	  		                  
// 					}
				
// 						document.getElementById("allMSG").innerHTML = msgMovie;
// 						pagesRowMM(indexPages);	
// 			} 
// 		}
// 	}
	
	//顯示最新留言
	 function newtime(indexPages){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/showNewTimeMsg.controller/' />"+"${movie.movieName}"+'/'+indexPages,true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var msgs = JSON.parse(xhr.responseText);
					var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
								 +	"<span style='cursor: pointer;'>"
								 +       "<a class='class1' onclick='star("+indexPages+")'>評分</a>&nbsp;&nbsp;"
								 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
								 +       "<a class='class1' onclick='oldtime("+indexPages+")'>發表時間&nbsp;▲&nbsp;(最新留言)</a>"
								 +	"</span>"
								 + "</h3>";
					for(i = 0; i<msgs.length; i++){
						var msg = msgs[i]
						reportMsg = "<c:url value='/reportMsg/' />";
						msgMovie += "<ol class='comment-list'>" 
		                      +  "<li class='single-comment'>"
		                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
		                      +  "<div class='comment-img'>"
// 		                      +  "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
		                      if( msg.account == '會員'){
		                    	  msgMovie += "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
		                      }else if( msg.account == '林邱秋'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4Ss9Qhn63xLweZqw9EM2Ifahx9g0C-0Ajxxpg6InYJ_xsZR-1Rz1-nhjaFTGxTicmkU&usqp=CAU'>"  
		                      }else if ( msg.account == '馬高麗'){
		                    	  msgMovie +=  "<img src='https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'>" 		                    	  
		                      } else  if ( msg.account == '堂中青'){
		                    	  msgMovie +=  "<img src='http://n.sinaimg.cn/translate/20150925/tyIj-fxieyqm7655066.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '黃冠雪'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '孫碧穗'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_gYdpcoWz5LGcVhnn162h8G2gr8AHnzfT7w&usqp=CAU'>" 		                    	  
		                      }  else if ( msg.account == '古志至') {
		                    	  msgMovie +=  "<img src='data:image/jpeg;base64,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'>" 		                    	  
		                      }   else  if ( msg.account == '魯天天'){
		                    	  msgMovie +=  "<img src='https://i.keaitupian.net/up/f9/92/25/cea9432deff142d2d85c9a8a5f2592f9.jpg'>" 		                    	  
		                      }  else if ( msg.account == '林先生') {
		                    	  msgMovie +=  "<img src='https://i02piccdn.sogoucdn.com/8b6a98f0af5c583b'>" 		                    	  
		                      }   else  if ( msg.account == '趙方怡'){
		                    	  msgMovie +=  "<img src='https://i01piccdn.sogoucdn.com/47274abeb9784d99'>" 		                    	  
		                      }   else if ( msg.account == '張學習') {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '唐納·川普'){
		                    	  msgMovie +=  "<img src='https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2020/11/21/4/9115826.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600'>" 		                    	  
		                      }   else  if ( msg.account == '王曉目'){
		                    	  msgMovie +=  "<img src='https://p0.ssl.img.360kuai.com/t01eda6a7c1d8eb6ca1.jpg?size=1000x882'>" 		                    	  
		                      }   else  if ( msg.account == '鎖馨桐'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '山中青'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_cu6w9XNzuh9MEJ-6zn2LWlayJBIHCsTX0Q&usqp=CAU'>" 		                    	  
		                      }   else  {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  
		                      msgMovie    +=  "</div>"                 
		                      +  "<div class='comment-content'>"
		                      +  "<div class='comment-header'>"
		                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
		                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
		                      +  "</div><br>"
		                      +  "<h3>" + msg.mcontent + "</h3><br>"
		                      +  "<div class='blog-details-reply-box'>"	                      
		                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
							  +  "<div class='comment-reply'>"
		    				  +  "<a href='" + reportMsg + msg.mid + "' class='Repost' >檢舉</a></h4>"
		                      +  "</div>"
		                      +  "</div>"
		                      +  "</div>"	
		                      +  "</div>"
		                      +  "</li>" 
		                   	  +	 "</ol>"	
                 	  		                  
					}
				
						document.getElementById("allMSG").innerHTML = msgMovie;
						pagesRowMM(indexPages);
			} 
		}
	}
	//顯示最舊留言
	 function oldtime(indexPages){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/showOldTimeMsg.controller/' />"+"${movie.movieName}"+'/'+indexPages,true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var msgs = JSON.parse(xhr.responseText);
					var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
								 +	"<span style='cursor: pointer;'>"
								 +       "<a class='class1' onclick='star("+indexPages+")'>評分</a>&nbsp;&nbsp;"
								 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
								 +       "<a class='class1' onclick='newtime("+indexPages+")'>發表時間&nbsp;▼&nbsp;(最舊留言)</a>"
								 +	"</span>"
								 + "</h3>";
					for(i = 0; i<msgs.length; i++){
						var msg = msgs[i]
						reportMsg = "<c:url value='/reportMsg/' />";
						msgMovie += "<ol class='comment-list'>" 
		                      +  "<li class='single-comment'>"
		                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
		                      +  "<div class='comment-img'>"
		                      if( msg.account == '會員'){
		                    	  msgMovie += "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
		                      }else if( msg.account == '林邱秋'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4Ss9Qhn63xLweZqw9EM2Ifahx9g0C-0Ajxxpg6InYJ_xsZR-1Rz1-nhjaFTGxTicmkU&usqp=CAU'>"  
		                      }else if ( msg.account == '馬高麗'){
		                    	  msgMovie +=  "<img src='https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'>" 		                    	  
		                      } else  if ( msg.account == '堂中青'){
		                    	  msgMovie +=  "<img src='http://n.sinaimg.cn/translate/20150925/tyIj-fxieyqm7655066.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '黃冠雪'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '孫碧穗'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_gYdpcoWz5LGcVhnn162h8G2gr8AHnzfT7w&usqp=CAU'>" 		                    	  
		                      }  else if ( msg.account == '古志至') {
		                    	  msgMovie +=  "<img src='data:image/jpeg;base64,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'>" 		                    	  
		                      }   else  if ( msg.account == '魯天天'){
		                    	  msgMovie +=  "<img src='https://i.keaitupian.net/up/f9/92/25/cea9432deff142d2d85c9a8a5f2592f9.jpg'>" 		                    	  
		                      }  else if ( msg.account == '林先生') {
		                    	  msgMovie +=  "<img src='https://i02piccdn.sogoucdn.com/8b6a98f0af5c583b'>" 		                    	  
		                      }   else  if ( msg.account == '趙方怡'){
		                    	  msgMovie +=  "<img src='https://i01piccdn.sogoucdn.com/47274abeb9784d99'>" 		                    	  
		                      }   else if ( msg.account == '張學習') {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '唐納·川普'){
		                    	  msgMovie +=  "<img src='https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2020/11/21/4/9115826.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600'>" 		                    	  
		                      }   else  if ( msg.account == '王曉目'){
		                    	  msgMovie +=  "<img src='https://p0.ssl.img.360kuai.com/t01eda6a7c1d8eb6ca1.jpg?size=1000x882'>" 		                    	  
		                      }   else  if ( msg.account == '鎖馨桐'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '山中青'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_cu6w9XNzuh9MEJ-6zn2LWlayJBIHCsTX0Q&usqp=CAU'>" 		                    	  
		                      }   else  {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  
		                      msgMovie    +=  "</div>"                 
		                      +  "<div class='comment-content'>"
		                      +  "<div class='comment-header'>"
		                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
		                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
		                      +  "</div><br>"
		                      +  "<h3>" + msg.mcontent + "</h3><br>"
		                      +  "<div class='blog-details-reply-box'>"	                      
		                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
							  +  "<div class='comment-reply'>"
		    				  +  "<a href='" + reportMsg + msg.mid + "' class='Repost' >檢舉</a></h4>"
		                      +  "</div>"
		                      +  "</div>"
		                      +  "</div>"	
		                      +  "</div>"
		                      +  "</li>" 
		                   	  +	 "</ol>"	
                 	  		                  
					}
				
						document.getElementById("allMSG").innerHTML = msgMovie;
						pagesRowMM(indexPages);
			} 
		}
	}
	
	//顯示電影最高評分 + 分頁 +++++++++++++++++++++++++++++
	 function star(indexPages){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/showStarMsg.controller/' />"+"${movie.movieName}"+'/'+indexPages,true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var msgs = JSON.parse(xhr.responseText);
					var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
								 +	"<span style='cursor: pointer;'>"
								 +       "<a class='class1' onclick='bad("+indexPages+")'>評分&nbsp;▲&nbsp;(最高評分)</a>&nbsp;&nbsp;"
								 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
								 +       "<a class='class1' onclick='newtime("+indexPages+")'>發表時間</a>"
								 +	"</span>"
								 + "</h3>";
					for(i = 0; i<msgs.length; i++){
						var msg = msgs[i]
						reportMsg = "<c:url value='/reportMsg/' />";
						msgMovie += "<ol class='comment-list'>" 
		                      +  "<li class='single-comment'>"
		                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
		                      +  "<div class='comment-img'>"
		                      if( msg.account == '會員'){
		                    	  msgMovie += "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
		                      }else if( msg.account == '林邱秋'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4Ss9Qhn63xLweZqw9EM2Ifahx9g0C-0Ajxxpg6InYJ_xsZR-1Rz1-nhjaFTGxTicmkU&usqp=CAU'>"  
		                      }else if ( msg.account == '馬高麗'){
		                    	  msgMovie +=  "<img src='https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'>" 		                    	  
		                      } else  if ( msg.account == '堂中青'){
		                    	  msgMovie +=  "<img src='http://n.sinaimg.cn/translate/20150925/tyIj-fxieyqm7655066.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '黃冠雪'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '孫碧穗'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_gYdpcoWz5LGcVhnn162h8G2gr8AHnzfT7w&usqp=CAU'>" 		                    	  
		                      }  else if ( msg.account == '古志至') {
		                    	  msgMovie +=  "<img src='data:image/jpeg;base64,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'>" 		                    	  
		                      }   else  if ( msg.account == '魯天天'){
		                    	  msgMovie +=  "<img src='https://i.keaitupian.net/up/f9/92/25/cea9432deff142d2d85c9a8a5f2592f9.jpg'>" 		                    	  
		                      }  else if ( msg.account == '林先生') {
		                    	  msgMovie +=  "<img src='https://i02piccdn.sogoucdn.com/8b6a98f0af5c583b'>" 		                    	  
		                      }   else  if ( msg.account == '趙方怡'){
		                    	  msgMovie +=  "<img src='https://i01piccdn.sogoucdn.com/47274abeb9784d99'>" 		                    	  
		                      }   else if ( msg.account == '張學習') {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '唐納·川普'){
		                    	  msgMovie +=  "<img src='https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2020/11/21/4/9115826.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600'>" 		                    	  
		                      }   else  if ( msg.account == '王曉目'){
		                    	  msgMovie +=  "<img src='https://p0.ssl.img.360kuai.com/t01eda6a7c1d8eb6ca1.jpg?size=1000x882'>" 		                    	  
		                      }   else  if ( msg.account == '鎖馨桐'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '山中青'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_cu6w9XNzuh9MEJ-6zn2LWlayJBIHCsTX0Q&usqp=CAU'>" 		                    	  
		                      }   else  {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  
		                      msgMovie    +=  "</div>"                 
		                      +  "<div class='comment-content'>"
		                      +  "<div class='comment-header'>"
		                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
		                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
		                      +  "</div><br>"
		                      +  "<h3>" + msg.mcontent + "</h3><br>"
		                      +  "<div class='blog-details-reply-box'>"	                      
		                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
							  +  "<div class='comment-reply'>"
		    				  +  "<a href='" + reportMsg + msg.mid + "' class='Repost' >檢舉</a></h4>"
		                      +  "</div>"
		                      +  "</div>"
		                      +  "</div>"	
		                      +  "</div>"
		                      +  "</li>" 
		                   	  +	 "</ol>"	
                 	  		                  
					}
				
						document.getElementById("allMSG").innerHTML = msgMovie;
						pagesRowMM(indexPages);	
			} 
		}
	}
	
	//顯示電影最低評分
	 function bad(indexPages){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/showBadMsg.controller/' />"+"${movie.movieName}"+'/'+indexPages,true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var msgs = JSON.parse(xhr.responseText);
					var msgMovie = "<h3><a style='color: rgb(0 236 40)'>排序:&nbsp;&nbsp;</a>"
								 +	"<span style='cursor: pointer;'>"
								 +       "<a class='class1' onclick='star("+indexPages+")'>評分&nbsp;▼&nbsp;(最低評分)</a>&nbsp;&nbsp;"
								 + 		 "<span style='color:#ffffff'>|</span>&nbsp;&nbsp;"
								 +       "<a class='class1' onclick='newtime("+indexPages+")'>發表時間</a>"
								 +	"</span>"
								 + "</h3>";
					for(i = 0; i<msgs.length; i++){
						var msg = msgs[i]
						reportMsg = "<c:url value='/reportMsg/' />";
						msgMovie += "<ol class='comment-list'>" 
		                      +  "<li class='single-comment'>"
		                      +  "<div class='comment-body' style='background-color: rgb(0 46 90 / 96%);'>" 
		                      +  "<div class='comment-img'>"
		                      if( msg.account == '會員'){
		                    	  msgMovie += "<img src='https://stickershop.line-scdn.net/stickershop/v1/product/1008584/LINEStorePC/main.png;compress=true'>"
		                      }else if( msg.account == '林邱秋'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4Ss9Qhn63xLweZqw9EM2Ifahx9g0C-0Ajxxpg6InYJ_xsZR-1Rz1-nhjaFTGxTicmkU&usqp=CAU'>"  
		                      }else if ( msg.account == '馬高麗'){
		                    	  msgMovie +=  "<img src='https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg'>" 		                    	  
		                      } else  if ( msg.account == '堂中青'){
		                    	  msgMovie +=  "<img src='http://n.sinaimg.cn/translate/20150925/tyIj-fxieyqm7655066.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '黃冠雪'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  else  if ( msg.account == '孫碧穗'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_gYdpcoWz5LGcVhnn162h8G2gr8AHnzfT7w&usqp=CAU'>" 		                    	  
		                      }  else if ( msg.account == '古志至') {
		                    	  msgMovie +=  "<img src='data:image/jpeg;base64,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'>" 		                    	  
		                      }   else  if ( msg.account == '魯天天'){
		                    	  msgMovie +=  "<img src='https://i.keaitupian.net/up/f9/92/25/cea9432deff142d2d85c9a8a5f2592f9.jpg'>" 		                    	  
		                      }  else if ( msg.account == '林先生') {
		                    	  msgMovie +=  "<img src='https://i02piccdn.sogoucdn.com/8b6a98f0af5c583b'>" 		                    	  
		                      }   else  if ( msg.account == '趙方怡'){
		                    	  msgMovie +=  "<img src='https://i01piccdn.sogoucdn.com/47274abeb9784d99'>" 		                    	  
		                      }   else if ( msg.account == '張學習') {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '唐納·川普'){
		                    	  msgMovie +=  "<img src='https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2020/11/21/4/9115826.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=800&exp=3600'>" 		                    	  
		                      }   else  if ( msg.account == '王曉目'){
		                    	  msgMovie +=  "<img src='https://p0.ssl.img.360kuai.com/t01eda6a7c1d8eb6ca1.jpg?size=1000x882'>" 		                    	  
		                      }   else  if ( msg.account == '鎖馨桐'){
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }   else  if ( msg.account == '山中青'){
		                    	  msgMovie +=  "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_cu6w9XNzuh9MEJ-6zn2LWlayJBIHCsTX0Q&usqp=CAU'>" 		                    	  
		                      }   else  {
		                    	  msgMovie +=  "<img src='https://c.files.bbci.co.uk/41CF/production/_109474861_angrycat-index-getty3-3.jpg'>" 		                    	  
		                      }  
		                      msgMovie    +=  "</div>"                 
		                      +  "<div class='comment-content'>"
		                      +  "<div class='comment-header'>"
		                      +  "<h4>發表人 : &nbsp;<a style='color:rgb(0 236 40)'>" + msg.account +"</a>"   
		                      +  "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 網友評分 : &nbsp;<a style='color:yellow'>" + msg.mstar +"</a></h4>"   
		                      +  "</div><br>"
		                      +  "<h3>" + msg.mcontent + "</h3><br>"
		                      +  "<div class='blog-details-reply-box'>"	                      
		                      +  "<h4><div class='comment-time'>發表時間 :&nbsp;" + msg.mtime + "</div>" 
							  +  "<div class='comment-reply'>"
		    				  +  "<a href='" + reportMsg + msg.mid + "' class='Repost' >檢舉</a></h4>"
		                      +  "</div>"
		                      +  "</div>"
		                      +  "</div>"	
		                      +  "</div>"
		                      +  "</li>" 
		                   	  +	 "</ol>"	
                 	  		                  
					}
				
						document.getElementById("allMSG").innerHTML = msgMovie;
						pagesRowMM(indexPages);
			} 
		}
	}

</script>
<%--  <jsp:include page="tail.jsp"></jsp:include>                               --%>