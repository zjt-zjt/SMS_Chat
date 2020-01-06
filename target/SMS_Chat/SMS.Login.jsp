<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/9/25
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/1.css"/>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>

<%
    String account = "";
    String password = "";

    Cookie[] cookies = request.getCookies();
    for(Cookie cookie : cookies) {
        if("account".equals(cookie.getName())) {
            account = URLDecoder.decode(cookie.getValue(), "UTF-8");
        } else if("password".equals(cookie.getName())) {
            password = URLDecoder.decode(cookie.getValue(), "UTF-8");
        }
    }

%>


<div class="img1">
    <img src="img/sms_login_title.png"/>
</div>
<div class="img2">
    <div class="c"></div>
     <div>
         <span id ="error_info" style="color: red"></span>
     </div>


    <form action="SMS.login.jsp" method="post" id="form">
        <div class="use" >
            账&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="text" name = "account" id="account" value="<%=account %>"/>

        </div>
        <div class="password">
            密 &nbsp;&nbsp;&nbsp;码:&nbsp; <input type="password" name = "password" id="password" value="<%=password %>"/>
        </div>
        <div class="rember">
            <input type="checkbox" id ="re" name = "remember" />记住密码
        </div>
        <div class="img3">

            <input type = "submit" value="登陆"/>	 &nbsp;&nbsp;&nbsp;
            <input type = "submit" value="注册"/>
        </div>
    </form>


</div>
</body>



</html>
