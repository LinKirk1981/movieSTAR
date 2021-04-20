<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!doctype html>
        <html lang="en">

        <head>
            <jsp:include page="../user/css.jsp" />

            <script type="text/javascript">
                let flag1 = false, flag2 = false, flag3 = false, flag4 = false, flag5 = false, flag6 = false, flag7 = false;


                window.onload = function () {
                    var account = document.getElementById("account");
                    //var result1c = document.getElementById('result1c');
                    //re3 = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
                    account.onclick = function () {

                    }
                    account.onblur = function () {
                        var accountValue = document.getElementById("account").value;
                        
                        if (!accountValue) {
                            result1c.innerHTML = "<font color='red' size='-1'>*請輸入帳號</font>";
                            //flag1 = false;
                            return;
                        }

                        //flag1=false;
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "<c:url value='/checkMemberByAccount' />", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.send("account=" + accountValue);
                        var message = "";
                        xhr.onreadystatechange = function () {

                            if (xhr.readyState == 4 && xhr.status == 200) {
                                var result = JSON.parse(xhr.responseText);
                                if (result.account.length == 0) {
                                    message = "<font color='green' size='-2'>*帳號可用</font>";
                                    flag1 = true;
                                } else if (result.account.startsWith("Error")) {
                                    message = "<font color='red' size='-2'>*發生錯誤: 代號" + result.account + "</font>";
                                    flag1 = false;
                                } else {
                                    message = "<font color='red' size='-2'>*帳號重複，請重新輸入帳號</font>";
                                    flag1 = false;
                                }
                                result1c.innerHTML = message;
                            }
                        }

                    }
                    var objRegex0 = /^(?=.*\d)(?=.*[a-z])(?=.*[!@#$%^&*()])(?=.*[A-Z]).{6,30}$/
                    var objRegex1 = /^(?=.*[^a-zA-Z0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$/
                    var objRegex2 = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
                    var password = document.getElementById("password")
                    // password.onclick = function () {

                    // }
                    password.onblur = function () {
                        var passwordValue = document.getElementById("password").value;
                        console.log("====passwordValue1=======" + passwordValue);
                        var conPasswordValue = document.getElementById("conPassword").value;
                        console.log("====conPasswordValue2=======" + conPasswordValue);
                        if (!passwordValue) {
                            result3c.innerHTML = "*請輸入您的密碼";
                            flag2 = false;
                        } else if (!objRegex2.test(passwordValue)) {
                            result3c.innerHTML = "*需含數字與大小寫英文,必須大於8個字";
                            flag2 = false;
                        } else {
                            result3c.innerHTML = "";
                            flag2 = true;
                        }

                        if (passwordValue != conPasswordValue) {
                            result4c.innerHTML = "<font color='red' >***請確認您輸入的密碼和密碼一致!</font>";
                            flag3 = false;
                        }

                    }

                    var conPassword = document.getElementById("conPassword");
                    // conPassword.onclick = function () {

                    // }
                    conPassword.onblur = function () {
                        var conPasswordValue = document.getElementById("conPassword").value;
                        console.log("=====conPasswordValue3======" + conPasswordValue);
                        if (!conPasswordValue) {
                            console.log("=====conPasswordValue3.1======" + conPasswordValue);
                            result4c.innerHTML = "<font color='red' >*請再輸入一次您的密碼</font>";
                            flag3 = false;
                        } else if(conPasswordValue != password.value){
                            console.log("=====conPasswordValue3.2======" + conPasswordValue);
                            result4c.innerHTML = "<font color='red' >**請確認您輸入的密碼和密碼一致!</font>";
                            flag3 = false;
                        } else if (conPasswordValue == password.value) {
                            console.log("=====conPasswordValue3.3======" + conPasswordValue);
                            result4c.innerHTML = "";
                            flag3 = true;
                        } else {
                            console.log("=====conPasswordValue3.4======" + conPasswordValue);
                            result4c.innerHTML = "<font color='red' >*請再輸入一次您的密碼</font>";
                            flag3 = false;
                        }
                    }

                    var name = document.getElementById("name");
                    re2 = /^([\u4e00-\u9fa5]){2,}$/;
                    name.onclick = function () {

                    }
                    name.onblur = function () {
                        var nameValue = document.getElementById("name").value;
                        
                        if (!nameValue) {
                            result0c.innerHTML = "<font color='red' >*請輸入姓名</font>";
                            flag4 = false;
                        } else if (!re2.test(nameValue)) {
                            result0c.innerHTML = "<font color='red' >*請輸入真實姓名</font>";
                            flag4 = false;
                        } else {
                            result0c.innerHTML = "";
                            flag4 = true;
                        }
                    }

                    var emailbox = document.getElementById("emailbox");
                    objRegex3 = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
                    emailbox.onclick = function () {

                    }
                    emailbox.onblur = function () {
                        var emailboxValue = document.getElementById("emailbox").value;
                        
                        if (!emailboxValue) {
                            result5c.innerHTML = "*請輸入Email信箱這是您的帳號";
                            flag7 = false;
                        } else if (objRegex3.test(emailboxValue)) {
                            result5c.innerHTML = "*Email信箱格式不正確";
                            flag7 = false;
                        } else {
                            result5c.innerHTML = "";
                            flag7 = true;
                        }
                    }

                    var cell = document.getElementById("cell");
                    var objRegex4 = /^(\d{2,3}-?|\(\d{2,3}\))\d{3,4}-?\d{4}|09\d{2}(\d{6}|-\d{3}-\d{3})$/;
                    cell.onclick = function () {

                    }
                    cell.onblur = function () {
                        var cellvalue = document.getElementById("cell").value;
                        
                        if (!cellvalue) {
                            flag6 = false;
                            result2c.innerHTML = "*請輸入您的手機號碼";
                        } else if (!objRegex4.test(cellvalue)) {
                            flag6 = false;
                            result2c.innerHTML = "*手機格式錯誤";
                        } else {
                            flag6 = true;
                            result2c.innerHTML = "";
                        }
                    }

                    var sendData = document.getElementById("sendData");
                    sendData.onclick = function () {
                        // hasError = false;             
                        var nameValue = document.getElementById("name").value;
                        var accountValue = document.getElementById("account").value;
                        var cellvalue = document.getElementById("cell").value;
                        var passwordValue = document.getElementById("password").value;
                        var conPasswordValue = document.getElementById("conPassword").value;
                        var emailboxValue = document.getElementById("emailbox").value;
                        
                        //p錯誤訊息
                        var div0 = document.getElementById('result0c');
                        var div1 = document.getElementById('result1c');
                        var div2 = document.getElementById('result2c');
                        var div3 = document.getElementById('result3c');
                        var div4 = document.getElementById('result4c');
                        var div5 = document.getElementById('result5c');

                        //p如果有錯不往下執行.....
                        // if (hasError) {
                        //     return false;
                        // }


                        var xhr1 = new XMLHttpRequest();
                        xhr1.open("POST", "<c:url value='/registermembers' />", true);
                        var jsonMember = {
                            "memberid": "i20210423000",
                            "account": accountValue,
                            "password": passwordValue,
                            "name": nameValue,
                            "cell": cellvalue,
                            "emailbox": emailboxValue,
                            "permission": "y_Notcertified",
                            "confirmpassword": conPasswordValue,
                            //"image1": "views/image/14.jpg"
                        }

                        //alert(JSON.stringify(jsonMember)); //p顯示JSON格式 得到JSON格式後就不要顯示了.
                        xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                        xhr1.send(JSON.stringify(jsonMember)); //JSON.stringify把物件轉換成字串格式. 然後send送出
                        //p後端顯示
                        xhr1.onreadystatechange = function () {
                            // p伺服器請求完成
                            if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201)) {
                                
                                result = JSON.parse(xhr1.responseText);

                                if (result.fail) {
                                    Swal.fire({
                                        position: 'center',
                                        icon: 'error',
                                        title: '資料輸入錯誤',
                                        showConfirmButton: false,
                                        timer: 5000
                                    })
                                    // alert("資料輸入錯誤")
                                } else if (result.success) {
                                    Swal.fire({
                                        position: 'center',
                                        icon: 'success',
                                        title: '你已經成功註冊IMovie影城, 趕快挑選一部適合您的電影',
                                        showConfirmButton: false,
                                        timer: 5000
                                    })
                                    // alert("你已經成功註冊IMovie影城, 趕快挑選一部適合您的電影");
                                    window.location.assign(result.url)
                                }

                                if (result.idError) {
                                    Swal.fire({
                                        position: 'center',
                                        icon: 'error',
                                        title: result1c.innerHTML = "<font color='red'>" + result.idError + "</font>",
                                        showConfirmButton: false,
                                        timer: 5000
                                    })
                                    // result1c.innerHTML = "<font color='red'>" + result.idError + "</font>";
                                    flag1 = false;
                                } else {
                                    result1c.innerHTML = "";
                                    flag1 = true;
                                }

                                if (result.pwdError) {
                                    result3c.innerHTML = "<font color='red'>" + result.pwdError + "</font>";
                                    flag2 = false;
                                } else {
                                    result3c.innerHTML = "";
                                    flag2 = true;
                                }

                                if (result.confirmpassworderror) {
                                    Swal.fire({
                                        position: 'center',
                                        icon: 'error',
                                        title: result4c.innerHTML = "<font color='red'>" +result.confirmpassworderror + "</font>",
                                        showConfirmButton: false,
                                        timer: 5000
                                    })
                                    console.log("===conPasswordValue4====="+conPasswordValue)
                                    // result4c.innerHTML = "<font color='red'>" +result.confirmpassworderror + "</font>";
                                    flag3 = false;
                                    return;
                                }

                                if (result.nameError) {
                                    result0c.innerHTML = "<font color='red'>" + result.nameError + "</font>";
                                    flag4 = false;
                                } else {
                                    result0c.innerHTML = "";
                                    flag4 = true;
                                }

                                if (result.cellError) {
                                    result2c.innerHTML = "<font color='red'>" + result.cellError + "</font>";
                                    flag6 = false;
                                } else {
                                    result2c.innerHTML = "";
                                    flag6 = true;
                                }

                                if (result.emailError) {
                                    result5c.innerHTML = "<font color='red'>" + result.emailError + "</font>";
                                    flag7 = false;
                                } else {
                                    result5c.innerHTML = "";
                                    flag7 = true;
                                }

                            }

                        }

                    }

                }



            </script>
        </head>

        <body>
            <div class="main page-template">
                <jsp:include page="../user/nvigationBar.jsp" />

                <div class="inner-page">
                    <div class="login-page">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-offset-3 col-md-offset-3 col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="login-form">
                                        <h2></h2>
                                        <form action="#">
                                            <li style="font-size: 18px;">
                                                <!-- <a href="">還沒有帳號? <span class="green">趕快註冊.</span></a> -->
                                                <a href="<c:url value='/login.controller' />"> 有帳號了嗎? <span
                                                        class="green">點這裡登入.</span></a>

                                            </li>
                                            <div class="row">

                                                <div class="col-lg-4 col-md-4 col-sm-8 col-xs-4">

                                                    </br>
                                                    <div style="font-size: 18px; line-height:0.3em">
                                                        <label for="name">姓名 :</label>
                                                        </br>
                                                    </div>
                                                    </br>
                                                    <div style="font-size: 18px; line-height:0.5em">
                                                        <label for="account">帳號 :</label>
                                                        </br>
                                                    </div>
                                                    </br>
                                                    <div style="font-size: 18px; line-height:0.1em">
                                                        <label for="emailbox">信箱 :</label>
                                                        </br>
                                                    </div>
                                                    </br>
                                                    <div style="font-size: 18px; line-height:0.4em">
                                                        <label for="cell">手機 :</label>
                                                        </br>
                                                    </div>
                                                    </br>
                                                    <div style="font-size: 18px; line-height:0.5em">
                                                        <label for="password">密碼 :</label>
                                                        </br>
                                                    </div>
                                                    </br>
                                                    <div style="font-size: 18px;line-height:2em">
                                                        <label for="conPassword">再次確認密碼:</label>
                                                        <!-- </br> -->
                                                    </div>
                                                </div>

                                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">

                                                    <div class="form-group">
                                                        <span id="result0c" style='color: red'
                                                            display:inline-block;></span>
                                                        <br>
                                                        <input id="name" name="name" style="font-size: 21px;"
                                                            class="form-control form-mane" type="text"
                                                            placeholder="請輸入您的姓名">
                                                    </div>



                                                    <div class="form-group">
                                                        <span id="result1c" style='color: red'
                                                            display:inline-block;></span>
                                                        <br>
                                                        <input id="account" style="font-size: 21px;"
                                                            class="form-control form-mane" type="text"
                                                            placeholder="請輸入帳號">
                                                    </div>


                                                    <div class="form-group">
                                                        <span id="result5c" style='color: red'
                                                            display:inline-block;></span>
                                                        <br>
                                                        <input id="emailbox" style="font-size: 21px;"
                                                            class="form-control form-mane" type="text"
                                                            placeholder="請輸入Email信箱">
                                                    </div>


                                                    <div class="form-group">
                                                        <span id="result2c" style='color: red'
                                                            display:inline-block;></span>
                                                        <br>
                                                        <input id="cell" style="font-size: 21px;"
                                                            class="form-control form-mane" type="text"
                                                            placeholder="請輸入您的手機號碼">
                                                    </div>

                                                    <div class="form-group">
                                                        <span id="result3c" style='color: red'
                                                            display:inline-block;></span>
                                                        <br>
                                                        <input id="password" style="font-size: 21px;"
                                                            class="form-control form-mane" type="password"
                                                            placeholder="請輸入您的密碼)">
                                                    </div>

                                                    <div class="form-group">
                                                        <span id="result4c" style='color: red'
                                                            display:inline-block;></span>
                                                        <br>
                                                        <input id="conPassword" style="font-size: 21px;"
                                                            class="form-control form-mane" type="password"
                                                            placeholder="再次確認密碼">
                                                    </div>

                                                    <div class="buttons alert">
                                                        <input type="button" class="btn btn-buttons" id="sendData"
                                                            value="建立帳號" />
                                                        <input type="button" class="btn btn-buttons" id="quick"
                                                            value="一鍵輸入" />
                                                    </div>

                                                    <div class="forgat-pass">
                                                        <div class="remember-me" style="font-size: 15px;">
                                                            <input type="checkbox" id="remember" class="checkbox">
                                                            <label for="remember">記住我</label>
                                                        </div>
                                                        <div class="remember-me" style="font-size: 15px;">
                                                            <a href="<c:url value='/forgetpwd.controller' />">忘記你的 <span
                                                                    class="green"> 密碼 ?</span></a>
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
                quick.onclick = function () {
                    var c1 = document.getElementById("account");
                    var c2 = document.getElementById("password");
                    var c3 = document.getElementById("conPassword");
                    var c4 = document.getElementById("name");
                    var c5 = document.getElementById("cell");
                    var c6 = document.getElementById("emailbox");
                    var div0 = document.getElementById('result0c');
                    var div1 = document.getElementById('result1c');
                    var div2 = document.getElementById('result2c');
                    var div3 = document.getElementById('result3c');
                    var div4 = document.getElementById('result4c');
                    var div5 = document.getElementById('result5c');
                    c1.value = "jojoman";
                    c2.value = "Aa123456";
                    c3.value = "Aa123456";
                    c4.value = "林邱秋";
                    c5.value = "0911222333";
                    c6.value = "weichuanglin@gmail.com"
                    result0c.innerHTML = "";
                    result1c.innerHTML = "";
                    result2c.innerHTML = "";
                    result3c.innerHTML = "";
                    result4c.innerHTML = "";
                    result5c.innerHTML = "";
                }


//   		var btnn = document.getElementById("btnn");
//   		btnn.onclick = function (){
//   			var f1 = document.getElementById("password");
//   			var f2 = document.getElementById("conPassword");
//   			if(f1.type == "password"){
//   				f1.type = "text";
//   				f2.type = "text";
//   			}else if(f1.type == "text"){
//   				f1.type = "password";
//   				f2.type = "password";
//   			}
//   		}

            </script>

        </body>

        </html>