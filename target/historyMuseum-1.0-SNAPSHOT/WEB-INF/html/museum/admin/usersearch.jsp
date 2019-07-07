<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="museum.entity.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    List<User> list=(List<User>)request.getAttribute("SearchList");
    String userId=String.valueOf(request.getAttribute("userId"));
    String userName=String.valueOf(request.getAttribute("userName"));
    String i=String.valueOf(request.getAttribute("maxPage"));
    String j=String.valueOf(request.getAttribute("page"));
    String id=String.valueOf(request.getSession().getAttribute("User_Id"));
    String root=String.valueOf(request.getSession().getAttribute("User_root"));
    int maxPage=Integer.valueOf(i);
    int nowPage=Integer.valueOf(j);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>
    <meta name="twitter:card" content=""/>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../resourcesOne/bootStrap/bootstrap.min.css">
    <link rel="stylesheet" href="../resourcesOne/asserts/css/amazeui.css"/>
    <link rel="stylesheet" href="../resourcesOne/asserts/css/amazeui.mineeeee.css">
    <link rel="stylesheet" href="../resourcesOne/asserts/css/amazeui.flat.css">
    <link rel="stylesheet" href="../resourcesOne/asserts/css/admin.css">>
    <![endif]-->
</head>


<html class="no-js">
<body>

<div class="am-cf admin-main">

    <div class="nav-navicon admin-main admin-sidebar">

        <font size=3>
            <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：</div>
            <div class="sideMenu">
                <h3 class="am-icon-flag">展馆管理</h3>
                <ul>
                    <li><a href="/manage/count">展馆信息</a></li>
                </ul>
                <h3 class="am-icon-volume-up"><em></em> 咨询管理</h3>
                <ul>
                    <li><a href="/Activity/list?p=1&size=5&type=1">展厅活动</a></li>
                    <li><a href="/news/list?p=1&size=5">展馆新闻</a></li>
                    <li><a href="/Activity/list?p=1&size=5&type=2">专题讲座</a></li>
                </ul>
                <h3 class="am-icon-users"><em></em> 用户管理</h3>
                <ul>
                    <li><a href="/adminuser/list?p=1&size=5&type=1">用户信息</a></li>
                    <li><a href="/comment/list?p=1&size=5">评论信息</a></li>
                </ul>
                <h3 class="am-icon-gears"><em></em> 展品管理</h3>
                <ul>
                    <li><a href="/Exhibits/list?p=1&size=5">展品信息</a></li>
                    <li><a href="/Exhibits/hall?hallId=1&page=1&size=5">展厅展品</a></li>
                </ul>


                <h3 class="am-icon-gears"><em></em> 统计管理</h3>
                <ul>
                    <li><a href="/Record/Exlist?p=1&size=5">浏览统计</a></li>
                    <li><a href="/Collect/Exlist?p=1&size=5">收藏统计</a></li>
                </ul>
                <h3 class="am-icon-gears"><em></em> 返回</h3>
                <ul>
                    <li><a href="/user/index?User_Id=<%=id %>&User_root=<%=root%>">返回主页</a></li>
                </ul>
            </div>
        </font>
    </div>
</div>

<div class="admin-biaogelist">

    <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on"> 用户管理</ul>
        <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 > 用户管理</dl>
    </div>




    <form class="am-form am-g" method="post" action="/adminuser/delete" method="post">
        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead>
            <tr class="am-success">
                <th ></th>
                <th class="table-id">用户ID</th>
                <th class="table-title">用户名</th>
                <th class="table-type">用户权限</th>
                <th class="table-date am-hide-sm-only">用户头像</th>
            </tr>
            </thead>
            <tbody>
            <%
                for(User user : list){

            %>
            <tr>
                <td><input type="checkbox" name="id" value="<%= user.getUserId()%>" /></td>
                <td><%= user.getUserId()%></td>
                <td><%= user.getUserName()%></td>
                <%
                    if("min".equals(user.getUserRoot())){
                %>
                <td>普通用户	</td>
                <%
                }else{
                %>
                <td>管理员权限</td>
                <%

                    }
                %>
                <td><%= user.getUserImage()%></td>
                <td><div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <a href="/adminuser/findById?userId=<%= user.getUserId() %>&type=1" class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="修改用户权限"></a>
                    </div>
                </div>
                </td>
            </tr>

            <%
                }
            %>


            </tbody>
        </table>

        <div class="am-btn-group am-btn-group-xs">
            <button type="submit" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 注销勾选用户</button>
        </div>
        <ul class="am-pagination am-fr">
            <li><a href="/adminuser/findBy?userId=<%=userId %>&userName=<%=userName %>&page=1&size=5&type=1">«首页</a></li>
            <li><a href="/adminuser/findBy?userId=<%=userId %>&userName=<%=userName %>&page=<%=nowPage-1 %>&size=5&type=1">上一页</a></li>
            <li><a href="/adminuser/findBy?userId=<%=userId %>&userName=<%=userName %>&page=<%=nowPage+1 %>&size=5&type=1">下一页</a></li>
            <li><a href="/adminuser/findBy?userId=<%=userId %>&userName=<%=userName %>&page=<%=maxPage %>&size=5&type=1">末页»</a></li>
        </ul>
        <hr />
        <p>注：.....</p>
    </form>
</div>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../resourcesOne/asserts/js/app.js"></script>
<script src="../resourcesOne/asserts/js/amazeui.legacy.js"></script>
<script src="../resourcesOne/asserts/js/amazeui.js"></script>
<script src="../resourcesOne/asserts/js/amazeui.min.js"></script>
<script type="text/javascript" src="http://login.114my.cn/memberpic/dgqtqy/cssnew/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://login.114my.cn/memberpic/dgfangmai/cssnew/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        jQuery(".sideMenu").slide({
            titCell: "h3", //鼠标触发对象
            targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
            effect: "slideDown", //targetCell下拉效果
            delayTime: 300, //效果时间
            triggerTime: 150, //鼠标延迟触发时间（默认150）
            defaultPlay: true,//默认是否执行效果（默认true）
            returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
        });
    });

</script>
</body>
</html>
