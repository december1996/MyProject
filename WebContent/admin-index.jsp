<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>系统主页</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
  <script src="assets/js/jquery.serializejson.min.js"></script>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<%  
	String na=null;  
 	na=(String)session.getAttribute("lgin");
 	if(na==null)
 		{response.sendRedirect("login.html");}
%>
<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>安全附件</strong> <small>管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}">
  <span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span>欢迎您！${user.username} <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="admin-index.jsp"><span class="am-icon-cog"></span> 修改密码</a></li>
          <li><a href="exitServlet"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="admin-index.jsp"><span class="am-icon-home"></span>个人信息</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 数据管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">           
            <li><a href="admin-equipment.jsp"><span class="am-icon-calendar"></span>设备管理</a></li>
            <li><a href="admin-accessory.jsp"><span class="am-icon-calendar"></span>安全附件管理</a></li>
          </ul>
        </li>
        
		<li><a href="admin-service.jsp"><span class="am-icon-home"></span>业务查询</a></li>
      </ul>
      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
		   <p>您好！欢迎来到安全附件管理系统</p>
        </div>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
    <!-- 修改密码模态框 -->
  <div id ="change-password-modal" title="修改密码" Style="display: none;">
  	<p>确定修改密码？</p>
  </div>
  	  <!-- 提示信息模态框 -->
  	  <div id="msg-modal" title="提示" style="display:none">
  	  	<p></p>
  	  </div>
 <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="am-g">
                <div class="am-u-md-4">
                  <img src="assets/i/worker.jpg"></img>
                </div>
              </div>
            </div>
          </div>

          
        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form class="am-form am-form-horizontal">
			<br>
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name：</label>
              <div class="am-u-sm-9">
<!--                 <input type="text" id="user-name" placeholder="姓名 / Name"> -->
				<p><font size="5">${user.username}</font></p>
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">部门 / Department：</label>
              <div class="am-u-sm-9">
				<p><font size="5">${user.department}</font></p>
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone：</label>
              <div class="am-u-sm-9">
				<p><font size="5">${user.tell}</font></p>
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-QQ" class="am-u-sm-3 am-form-label">角色 / Role：</label>
              <div class="am-u-sm-9">
				<p><font size="5">${user.role}</font></p>
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">密码 / Password：</label>
              <div class="am-u-sm-9">
	                <input type="password" id="user-password" placeholder="请输入密码"> 
              </div>
            </div>
            
            <button type="button" style="width:30%;margin-left:280px;"class="am-btn am-btn-danger am-btn-xl" id="password" onclick="change('${user.uid}')">修改</button>
            
            
          </form>
        </div>
      </div>
    </div>

    <footer class="admin-content-footer">
      <hr>
    </footer>

  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
function change(uid){
	var password=$("#user-password").val();
	var data={};
	data.uid=uid;
	data.password=password;
	var dataStr = JSON.stringify(data);
	$("#change-password-modal").dialog({
		  resizable:false,
		  modal:true,
		  buttons:{
			"确认":function(){
				$.ajax({
					type:"PUT",
					url:"userServlet",
					data:dataStr,
					contentType: 'application/json;charset=utf-8',
					dataType:"json",
					success:function(data){
							
						if(data.isSuccess){
							$("#change-password-modal").dialog("close");
							showMsg("修改成功！");
						}else{
							$("#change-password-modal").dialog("close");
							showMsg("修改失败！");
						}
					},
					error:function(){
						console.log("ajax error");
					},
				});
			},
			"取消":function(){
				$(this).dialog("close");
			}
		  },
	});
	
}

//显示信息
function showMsg(text) {
    $("#msg-modal p").text(''); // 每次载入前先清空显示区域，防止显示之前的信息
    $("#msg-modal p").text(text);
    $("#msg-modal").dialog({
      modal: true,
    });
    // 2s后消失
    setTimeout(function() {
      $("#msg-modal").dialog("close")
      location.reload()
    },2000);
    
 }
</script>
</body>
</html>