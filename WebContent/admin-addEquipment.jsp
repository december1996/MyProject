<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="adEbean" class="cn.bean.Equipment" scope="session"></jsp:useBean>>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>添加设备</title>
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="stylesheet" href="assets/css/layui.css">
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
  
</head>
<body>
<%@ include file="head.txt"%>
  <!-- sidebar end -->
  <!-- content start -->
  
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加设备</strong> / <small>add equipment</small></div>
      </div>
      
      <hr>
      
      <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">基本信息</a></li>
      </ul>
      
       <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
          <form class="am-form"action="adEServlet" method="post">
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
               设备编号：
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="number">
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
              部门：
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm"name="department" id="bm">
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                危险点：
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm"name="danger">
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
               状态：
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm"name="condition">
              </div>
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
              负责人：     
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm"name="user" id="fzr">
              </div>
            </div>
             <div class="am-margin">
      			<button type="submit" class="am-btn am-btn-primary">添加到数据库</button>
      			<button type="reset" class="am-btn am-btn-primary">重置</button>
   		 	 </div>      
          </form> 
   		  </div>
   	   </div>
   	 </div>
   	&nbsp;&nbsp;&nbsp;&nbsp; <p>反馈信息：
   	 <jsp:getProperty property="backNews" name="adEbean"/>
   	 </p>
  		  
    </div>
  </div> 
     <footer class="admin-content-footer">
      <hr>
    </footer>

  <!-- content end -->


<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
</footer>   
 <!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
	var autobm=["热力供水场","一厂","二厂"];
	$("#bm").autocomplete({
		source:autobm
	});
</script>
   
</body>

</html>