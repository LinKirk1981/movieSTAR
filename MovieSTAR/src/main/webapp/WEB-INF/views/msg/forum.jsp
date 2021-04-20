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
                    <li style="font-size: 30px;">${movie.movieName}文章</li>
                </ul>
                <ul class="go-home">
                    <li><a style="font-size: 20px;" href="<c:url value="./"/>">返回</a></li>
<%--                     <li><a href="<c:url value="/bot" />">討論區</a></li> --%>
<%--                     <li><a href="<c:url value="/botadmin"/>">聊天室</a></li> --%>
<%--                 	<li><a href="<c:url value="/chatroom"/>">多人聊天室</a></li> --%>
                </ul>
            </div>
        </div>
<div class="main page-template" >
  <div class="inner-page">
      <div class="container">
		<div class="comment-area">
         <div class="row" >
<%if (session.getAttribute("displayusername")!=null){ %>
			 <h2 style="color:#0be01d"><b>${movie.movieName}</b></h2>			
			<ul class="breadcrumb" style="type:none;width:100%;text-align:right;">
				<li style="display: inline;">
					<a onclick="hide()" title="" style="cursor: pointer;" type="button">
					<h3 class="title">發表文章</h3></a>
				</li>
			</ul>			
				<div id="hide" style="display: none;">
					<div class="buttons">     
						<input type="hidden" id="account" name="account" value= "${displayusername}" />
						<select id="tag" width="300" style="width: 100px"> <!-- 標籤 -->
						    <option value="問題" selected>問題</option>
						    <option value="情報">情報</option>
						    <option value="心得">心得</option>
						    <option value="討論">討論</option>
						    <option value="閒聊">閒聊</option>
						    <option value="版規">版規</option>
						</select>
						<!-- 管理員才可使用以下選單 -->
						<select id="theme" width="300" style="width: 70px"> <!-- 分類 -->
						    <option value="一般">一般</option>
						    <option value="置頂">置頂</option>
							<option value="精華">精華</option>
						</select><br><br>
						<input type="text" id="article" name="article" placeholder="請輸入文章標題..." style="background-color: rgb(68, 64, 64);width: 1000px;color: #0be01d;" /><br><br>
				     <textarea rows="13" cols="150" id="content"  placeholder="文章內容" style="background-color: rgb(68, 64, 64); color: #0be01d;"	required ></textarea>
	
						<input type="hidden" id="fmovie" name="fmovie" value= "${movie.movieName}" /> 
						<input type="hidden" id="prestige" name="prestige" value= "0" />
						  <input type="hidden" id="freport" name="freport" value= "無" />
						  <input type="hidden" id="fdel" name="fdel" value= "0" />					
							<button type="button" id="msgAll" onclick="send()" class="btn btn-buttons">送出</button>&nbsp;&nbsp;
							<button type="button" id="fast" onclick="fast()" class="btn btn-buttons">一鍵輸入</button><br><br>
					</div>
				</div>
<% }else { %>

<h2 style="color:#0be01d">${movie.movieName}</h2>			
			<ul class="breadcrumb" style="type:none;width:100%;text-align:right;">
				<li style="display: inline;">
					<a onclick="hide()" title="" style="cursor: pointer;" type="button">
					<h3 class="title">發表文章</h3></a>
				</li>
			</ul>			
				<div id="hide" style="display: none;">
					<div class="buttons">     
						<input type="hidden" id="account" name="account" value="訪客" placeholder="請輸入暱稱" required style="background-color: rgb(68, 64, 64);color: #0be01d;" />
						
						<select id="tag"   style="width: 100px;"> <!-- 標籤 -->
						    <option value="問題" selected>問題</option>
						    <option value="情報">情報</option>
						    <option value="心得">心得</option>
						    <option value="討論">討論</option>
						    <option value="閒聊">閒聊</option>
						    <option value="版規" disabled>版規</option>
						</select><br><br>
						<input type="hidden" id="theme" name="theme" value= "一般" />
						<input type="text" id="article" name="article" placeholder="請輸入文章標題..." style="background-color: rgb(68, 64, 64);width: 1000px;color: #0be01d;" /><br><br>
				     <textarea rows="13" cols="150" id="content"  placeholder="文章內容" style="background-color: rgb(68, 64, 64); color: #0be01d;"	required ></textarea>
	
						<input type="hidden" id="fmovie" name="fmovie" value= "${movie.movieName}" /> 
						<input type="hidden" id="prestige" name="prestige" value= "0" />
						  <input type="hidden" id="freport" name="freport" value= "無" />
						  <input type="hidden" id="fdel" name="fdel" value= "0" />					
							<button type="button" id="msgAll" onclick="send()" class="btn btn-buttons">送出</button>&nbsp;&nbsp;
							<button type="button" id="fast" onclick="fast()" class="btn btn-buttons">一鍵輸入</button><br><br>
					</div>
				</div>
<% }%>
<div class="dec-review-meta"  style="border-radius:30px;background-color: rgba(182, 126, 4, 0.918); border:3px #0be01d solid;">
                            <ul>
                            	<li>
	                            	<a href="/MovieSTAR/saveForum?movie=${movie.movieName}"><center><h2>[版規] 電影討論區版規</h2><br>
	                            	<h4>發文者:&nbsp;管理員 &nbsp;&nbsp;回覆次數:&nbsp;0 &nbsp;&nbsp;發表時間:&nbsp;2021-04-05 03:04:00 </h4></center><br></a>
                            	</li>
							</ul>
							</div>
			
							
<div id="AllForum"></div>


<script type="text/javascript">
//點選展開
function hide(){
	if(document.getElementById('hide') .style.display=='none'){document.getElementById('hide') .style.display=''}
	else{document.getElementById('hide') .style.display='none'}
	}

//顯示電影下的文章
window.onload = function(){
var xhr = new XMLHttpRequest();
xhr.open("GET","<c:url value='/selectMovieForum.controller' />?fmovie="+"${movie.movieName}",true);
xhr.send();
xhr.onreadystatechange = function(){
	if(xhr.readyState == 4 && xhr.status == 200){
		var forums = JSON.parse(xhr.responseText);
// 			var fa = "<tr><td>會員</td><td>標籤</td><td>分類</td><td>文章主題</td><td>文章內容</td><td>電影</td><td>狀態</td><td>文章發表時間</td><td>檢舉內容</td><td>刪除</td></tr>"
			var fa = ''
			for(i = 0; i<forums.length; i++){
				var forum = forums[i] 
				MovieForum = "<c:url value='/findMovieForum/' />";
				showMessage = "<c:url value='/message/' />";
				if(forum.theme !="置頂" & forum.theme !="精華"){
// 				fa += "<tr><td>"+ forum.account +"</td>"
// 					+ "<td>"+ forum.tag +"</td>"
// 					+ "<td>"+ forum.theme +"</td>"
// 					+ "<td>"+ forum.article +"</td>"
// 					+ "<td>"+ forum.content +"</td>"
// 					+ "<td><a href='" + MovieForum + forum.fmovie +"'>"+ forum.fmovie +"</a></td>"
// 					+ "<td>"+ forum.prestige +"</td>"
// 					+ "<td>"+ forum.ftime +"</td>"
// 					+ "<td><a href='" + reportForum + forum.fid + "'>檢舉:" + forum.freport + "</a></td>"
// 					+ "<td>"+ forum.fdel +"</td></tr>"
				fa	+= " <div class='dec-review-meta'  style='border-radius:30px;background-color: rgba(1, 36, 65, 0.918); border:3px #0be01d solid;'>"
                	+ "<ul><li>"
                    + "<a href='" + showMessage + forum.fid +"'><center><h2>[" + forum.tag + "]&nbsp;" + forum.article + "</h2><br>"
                    + "<h4>發文者:&nbsp;" + forum.account +"&nbsp;&nbsp;回覆次數:&nbsp;" + forum.prestige + "&nbsp;&nbsp;發文時間:" + forum.ftime + "</h4></center><br></a>"
                	+ "</li></ul></div>"
				}else{
					fa	+= "<div class='dec-review-meta'  style='border-radius:30px;background-color: rgba(182, 126, 4, 0.918); border:3px #0be01d solid;'>"
	                	+  "<ul><li>"
	                    +  "<a href='" + showMessage + forum.fid + "'><center><h2>[" + forum.theme + "]&nbsp;" + forum.article + "</h2><br>"
	                    +  "<h4>發文者:&nbsp;" + forum.account +"&nbsp;&nbsp;回覆次數:&nbsp;" + forum.prestige + "&nbsp;&nbsp;發文時間:" + forum.ftime + "</h4></center><br></a>"
	                	+  "</li></ul></div>"
					
				}

			}
				document.getElementById("AllForum").innerHTML = fa;
		}
	}
}
	//新增後查詢
	function send(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/saveForum.controller' />",true);
		var jsonmsgfather = {
				"account":document.getElementById("account").value,
				"tag":document.getElementById("tag").value,
				"theme":document.getElementById("theme").value,
				"article":document.getElementById("article").value,
				"content":document.getElementById("content").value,
				"fmovie":document.getElementById("fmovie").value,
				"prestige":document.getElementById("prestige").value,
				"freport":document.getElementById("freport").value,
				"fdel":document.getElementById("fdel").value
				
		}

		xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr.send(JSON.stringify(jsonmsgfather));
		
// 		Swal.fire({
// 			  icon: 'success',
// 			  title: '文章發表成功嘍!快去看看吧',
// 			  showConfirmButton: false,
// 			  timer: 1500
// 			})

		Swal.fire({
		  title: '文章發表成功，快去看看吧!',
		  width: 600,
		  padding: '3em',
		  backdrop: `
		    rgba(0,0,123,0.4)
// 		    url("https://media1.tenor.com/images/806fa85fc55a55de66ab310e500b5f0f/tenor.gif?itemid=5716621")
		    left top
		    no-repeat
		  `
		})
		var c1 = document.getElementById("article");
		var c2 = document.getElementById("content");
		c1.value ="";
		c2.value ="";
		savefindForum()	

	}
	
	function savefindForum(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/selectMovieForum.controller' />?fmovie="+"${movie.movieName}",true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var forums = JSON.parse(xhr.responseText);
				var fa  = " "
				for(i = 0; i<forums.length; i++){
					var forum = forums[i]
					reportForum = "<c:url value='/reportForum/' />";
					showMessage = "<c:url value='/message/' />";
					if(forum.theme !="置頂" & forum.theme !="精華"){
					fa	+= "<div class='dec-review-meta'  style='border-radius:30px;background-color: rgba(1, 36, 65, 0.918); border:3px #0be01d solid;'>"
	                	+ "<ul><li>"
	                    + "<a href='" + showMessage + forum.fid + "'><center><h2>[" + forum.tag + "]&nbsp;" + forum.article + "</h2><br>"
	                    + "<h4>發文者:&nbsp;" + forum.account +"&nbsp;&nbsp;回覆次數:&nbsp;" + forum.prestige + "&nbsp;&nbsp;發文時間:" + forum.ftime + "</h4></center><br></a>"
	                	+ "</li></ul></div>"
					}else{
						fa	+= "<div class='dec-review-meta'  style='border-radius:30px;background-color: rgba(182, 126, 4, 0.918); border:3px #0be01d solid;'>"
		                	+  "<ul><li>"
		                    +  "<a href='" + showMessage + forum.fid + "'><center><h2>[" + forum.theme + "]&nbsp;" + forum.article + "</h2><br>"
		                    +  "<h4>發文者:&nbsp;" + forum.account +"&nbsp;&nbsp;回覆次數:&nbsp;" + forum.prestige + "&nbsp;&nbsp;發文時間:" + forum.ftime + "</h4></center><br></a>"
		                	+  "</li></ul></div>"
						
					}
			
				}
					document.getElementById("AllForum").innerHTML = fa;
			}
		}
	}
	//查詢全部文章
// 	function savefindForum(){
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET","<c:url value='/queryAllForum.controller' />",true);
// 	xhr.send();
// 	xhr.onreadystatechange = function(){
// 		if(xhr.readyState == 4 && xhr.status == 200){
// 			var forums = JSON.parse(xhr.responseText);
// 				var fa  = " "
// 				for(i = 0; i<forums.length; i++){
// 					var forum = forums[i]
// 					reportForum = "<c:url value='/reportForum/' />";
// 					fa	+= "<div class='dec-review-meta'  style='border-radius:30px;background-color: rgba(1, 36, 65, 0.918); border:3px #0be01d solid;'>"
// 	                	+ "<ul><li>"
// 	                    + "<a href='" + showMessage + forum.fid + "'><center><h2>[" + forum.tag + "]&nbsp;" + forum.article + "</h2><br>"
// 	                    + "<h4>發文者:&nbsp;" + forum.account +"&nbsp;&nbsp;回覆次數:&nbsp;" + forum.prestige + "&nbsp;&nbsp;發文時間:" + forum.ftime + "</h4></center><br></a>"
// 	                	+ "</li></ul></div>"


// 				}
// 					document.getElementById("AllForum").innerHTML = fa;
// 			}
// 		}
// 	}
	//一鍵輸入
	var quick = document.getElementById("fast");
  		quick.onclick = function(){
  			var c1 = document.getElementById("article");
  			var c2 = document.getElementById("content");

           
  			c1.value = "《永生戰》可惜了好演員";
  			c2.value = "雷文防雷資訊頁"
  				+"~*-*~*-*~*-*~*-*~*-*~*-*~*-*~*-*~*-*~*-*~*-*~*-*~"
  				+"	~~~~~~~~~~~~~~~~~~~ 雷文 主文分隔線 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  				+"先說好的"
  				+"看得出本片想用一種比較少見的概念講這個題材"
  				+"「因為有死亡才能使生命有意義」"
  				+"害怕死亡所以你才會努力認真去追求人生的意義和目標"
  				+"老實說這概念很不錯"
  				+"但是真的可惜.."
  				+"1.劇情太智障"
  				+"保護一個有超能力的"
  				+"我以為有什麼原因也許不能一直用之類的"
  				+"嗯完全沒有。所以是在哈囉？"
  				+"而且還是強到不怕任何攻擊的.."
  				+"我記得孔劉很挑劇本 沒推掉也很奇怪"
  				+"看前半已經和小栗旬一樣白眼到頭暈"
  				+"2.人物刻畫太淺 那個女友死根本無感"
  				+"然後主角還被騙第二次"
  				+"問號"
  				+"博士的家人也沒什麼描述 幾個畫面講幾句就哭"
  				+"再次問號"
  				+"反派也很無聊"
  				+"人物的塑造都太少 感受不到劇情張力"
  				+"3.還有片商的宣傳真的很爛"
  				+"拉演員的知名作品來介紹也是很奇怪"
  				+"很像因為這部難看而寫不出宣傳文的樣子"
  				+"什麼韓版天能，完全都不一樣的東西..."
  				+"應該也不是動作片，在那邊動作鉅獻？"
  				+"我是沒注意他們fb看到有人說才去看"
  				+"真的覺得很瞎啦.."
  				+"完全靠孔劉演技和動作很帥撐起的片"
  				+"他最後那個轉變（說要停止那裡）我竟然稍微稍微的有感動到";

  		
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