<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/9/25
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/2.css"/>
</head>
<body>
<div class="img1">
    <img src="img/sms_reg_title.png"/>
</div>
<div class="img2">
    <div class="s"></div>
   <div> <span id ="error_info" style="color: red"></span></div>
    <div class="table">
        <form action="registerServlet" method="post" id="form">
        <table align="center" >

            <tr>
                <td >账&nbsp;号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name = "account"id = "account"/></td>
            </tr>
            <tr>
                <td>密 码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name = "password"id = "password"/></td>
            </tr>
            <tr>
                <td>确认密码:<input type="password" name = "spassword"id = "spassword"/></td>
            </tr>
            <tr>
                <td>昵 称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name = "nick_name" id="nick_name"/></td>
            </tr>
            <tr>
                <td>邮 箱:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name = "email"id ="email"/></td>
            </tr>
        </table>
        <div class="img3">
            <input type = "submit" value="注册"/>	 &nbsp;&nbsp;&nbsp;
            <input type = "reset" value="重置"/>
     </div>
        <div class="a">
            <a   id = return href="SMS.Login.jsp">返回首页</a>
        </div>
        </form>
    </div>


</div>
</body>

<script>
        //方法内容
        var form = document.querySelector("form");
    form.onsubmit = function() {


    var nick_name = $("#nick_name").val();
    var account = $("#account").val();
    var password = $("#password").val();
    var email = $("#email").val();
    $.ajax({
        url: "registerServlet",
        type: "post",
        data: {
            nick_name: nick_name,
            account: account,
            password: password,
            email: email
        },
        dataType: "json",
        success: function (res) {
             $("#error_info").empty();
            if (res.code == 1) {
                $("#error_info").append(res.message);
            } else if (res.code == 2) {
                $("#error_info").empty();
                $("#error_info").append(res.message);
               var href = res.local;
                location.href = href;
            }

        }

    });
    return false;
}
         // var form = document.querySelector("#nick_name");
         // form.onblur = function() {
         //
         //
         //    var nick_name = $("#nick_name").val();
         //
         //     $.ajax({
         //         url: "registerServlet",
         //         type: "post",
         //         data: {
         //             "nick_name": nick_name
         //
         //         },
         //         dataType: "json",
         //         success: function (res) {
         //              $("#error_info").empty();
         //             if (res.code == 1) {
         //                 $("#error_info").append(res.message);
         //            } else if (res.code == 2) {
         //                 $("#error_info").empty();
         //                 $("#error_info").append(res.message);
         //
         //                 var href = res.local;
         //                location.href = href;
         //             }
         //
         //         }
         //     });
         //     return false;
         // }

</script>
</html>
