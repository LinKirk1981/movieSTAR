<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li style="font-size: 30px;">留言版</li>
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
         <div class="alert alert-success"  role="alert" id="forum" style=' border:3px #0be01d solid;'></div>

<div id="allmsg"></div>
<div class="buttons"> 
<%if (session.getAttribute("displayusername")!=null){ %>
<div class="tag-category tag-1">
     <ul>
       <li><a onclick="hide()" style="cursor: pointer;" title="" type="button">回覆</a></li>
                   
     </ul>
</div><br>	

<div id="hide" style="display: none; ">
<input type="hidden" id="account" name="account" style="background-color: rgb(68, 64, 64);color: #0be01d;" value= "${displayusername}" /><br><br>		
<textarea rows="13" cols="150" id="mcontent"  placeholder="留言內容" style="background-color: rgb(68, 64, 64); color: #0be01d;"	required ></textarea>
<input type="hidden" id="blockade"  value= "未封鎖" />
<button type="button" id="msgAll" onclick="saveMsg()" class="btn btn-buttons">送出</button>&nbsp;&nbsp;&nbsp;
<button type="button" onclick="fast()"  class="btn btn-buttons">一鍵輸入</button>
</div>
<%}else{ %>
<div class="tag-category tag-1">
     <ul>
       <li><a onclick="hide()" style="cursor: pointer;" title="" type="button">回覆</a></li>
                   
     </ul>
</div><br>	

<div id="hide" style="display: none; ">
<input type="hidden" id="account" name="account" style="background-color: rgb(68, 64, 64);color: #0be01d;" value="訪客" placeholder="請輸入暱稱" required /><br><br>		
<textarea rows="13" cols="150" id="mcontent"  placeholder="留言內容" style="background-color: rgb(68, 64, 64); color:  #0be01d;"	required ></textarea>
<input type="hidden" id="blockade"  value= "未封鎖" />
<button type="button" id="msgAll" onclick="saveMsg()"  class="btn btn-buttons">送出</button>&nbsp;&nbsp;&nbsp;
<button type="button" onclick="fast()"  class="btn btn-buttons">一鍵輸入</button>
</div>

<%} %>
</div>
<input type="hidden" id="mtimedel"  value= "" />
<input type="hidden" id="mcontentdel"  value= "此留言已被刪除" />
<input type="hidden" id="blockadedel"  value= "封鎖" />

<script type="text/javascript">
//點選展開
function hide(){
	if(document.getElementById('hide') .style.display=='none'){document.getElementById('hide') .style.display=''}
	else{document.getElementById('hide') .style.display='none'}
	}

//查詢單筆文章
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/showOneMsg.controller' />?fid=" +${fid},true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var msg = "<div class='buttons'>"
			var forumMsg = JSON.parse(xhr.responseText);
			console.log(forumMsg.msg)
				reportForum = "<c:url value='/reportForum/' />";
				msg += "<h2><b>【" + forumMsg.tag +"】"+ forumMsg.article 
					+  "<h3 style='text-align:right;'><a href='" + reportForum + forumMsg.fid +"' class='Repost'>檢舉</a></h3></b></h2>"
					+  "</h2><div><hr style='height: 1px;background-color:#0be01d'>"
					+  "<h2><span style='border:2px #0be01d solid;width: 85px;'>"
					+  "&nbsp;樓主&nbsp;</span>&nbsp;&nbsp;<a href='#'>" + forumMsg.account+"</a></h2><br>" 
					+  "<h3>" + forumMsg.content + "<br><br>"
					+  "<div style='text-align:right;'><div class='comment-time'>"
					+  "發表時間:&nbsp;&nbsp;"+forumMsg.ftime + "</div></div></h3></div>"
					
// 					+ forumMsg.theme + "<br>"
// 					+ forumMsg.fdel + "<br>"
// 					+ forumMsg.fmovie + "<br>"
// 					+ forumMsg.freport + "<br>"
// 					+ forumMsg.prestige + "<br></div>"

		
					
				document.getElementById("forum").innerHTML = msg;
				showAllmessage()
				
		}
	}
}

//留言
function saveMsg(){
	var xhr = new XMLHttpRequest();
	var account = document.getElementById("account").value;
	var mcontent = document.getElementById("mcontent").value;
	var blockade = document.getElementById("blockade").value;
	xhr.open("post","<c:url value='/saveMessage.controller'/>",true)
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send("pk="+${fid}+"&account="+account+"&mcontent="+mcontent+"&blockade="+blockade);
	Swal.fire({
		  icon: 'success',
		  title: '留言成功!',
		  showConfirmButton: false,
		  timer: 1500
		})
		
		
// 		mcontent = document.getElementyById("mcontent").value = "";
	showAllmessage()

	
}
//一鍵輸入
function fast(){
	var c1 =  document.getElementById("mcontent");
	
	c1.value = "覺得還好耶，一度要睡著......";
}

//查詢文章底下所有留言

 function showAllmessage(){
	var xhr = new XMLHttpRequest();
	xhr.open("get","<c:url value='/findMessage.controller'/>?fid=" +${fid},true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var messages = JSON.parse(xhr.responseText);
				var fmsg = "";
			for(var i = 0; i<messages.msg.length; i++){
				var message = messages.msg[i];
				if (message.mcontent != '此留言已被刪除'){
				fmsg += "<div class='alert alert-info' style=' border:3px #0be01d solid;' role='alert'><h2><span style='border:2px #0be01d solid;width: 85px;'>&nbsp;" 
				+ (i+2) +"樓&nbsp;</span>&nbsp;&nbsp;"
				if ( '${displayusername}' == ""){
					fmsg += message.account + '</h2><h3 style="text-align:right;"></h3><br>'				
				}else {
					fmsg += message.account + '</h2><h3 style="text-align:right;"><div style="cursor: pointer;"><a onclick=reportMessage('+ message.mid +') class="Repost">刪除</a></div></h3><br>'									
				}
				fmsg += "<h2>" + message.mcontent + "</h2><br>"
			    	 + "<h3><br><div style='text-align:right;'><div class='comment-time'>發表時間:&nbsp;"
					 + message.mtime + "</div></div></h3></div>"
				}else {
					fmsg += "<div class='alert alert-info' style=' background-color: gray;border:3px #867b74 solid;' role='alert'><h2><span style='color:black; border:2px #867b74 solid;width: 85px;'>&nbsp;" 
						+ (i+2) +"樓&nbsp;</span>&nbsp;&nbsp;" 
						+ "</h2><h3 style='text-align:right;'></h3><br>"				
						+ "<h2 style='color:black;'>" + message.mcontent + "</h2><br>"
					    + "<h3><br><div style='text-align:right;'><div >&nbsp;"
						+ message.mtime + "</div></div></h3></div>"
					
				}
			}
			
			document.getElementById("allmsg").innerHTML = fmsg
			recordPrestige()
		}

	}

}
//刪除留言
function reportMessage(mid){
	const swalWithBootstrapButtons = Swal.mixin({
		  customClass: {
		    confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		  },
		  buttonsStyling: false
		})

		swalWithBootstrapButtons.fire({
		  title: '確定要刪除嗎?',
		  text: "刪除了就無法復原了!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: '刪除!',
		  cancelButtonText: '取消!',
		  reverseButtons: true
		}).then((result) => {			
		  if (result.isConfirmed) {	
	var xhr = new XMLHttpRequest();
	xhr.open("post","<c:url value='/reportMessage.controller' />?mid=" +mid,true);
		var reM = {
		 "mtime" : document.getElementById("mtimedel").value,
		 "blockade" : document.getElementById("blockadedel").value,	
		 "mcontent" : document.getElementById("mcontentdel").value
		}
		xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr.send(JSON.stringify(reM));
		swalWithBootstrapButtons.fire(
			      '刪除完成!',
			      '您成功刪除文章了.',
			      'success'
			    ).then(function(){window.location.assign("http://localhost:8080/MovieSTAR/message/${fid}");})
				  	    
			 	}else if (
			  
			    /* Read more about handling dismissals below */
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons.fire(
			      '取消',
			      '您已取消刪除了',
			      'error'
			    )
			  }
			})
}

//單筆文章
 function recordPrestige(){
 var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/showOneMsg.controller' />?fid=" +${fid},true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var msg = "<div class='buttons'>"
			var forumMsg = JSON.parse(xhr.responseText);
			console.log(forumMsg.msg)
				reportForum = "<c:url value='/reportForum/' />";
				msg += "<h2><b>【" + forumMsg.tag +"】"+ forumMsg.article 
					+  "<h3 style='text-align:right;'><a href='" + reportForum + forumMsg.fid +"' class='Repost'>檢舉</a></h3></b></h2>"
					+  "</h2><div><hr style='height: 1px;background-color:#0be01d'>"
					+  "<h2><span style='border:2px #0be01d solid;width: 85px;'>"
					+  "&nbsp;樓主&nbsp;</span>&nbsp;&nbsp;<a href='#'>" + forumMsg.account+"</a></h2><br>" 
					+  "<h3>" + forumMsg.content + "<br><br>"
					+  "<div style='text-align:right;'><div class='comment-time'>"
					+  "發表時間:&nbsp;&nbsp;"+forumMsg.ftime + "</div></div></h3></div>"
					
//					+ forumMsg.theme + "<br>"
//					+ forumMsg.fdel + "<br>"
//					+ forumMsg.fmovie + "<br>"
//					+ forumMsg.freport + "<br>"
//					+ forumMsg.prestige + "<br></div>"

		
					
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

