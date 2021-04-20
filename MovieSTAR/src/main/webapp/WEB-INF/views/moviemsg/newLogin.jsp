<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html class="no-js" lang="en">

         <head>
           
         <script src="https://apis.google.com/js/platform.js" async defer></script>
         <meta name="google-signin-client_id" content="542797334433-kubelp1c26c1eop1pnmb7eaf2tjtjosp.apps.googleusercontent.com">
         <meta charset="utf-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <meta name="description" content="">
         <meta name="author" content="">
         <jsp:include page="../user/css.jsp" />
         
         </head>
         
      <script type="text/javascript">
            let flag1=false, flag2=false;
            
            window.onload = function () {

          		var submit = document.getElementById("submit");          		        		
          		var msg1 = document.getElementById("msg1");
          		var msg2 = document.getElementById("msg2");
                var account = document.getElementById("account");
                var password = document.getElementById("password");
                
                
//                 account.onclick=function(){
// 				}	
                account.onblur = function () {

          			if(!account.value){
          				msg1.innerHTML =  "<font color='red' >*請確認使用者帳號</font>";
          				flag1 = false;
          			}else{
          				msg1.innerHTML =  "";
          			}

          			var xhr = new XMLHttpRequest();
          			xhr.open("Post","<c:url value='/checkMemberByAccount' />",true); 
          			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
          			xhr.send("account=" + account.value);
          			var message="";
          			xhr.onreadystatechange = function() {
          			    // p伺服器請求完成
          			    if (xhr.readyState == 4 && xhr.status == 200) {
          				   var result = JSON.parse(xhr.responseText);
          				   if (result.account.length == 0) {
          					  message = "<font color='red' >*請確認使用者帳號</font>";
          					  flag1 = false;
          				   } else if (result.account.startsWith("Error") ) {
          					  message = "<font color='red' >發生錯誤: 帳號" + result.account + "</font>";
          					  flag1=false
          				   } else {
          					  message = ""; 
          					  flag1=true
          				   }
          				   msg1.innerHTML = message;
          			    }
          		     }
                  };


// 				    password.onclick=function(){
// 					}			                  
          	 		password.onblur = function(){
          	  			if(!password.value){
          	  				msg2.innerHTML =  "<font color='red' >*請輸入密碼</font>";
          	  				flag2 = false;
          	  			}else{
          	  				msg2.innerHTML = "";
          	  				flag2=true;
          	  			}
          	  		}

          	 		submit.onclick = function(){

                        var account = document.getElementById("account");
                        var password = document.getElementById("password");
          	  			
          	  			if(!(flag1)){         	  				
          	  				msg1.innerHTML =  "<font color='red' >*請確認使用者帳號</font>";
          	  				return false;
          				}	
          	  			if(!flag2){         	  				
          	  				msg2.innerHTML =  "<font color='red' >*密碼錯誤</font>";
          		   			return false;
          	  			}
          	  			
          				var xhr1 = new XMLHttpRequest();
          	  	   		xhr1.open("POST", "<c:url value='/checkLogin' />", true);
          	  			var jsonMember = {
          	  				"account": account.value, 	
          	  				"password": password.value
          	  	   		}
          	  			//alert(JSON.stringify(jsonMember));
          	  	   		xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
          	  	   		xhr1.send(JSON.stringify(jsonMember));
          	  	   		xhr1.onreadystatechange = function() {
          	  	   			if (xhr1.readyState == 4 && xhr1.status == 200) {
          	  	   				var result = JSON.parse(xhr1.responseText);

          	  	   				
          	  	   				if(result.pwdfail){         	  	   		
          	  	   					msg2.innerHTML = "<font color='red' >" + result.pwdfail + "</font>";
          	  	   				    flag2 = false;
          	  	   				} else {
          	  	   				    flag2 = true;
              	  	   		    }

              	  	   		    if(result.success){
          	  	   					msg1.innerHTML = "<font color='red' >" + result.success + "</font>";         	  	   					
          	  	   					window.location.assign("<c:url value='/homepage.controller'/>");
          	  	   				    flag1 = true;
          	  	   				} else{
          	  	   				    flag1 = false;
          	  	   				}


          	  	   				if(result.verify){   	  	   					
          	  	   					msg1.innerHTML = "<font color='red' >" + result.verify + "</font>";

                                     var account =document.getElementById("account");
          	  	   					 var password =document.getElementById("password");
          	  	   					 if(account!=""&&password!=""){
          	  	   					window.location.assign("<c:url value='/emailcheck.controller' />"); 
              	  	   			      }          	  	   					
          	  	   				    flag1 = false;
          	  	   				} else {       	  	   					
         	   	   				    flag1 = true;
          	  	   				}  
          	  	   				       	  	   				      	  	   				
          	  	   			}
          	  	   		}         	  	   		
          	  		}            
                }

           </script>
       
        <body>
            <div class="main page-template">
               <jsp:include page="../user/nvigationBar.jsp" />

      	<div class="inner-page">
			<div class="login-page">
				<div class="container">
					<div class="row">
						<div
							class="col-lg-offset-3 col-md-offset-3 col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<div class="login-form">
								<h2></h2>
								<form action="">
									<a href="">還沒有帳號? <span class="green">趕快註冊.</span></a>
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-4">
											<br>
											<div class="form-group ">
												<label for="account">帳號 :</label>
											</div>
											<br>
											<div class="form-group">
												<label for="password">密碼 :</label>
											</div>
										</div>
										<div class="col-lg-8 col-md-8 col-sm-12 col-xs-8">

											<div class="form-group">
												<span id="msg1" style="color: red"></span><br> 
												<input id="account" class="form-control form-mane" type="text" placeholder="請輸入帳號">
											</div>

											<div class="form-group">
												<span id="msg2" style="color: red"></span><br> 
												<input id="password" class="form-control form-mane" type="password" placeholder="請輸入密碼">
											</div>

											<div class="buttons alert">
												<input type="button" class="btn btn-buttons" id="submit" value="登入" />
												<input type="button" class="btn btn-buttons" id="quick" value="一鍵輸入" />
											</div>

											<div class="g-signin2" data-onsuccess="onSignIn" data-longtitle="true">
											</div>
												
											<div class="fb-login-button" data-width="" 
											data-size="medium" data-button-type="continue_with" 
											data-layout="default" data-auto-logout-link="false" 
											data-use-continue-as="true"></div>
											

											<div class="forgat-pass">
												<div class="remember-me">
													<input type="checkbox" id="remember" class="checkbox">
													<label for="remember">記住我</label>
												</div>
												<div class="remember-me">
													<a href="<c:url value='/forgetpwd.controller' />">忘記你的 <span class="green"> 密碼 ?</span></a>
												</div>
											</div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../user/footer.jsp" />
            </div>
            <!-- FOOTER SECTION -->
            <script>
            
             var quick = document.getElementById("quick");
             
       		    quick.onclick  = function ()  {
          		    
      			var c1 = document.getElementById("account");
      			var c2 = document.getElementById("password");
    			
//                 var div0 = document.getElementById('result0c');
//                 var div1 = document.getElementById('result1c');

      			c1.value = "jojoman";
      			c2.value = "Aa123456";
      			
//       			msg1.innerHTML = "";
//       			msg2.innerHTML = "";

  				var xhr1 = new XMLHttpRequest();
  	  	   		xhr1.open("POST", "<c:url value='/checkLogin' />", true);
  	  			var jsonMember = {
  	  				"account": account.value, 	
  	  				"password": password.value
  	  	   		}
  	  			//alert(JSON.stringify(jsonMember));
  	  	   		xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
  	  	   		xhr1.send(JSON.stringify(jsonMember));
  	  	   		xhr1.onreadystatechange = function() {
  	  	   			if (xhr1.readyState == 4 && xhr1.status == 200) {
  	  	   				var result = JSON.parse(xhr1.responseText);

  	  	   				
  	  	   				if(result.pwdfail){         	  	   		
  	  	   					msg2.innerHTML = "<font color='red' >" + result.pwdfail + "</font>";
  	  	   				    flag2 = false;
  	  	   				} else {
  	  	   				    flag2 = true;
      	  	   		    }

      	  	   		    if(result.success){
  	  	   					msg1.innerHTML = "<font color='red' >" + result.success + "</font>";         	  	   					
  	  	   					window.location.assign("<c:url value='/movieDetail/1'/>");
  	  	   				    flag1 = true;
  	  	   				} else{
  	  	   				    flag1 = false;
  	  	   				}


  	  	   				if(result.verify){   	  	   					
  	  	   					msg1.innerHTML = "<font color='red' >" + result.verify + "</font>";

                             var account =document.getElementById("account");
  	  	   					 var password =document.getElementById("password");
  	  	   					 if(account!=""&&password!=""){
  	  	   					window.location.assign("<c:url value='/emailcheck.controller' />"); 
      	  	   			      }          	  	   					
  	  	   				    flag1 = false;
  	  	   				} else {       	  	   					
 	   	   				    flag1 = true;
  	  	   				}  
  	  	   				       	  	   				      	  	   				
  	  	   			}
  	  	   		}         	  	  

        		     

      		} 
          		
            </script>
        </body>

        </html>