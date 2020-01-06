<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/9/25
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css"/>
    <script src="static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>


<ul class="layui-nav">
    <li class="layui-nav-item" style="margin-left: 50px;">
        <a href="" style="color: green;">SMS聊天室</a>
    </li>
    <li class="layui-nav-item"style="margin-left: 1100px;">
        <a href="SMS.login.jsp"><img src="//t.cn/RCzsdCq" class="layui-nav-img">${account}
        </a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">个人资料</a></dd>

        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="SMS.login.jsp?action=exit">退出<span ></span></a>
    </li>
</ul>
<div class="" style=" position: relative;">

    <!--<div class="layui-tab layui-tab-brief">-->
    <!--<ul class="layui-tab-title">
      <li class="layui-this">首页</li>

    </ul>-->
    <div class="layui-breadcrumb">

        <div class=""style="position: absolute;left: 220px;">
            <a href="">首页</a>
        </div>


    </div>



</div>

<ul class="layui-nav layui-nav-tree" lay-filter="test">
    <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
    <li class="layui-nav-item layui-nav-itemed">
        <a href="javascript:;">消息管理</a>
       <!-- <dl class="layui-nav-child">
            <dd><a href="javascript:;">选项1</a></dd>
            <dd><a href="javascript:;">选项2</a></dd>
            <dd><a href="">跳转</a></dd>
        </dl>
        -->
    </li>
    <li class="layui-nav-item"><a href="SMS.fourth.jsp">收件箱</a></li>
    <!--<li class="layui-nav-item"><a href="">收件箱(LayUI表格)</a></li>-->

    <li class="layui-nav-item"><a href="SMS.six.jsp">发件箱</a></li>
    <li class="layui-nav-item"><a href="SMS.three.jsp">读消息</a></li>
    <li class="layui-nav-item"><a href="SMS.five.jsp">写消息</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">账户管理</a>
        <dl class="layui-nav-child">
            <dd><a href=""></a></dd>
            <dd><a href=""></a></dd>
            <dd><a href=""></a></dd>
        </dl>
    </li>
    <div class="" style="height: 200px;color: #393D49;">
    </div>
</ul>

</body>
<script>
layui.use('element', function(){
var element = layui.element;
});
</script>
</html>
