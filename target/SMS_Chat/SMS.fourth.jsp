<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/9/25
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
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
        <!--<a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>-->
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
    <div class="layui-breadcrumb">

        <div class=""style="position: absolute;left: 220px;">
            <a href="">首页</a>
        </div>
        <div class=""style="position: absolute;left: 280px;">
            <a href="">消息管理</a>
        </div>
        <div class=""style="position: absolute;left: 360px;">
            <a href="">收件箱</a>
        </div>
    </div>
</div>
<div class=""style="position: absolute;left: 220px;top: 100px;">
    <table id="mytable" class="layui-table" lay-filter="demo" ></table>
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
    <!-- <li class="layui-nav-item"><a href="">收件箱(原生JS生成)</a></li>-->
    <li class="layui-nav-item"><a href="SMS.fourth.jsp">收件箱</a></li>

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


<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <!--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>





<script src="static/layui/layui.js" type="text/javascript" charset="utf-8"></script>






<script type="text/javascript">

    layui.use(["layer", "table"], function(){

        var table = layui.table;
        table.render({
            elem: '#mytable',
            height: 312,
            //data: stu, //data属性用于加载本地数据,一般用于静态网页(用法和EasyUI类似)
            url:'SMS.login.jsp?action=inbox',
            page: true, //开启分页
            cols:
                [[ //表头
                    {field: 'id', title: 'ID', width:100, sort: true}
                    ,{field: 'status', title: '状态', width:100,toolbar:'#barState'}
                    ,{field: 'subject', title: '标题', width:300,sort: true}
                    ,{field: 'hobby', title: '操作',toolbar: '#barDemo',width:200}
                    ,{field: 'createtime', title: '时间',width:200}
                ]]
        });


        table.on('tool(demo)', function(obj){
            var data = obj.data;

            if(obj.event === 'detail'){
                var id=data.id;
                location.href="operationServlet?action=look&ID="+id;


            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                    $.ajax({
                        url: "operationServlet",
                        type: "post",
                        data: {
                            action : "delete",
                            id:data.id
                        },
                        dataType: "json",
                        success: function (data,textStatus,jqxhr) {
                            if(data.rs ==1){

                            }
                        }

                    });

                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });



    });
</script>
<script type="text/html" id="barState">
    {{#  if(d.status == 1){ }}
    <div class="layui-icon layui-icon-radio" style="font-family: '微软雅黑';color: #00FF00">&nbsp;未读</div>
    {{#  } else { }}
    <div class="layui-icon layui-icon-read" style="font-family: '微软雅黑';">&nbsp;已读</div>
    {{#  } }}
</script>





</html>
