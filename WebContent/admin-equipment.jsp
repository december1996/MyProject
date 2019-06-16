<!doctype html>
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
  <title>设备管理</title>
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

  <%@ include file="head.txt"%>
  <!-- sidebar end -->
  
  <!-- content start -->
  	  <!-- 编辑信息模态框 -->
  	  <div id="edit-equ-modal" title="编辑" style="display:none">
  	  	<form id="edit-equ-form">
  	  	  <table class="am-table">
          <tr><td>设备编号</td><td><input type="text" name="number"></td></tr>
          <tr><td>部门</td><td>   	<div>
      								<select name="department">
       								<option>热力供水部</option>
      								<option>一厂</option>
        							<option>二厂</option>
      								</select>
    								</div>
          							</td></tr>
    	  <tr><td>危险点</td><td><input type="text" name="danger"></td></tr>
          <tr><td>状态</td><td><input type="text" name="condition"></td></tr>
          <tr><td>负责人</td><td><input type="text" name="user"></td></tr>
        </table>
  	  	</form>
  	  </div>
  	  
  	  <!-- 提示信息模态框 -->
  	  <div id="msg-modal" title="提示" style="display:none">
  	  	<p></p>
  	  </div>
  	  
  	  <!-- 删除 信息模态框-->
  	  <div id="delete-equ-modal" title="删除设备" style="display:none">
  	  	<p>确定删除该设备吗？(需先删除该设备包含的附件)</p>
  	  </div>
  	  
  	  
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">设备</strong> / <small>equipment</small></div>
      </div>
      
      <hr>
     <div class="am-tabs-bd"> 
      <form class="am-form" action="seachEquipment" method="post">
      	<div class="am-g am-margin-top">
        	<div class="am-u-sm-4 am-u-md-2 am-text-right">
      			设备编号：
      		</div>
      		<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
     		 	<input type="text" class="am-input-sm" name="id">
            </div>
      	</div>
      	<div class="am-g am-margin-top">
        	<div class="am-u-sm-4 am-u-md-2 am-text-right">
      			部门名称：
      		</div>
      		<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
     		 	<input type="text" class="am-input-sm" name="department">
            </div>
      	</div>
      	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<button type="submit" class="am-btn am-btn-primary">查询</button>
      	<button type="reset" class="am-btn am-btn-primary">重置</button>
      </form>
      <br>

      </div>
      <div class="am-g">
        <div class="am-u-sm-12">
         <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
              <div class="am-btn-group am-btn-group-xs">
                <a class="am-btn am-btn-default" href="admin-addEquipment.jsp" id="add">新增</a>
              </div>
            </div>
          </div>
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th >设备编号</th>
                <th >部门</th>
                <th class="table-type">危险点</th>
                <th class="table-author am-hide-sm-only">状态</th>
                <th class="table-date am-hide-sm-only">负责人</th>
                <th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
              <%
              	User user = (User)request.getSession().getAttribute("user");
              	String uid=user.getUsername();
              	
              	EquipmentsDaoImpl edip = new EquipmentsDaoImpl();
                List<Equipment> equiplist = new ArrayList<Equipment>();
            	String sql;
            	if(session.getAttribute("seachEQM")!=null){
            	   sql =(String)session.getAttribute("seachEQM");            	   
            	  }else{
            		//sql="select * From equipment"; 
            		sql = String.format("select * From equipment where user='%s'",uid);
            		
            	  }
            	Object[] params={};
            	equiplist=edip.getEquipmentsList(sql, params);
            	request.setAttribute("equiplist",equiplist);
            	%>
            	<c:forEach var="equip" items="${equiplist}" varStatus="status">
            	<tr>
            	<td><input type="checkbox" /></td>
            	<td><c:out value="${equip.number}" default="无"/></td>
            	<td><c:out value="${equip.department}" default="无"/></td>
            	<td><c:out value="${equip.danger}" default="无"/></td>
            	<td><c:out value="${equip.condition}" default="无"/></td>
            	<td><c:out value="${equip.user}" default="无"/></td>
            	<td>
            	<div class="am-btn-toolbar">	
            	<div class="am-btn-group am-btn-group-xs">
            		<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" 
            			onclick="editEqu(${equip.number},'${equip.department}','${equip.danger}','${equip.condition}','${equip.user}')">
            		<span class="am-icon-pencil-square-o"></span> 编辑</button>
            		<button type="button" class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only' 
            		onclick="deleteEqu(${equip.number})">
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
	$("#add").button();
})
//显示编辑设备信息
function editEqu(number,department,danger,conditions,user){
	$("#edit-equ-form")[0].reset();//清空表单
	//表单赋值
	$("#edit-equ-form input[name='number']").val(number);
	$("#edit-equ-form input[name='department']").val(department);
	$("#edit-equ-form input[name='danger']").val(danger);
	$("#edit-equ-form input[name='condition']").val(conditions);
	$("#edit-equ-form input[name='user']").val(user);
	
	$("#edit-equ-modal").dialog({
		resizable: false,
		modal: true,
		width:"400px",
		buttons:{
			"提交":function(){
				updateEqu();
			},
			"取消":function(){
				$(this).dialog("close");
			},
		},
	});
}

//更新设备
function updateEqu(){
	
	var equ=$("#edit-equ-form").serializeJSON();
	var equStr=JSON.stringify(equ);
	
	$.ajax({
		type:"PUT",
		url:"equipmentServlet",
		data:equStr,
		contentType: 'application/json;charset=utf-8',
		dataType:"json",
		success:function(data){
			
			if(data.isSuccess){
				$("#edit-equ-modal").dialog("close");
				showMsg("更新设备信息成功！");
			}else{
				$("#edit-equ-modal").dialog("close");
				showMsg("更新设备信息失败！");
			}
		},
		error:function(){
			console.log("ajax error");
		},
	});
}
//删除设备
function deleteEqu(number){
	  var data={};
	  data.number=number;
	  var dataStr = JSON.stringify(data);	  
	  //显示删除模态框
	  $("#delete-equ-modal").dialog({
		  resizable:false,
		  modal:true,
		  buttons:{
			"确认":function(){
				$.ajax({
					type: "DELETE",
					url:"equipmentServlet",
					data:dataStr,
					contentType: 'application/json;charset=utf-8',
					dataType:"json",
					success:function(data){
							
						if(data.isSuccess){
							$("#delete-equ-modal").dialog("close");
							showMsg("删除成功！");
						}else{
							$("#delete-equ-modal").dialog("close");
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
