<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2019/9/25
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css"/>
    <script src="static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item" style="margin-left: 50px;">
        <a href="" style="color: green;">SMS聊天室</a>
    </li>
    <li class="layui-nav-item"style="margin-left: 1100px;">
        <a href="SMS.login.jsp"><img src="//t.cn/RCzsdCq" class="layui-nav-img">${account}</a>
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
            <a href="">发消息</a>
        </div>
    </div>

    <form action="WriteServlet" method="post" enctype="multipart/form-data">
    <div class="">
        <span style="position: absolute;top:60px ;left: 250px;">接收人:</span>
    </div>
    <div class="">
        <span style="position: absolute;top:60px ;left: 700px;">消息标题:</span>
    </div>
    <input type="text" placeholder="请输入标题" name="subject" style="height: 35px;width: 200px; position: absolute;top:55px ;left: 800px;" />

    <select name="user" id ="user" lay-verify=""style="position: absolute;left: 350px;top: 55px;height: 40px;width: 200px;" >
        <option value="">张三</option>
        <option value="">李四</option>
        <option value="">王五</option>
        <option value="">赵六</option>
        <option value="">田七</option>

    </select>

    <div class="">
        <span style="position: absolute;top:110px ;left: 360px;">消息内容:</span>
    </div>
    <div class="" style="margin-left:100px;position: absolute;left: 360px;top: 110px;height: 200px;width: 800px;">
        <textarea class="layui-textarea" name = "content" id="LAY_demo1" style="display: none;"></textarea>
    </div>
    <div class="">
        <span style="position: absolute;top:450px ;left: 360px;">附件:</span>
    </div>

    <div>
        <input  type ="file" name = "Myfile" style="margin-left: 100px; height: 50px;position: absolute;left: 360px;top:450px"/>
    </div>
    <!--<div class="layui-upload-drag" id="test10" style="margin-left: 100px; height: 50px;position: absolute;left: 360px;top:450px">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
    </div>-->


    <div class="">
        <input type="submit" class="layui-btn" style="margin-left: 100px;position: absolute;left: 360px;top: 500px;">
        <!--<a href="operationServlet?action = write" class="layui-btn" style="margin-left: 100px;position: absolute;left: 360px;top: 580px;">发送</a>-->
    </div>
    </form>

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
        </dl>-->
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


    layui.use('layedit', function(){
        var layedit = layui.layedit
            ,$ = layui.jquery;

        //构建一个默认的编辑器
        var index = layedit.build('LAY_demo1');

        //编辑器外部操作
        var active = {
            content: function(){
                alert(layedit.getContent(index)); //获取编辑器内容
            }
            ,text: function(){
                alert(layedit.getText(index)); //获取编辑器纯文本内容
            }
            ,selection: function(){
                alert(layedit.getSelection(index));
            }
        };

        $('.site-demo-layedit').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //自定义工具栏
        layedit.build('LAY_demo2', {
            tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
            ,height: 100
        })
    });






</script>
</html>
