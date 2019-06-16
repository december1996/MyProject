<!doctype html>
<%@page import="cn.dao.UserDaoImpl"%>
<%@page import="cn.bean.User"%>
<%@page import="cn.bean.Equipment"%>
<%@page import="cn.dao.EquipmentsDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.bean.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<%@ page import="java.sql.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js fixed-layout">
<head>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
  <script src="assets/js/jquery.serializejson.min.js"></script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>用户管理</title>
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
</head>
<body>

  <%@ include file="adminhead.jsp"%>
  <!-- sidebar end -->
  
  <!-- content start -->
  	  <!-- 添加用户模态框 -->
      <div id="add-user-modal" title="添加用户" style="display:none;">
      <form id="add-user-form">
        <table class="am-table">
          <tr><td>用户名</td><td><input type="text" name="username"></td></tr>
          <tr><td>账号</td><td><input type="text" name="uid"></td></tr>
          <tr><td>密码</td><td><input type="text" name="password"></td></tr>
          <tr><td>部门</td><td>    <div>
      								<select name="department">
       								<option>热力供水场</option>
      								<option>一厂</option>
        							<option>二厂</option>
        							<option>人事部</option>
      								</select>
    								</div>
          <!--  <input type="text" name="variety">--></td></tr>
          <tr><td>电话</td><td><input type="text" name="tell"></td></tr>
          <tr><td>角色</td><td><input type="text" name="role"></td></tr>
        </table>
      </form>
  	  </div>
  	  <!-- 编辑信息模态框 -->
  	  <div id="edit-user-modal" title="编辑" style="display:none">
  	  	<form id="edit-user-form">
  	  	  <table class="am-table">
          <tr><td>用户名</td><td><input type="text" name="username"></td></tr>
          <tr><td>账号</td><td><input type="text" name="uid"></td></tr>
          <tr><td>密码</td><td><input type="text" name="password"></td></tr>
          <tr><td>部门</td><td>    <div>
      								<select name="department">
       								<option>热力供水部</option>
      								<option>一厂</option>
        							<option>二厂</option>
        							<option>人事部</option>
      								</select>
    								</div>
          <!--  <input type="text" name="variety">--></td></tr>
          <tr><td>电话</td><td><input type="text" name="tell"></td></tr>
          <tr><td>角色</td><td><input type="text" name="role"></td></tr>
        </table>
  	  	</form>
  	  </div>
  	  
  	  <!-- 提示信息模态框 -->
  	  <div id="msg-modal" title="提示" style="display:none">
  	  	<p></p>
  	  </div>
  	  
  	  <!-- 删除 信息模态框-->
  	  <div id="delete-user-modal" title="删除用户" style="display:none">
  	  	<p>确定删除该用户吗？</p>
  	  </div>
  	  
  	  
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户</strong> / <small>user</small></div>
      </div>
      
      <hr>

      <div class="am-g">
        <div class="am-u-sm-12">
         <div class="am-u-sm-12 am-u-md-6">

                <a class="am-btn am-btn-default"  id="add">新增</a>

          </div>
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th >用户名</th>
                <th >账号</th>
                <th class="table-type">密码</th>
                <th class="table-author am-hide-sm-only">部门</th>
                <th class="table-date am-hide-sm-only">电话</th>
                <th>角色</th>
                <th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
              <%
              
              	UserDaoImpl daoImpl=new UserDaoImpl();
                List<User> userlist = new ArrayList<User>();
            	String sql;
            	sql="select * From user"; 
            		
            	Object[] params={};
            	userlist=daoImpl.getUserList(sql, params);
            	request.setAttribute("userlist",userlist);
            	%>
            	<c:forEach var="user" items="${userlist}" varStatus="status">
            	<tr>
            	<td><input type="checkbox" /></td>
            	<td><c:out value="${user.username}" default="无"/></td>
            	<td><c:out value="${user.uid}" default="无"/></td>
            	<td><c:out value="${user.password}" default="无"/></td>
            	<td><c:out value="${user.department}" default="无"/></td>
            	<td><c:out value="${user.tell}" default="无"/></td>
            	<td><c:out value="${user.role}" default="无"/></td>
            	<td>
            	<div class="am-btn-toolbar">	
            	<div class="am-btn-group am-btn-group-xs">
            		<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" 
            			onclick="">
            		<span class="am-icon-pencil-square-o"></span> 编辑</button>
            		<button type="button" class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only' 
            		onclick="deleteUser('${user.uid}')">
            		<span class='am-icon-trash-o'></span> 删除</button>
            		</div>
            		</div>
            	</td>
            	</tr>
            	
            	</c:forEach> 
          
              </tbody>
            </table>
            <hr />
            <p>注：.....</p>
          </form>
        </div>

      </div>
    </div>

    <footer class="admin-content-footer">
      <hr>
    </footer>

  </div>
  <!-- content end -->


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

$(function(){
	$("#add").button().on("click",function(){
		  //载入前清空显示区域
	  	$("#add-user-form")[0].reset();
		$("#add-user-modal").dialog({
		      resizable: true,
		      modal: true,
		      width:"400px",
		      buttons: {
		        "提交": function() {
		         addUser();
		        },
		        "取消": function() {
		          $(this).dialog("close");
		        },
		      },
		    });			
	});
});
function addUser(){
	var data=$("#add-user-form").serializeJSON();
	var dataStr=JSON.stringify(data);
	console.log(dataStr);
	$.ajax({
		type:"POST",
		url:"userServlet",
		data:dataStr,
		contentType: 'application/json;charset=utf-8',
		dataType:"json",
		success:function(data){
			
			if(data.isSuccess){
				$("#add-user-modal").dialog("close");
				showMsg("添加用户成功！");
			}else{
				$("#add-user-modal").dialog("close");
				showMsg("添加用户失败！");
			}
		},
		error:function(){
			console.log("ajax error");
		},
	});
}

//删除用户
function deleteUser(uid){
	  var data={};
	  data.uid=uid;
	  var dataStr = JSON.stringify(data);	  
	  //显示删除模态框
	  $("#delete-user-modal").dialog({
		  resizable:false,
		  modal:true,
		  buttons:{
			"确认":function(){
				$.ajax({
					type: "DElETE",
					url:"userServlet",
					data:dataStr,
					contentType: 'application/json;charset=utf-8',
					dataType:"text",
					success:function(datas){
							console.log(datas);
						if(datas.isSuccess){
							$("#delete-user-modal").dialog("close");
							showMsg("删除成功！");
						}else{
							$("#delete-user-modal").dialog("close");
							showMsg("删除失败！");
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
