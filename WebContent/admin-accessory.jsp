<!doctype html>
<%@page import="cn.bean.Accessory"%>
<%@page import="cn.dao.AccessoryDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>安全附件管理</title>
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
<%@ include file="head.txt"%>
  <!-- sidebar end -->
  
  <!-- content start -->
 	

  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">安全附件</strong> / <small>accessory</small></div>
      </div>
		
      <hr>
      
      <!-- 添加附件模态框 -->
      <div id="add-accessory-modal" title="添加附件" style="display:none;">
      <form id="add-accessory-form">
        <table class="am-table">
          <tr><td>附件编号</td><td><input type="text" name="id"></td></tr>
          <tr><td>所属设备</td><td><input type="text" name="equipment"></td></tr>
          <tr><td>附件种类</td><td>    <div>
      								<select name="variety">
       								<option>温度计</option>
      								<option>浓度报警器</option>
        							<option>压力表</option>
      								</select>
    								</div>
          <!--  <input type="text" name="variety">--></td></tr>
          <tr><td>检查周期(月)</td><td><input type="text" name="period" id="spinner"></td></tr>
          <tr><td>上次检查时间</td><td><input type="text" name="lastTime" id="datepicker" data-am-datepicker></td></tr>
          <tr><td>状态</td><td><input type="text" name="state"></td></tr>
        </table>
      </form>
  	  </div>
  	  
  	  <!-- 新增巡检记录模态框 -->
  	  <div id="add-rec-modal" title="新增巡检" style="display:none">
  	  <form id="add-rec-form">
  	  	<table class="am-table">
  	  		<tr><td>检测内容</td><td></td></tr>
  	  		<tr><td>1.外观及结构</td><td></td></tr>
  	  		<tr><td>内容或要求</td><td>正常</td></tr>
  	  		<tr><td>检定结果</td><td><input type="text" name="facade"></td></tr>
  	  		<tr><td>2.正常响应</td><td></td></tr>
  	  		<tr><td>内容或要求</td><td>正常</td></tr>
  	  		<tr><td>检定结果</td><td><input type="text" name="answer"></td></tr>
  	  		<tr><td>3.示值误差</td><td></td></tr>
  	  		<tr><td>内容或要求</td><td>±5%FS</td></tr>
  	  		<tr><td>检定结果</td><td><input type="text" name="range"></td></tr>
  	  		<tr><td>4.最终检测结果</td><td></td></tr>
  	  		<tr><td>内容或要求</td><td>全部合格</td></tr>
  	  		<tr><td>检定结果</td><td><input type="text" name="jcResult"></td></tr>
  	  	</table>
  	  </form>
  	  </div>
  	  <!-- 提示信息模态框 -->
  	  <div id="msg-modal" title="提示" style="display:none">
  	  	<p></p>
  	  </div>
  	  <!-- 删除 信息模态框-->
  	  <div id="delete-acc-modal" title="删除附件" style="display:none">
  	  	<p>确定删除该附件吗？</p>
  	  </div>
  	  
  	  <!-- 编辑信息模态框 -->
  	  <div id="edit-acc-modal" title="编辑" style="display:none">
  	  	<form id="edit-acc-form">
  	  	  <table class="am-table">
          <tr><td>附件编号</td><td><input type="text" name="id"></td></tr>
          <tr><td>所属设备</td><td><input type="text" name="equipment"></td></tr>
          <tr><td>附件种类</td><td>    <div>
      								<select name="variety">
       								<option>温度计</option>
      								<option>浓度报警器</option>
        							<option>压力表</option>
      								</select>
    								</div>
          <!--  <input type="text" name="variety">--></td></tr>
          <tr><td>检查周期(月)</td><td><input type="text" name="period" id="spinner2"></td></tr>
          <tr><td>上次检查时间</td><td><input type="text" name="lastTime" id="datepicker2" data-am-datepicker></td></tr>
          <tr><td>状态</td><td><input type="text" name="state"></td></tr>
        </table>
  	  	</form>
  	  </div>
  	  <!-- 查询功能 -->
     <div class="am-tabs-bd"> 
      <form class="am-form" action="accessoryServlet" method="get">
      	<div class="am-g am-margin-top">
        	<div class="am-u-sm-4 am-u-md-2 am-text-right">
      			附件编号：
      		</div>
      		<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
     		 	<input type="text" class="am-input-sm" name="id">
            </div>
      	</div>
      	<div class="am-g am-margin-top">
        	<div class="am-u-sm-4 am-u-md-2 am-text-right">
      			所属设备：
      		</div>
      		<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
     		 	<input type="text" class="am-input-sm" name="equipment">
            </div>
      	</div>
      	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<button type="submit" class="am-btn am-btn-primary">查询</button>
      	<button type="reset" class="am-btn am-btn-primary">重置</button>
      </form>
      <br>

      </div>
      <div class="am-g">

       <div class="am-g">
        <div class="am-u-sm-12">
		  <div class="am-u-sm-12 am-u-md-6">

                <a class="am-btn am-btn-default" id="add">新增</a>

          </div>
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
              	<th class="table-check"><input type="checkbox" /></th>
                <th>附件编号</th>
                <th>所属设备</th>
                <th>附件种类</th>
                <th>检查周期(月)</th>
                <th>上次检查时间</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <%
              AccessoryDaoImpl adil =new AccessoryDaoImpl();
              //String sql ="SELECT * FROM accessory";
          	  String sql;
          	  if(session.getAttribute("seachACC")!=null){
          	     sql =(String)session.getAttribute("seachACC");            	   
          	    }else{
          		sql="select * From accessory";  
          	  }
              Object[] params = {};
              List<Accessory> acclist= adil.getAccessoryList(sql, params);
              request.setAttribute("acclist", acclist);
              %>
                <c:forEach var="acc" items="${acclist}" varStatus="status">
            	<tr>
            	<td><input type="checkbox" /></td>
            	<td><c:out value="${acc.id}" default="无"/></td>
            	<td><c:out value="${acc.equipment}" default="无"/></td>
            	<td><c:out value="${acc.variety}" default="无"/></td>
            	<td><c:out value="${acc.period}" default="无"/></td>
            	<td><c:out value="${acc.lastTime}" default="无"/></td>
            	<td><c:out value="${acc.state}" default="无"/></td>
            	<td>
            		<div class="am-btn-toolbar">	
            		<div class="am-btn-group am-btn-group-xs">
            		<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"
            		onclick="addRec('${acc.id}','${user.username}','${acc.lastTime}',)">
            		<span class="am-icon-plus"></span>新增巡查</button>
             	 	<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" 
             	 	onclick="editAcc('${acc.id}','${acc.equipment}','${acc.variety}','${acc.period}','${acc.lastTime}','${acc.state}')">
               		<span class='am-icon-pencil-square-o'></span> 编辑</button>
 					<button type="button" class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only'
 					 onclick="deleteAcc('${acc.id}')">
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
  $(function(){
	  $("#spinner").spinner();
	  //$("#datepicker").datepicker();
	  $("#add").button().on("click",function(){
		  //载入前清空显示区域
		  	$("#add-accessory-form")[0].reset();
			$("#add-accessory-modal").dialog({
			      resizable: true,
			      modal: true,
			      width:"400px",
			      buttons: {
			        "提交": function() {
			         addAcc();
			        },
			        "取消": function() {
			          $(this).dialog("close");
			        },
			      },
			    });			
		});	

  });
  
  //添加
  function addAcc(){
	  var aey=$("#add-accessory-form").serializeJSON();
	  var aeyStr=JSON.stringify(aey);
	  console.log(aeyStr);
	  
	  $.ajax({
		  type:"POST",
		  url:"accessoryServlet",
		  data:aeyStr,
		  contentType: 'application/json;charset=utf-8',
		  dataType:"json",
		  success:function(data){
			  
			  if(data.isSuccess){
				  $("#add-accessory-modal").dialog("close");
				  showMsg("添加成功");
			  }else{
				  $("#add-accessory-modal").dialog("close");
				  showMsg("添加失败");
			  }
		  },
		  error:function(){
			console.log("ajax error");  
		  },
	  });
  }
  //新增巡检
  function addRec(id,user,lastTime){
	  
	  $("#add-rec-form")[0].reset();
	  //显示模态框
	  $("#add-rec-modal").dialog({
		  resizable:false,
		  modal:true,
		  width:"400px",
		  buttons:{
				"确认":function(){
					var data=$("#add-rec-form").serializeJSON();
					data.id=id;
					data.user=user;
					data.lastTime=lastTime;
					var dataStr = JSON.stringify(data);
					$.ajax({
						type:"POST",
						url:"recordServlet",
						data:dataStr,
						contentType: 'application/json;charset=utf-8',
						dataType:"json",
						success:function(data){
								
							if(data.isSuccess){
								$("#add-rec-modal").dialog("close");
								showMsg("操作成功！");
							}else{
								$("#add-rec-modal").dialog("close");
								showMsg("操作失败！");
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
  //删除
  function deleteAcc(id){
	  //将id封装成json格式数据
	  var data={};
	  data.id=id;
	  var dataStr = JSON.stringify(data);	  
	  //显示删除模态框
	  $("#delete-acc-modal").dialog({
		  resizable:false,
		  modal:true,
		  buttons:{
			"确认":function(){
				$.ajax({
					type:"DELETE",
					url:"accessoryServlet",
					data:dataStr,
					contentType: 'application/json;charset=utf-8',
					dataType:"json",
					success:function(data){
							
						if(data.isSuccess){
							$("#delete-acc-modal").dialog("close");
							showMsg("删除成功！");
						}else{
							$("#delete-acc-modal").dialog("close");
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
  //显示编辑模态框
  function editAcc(id,equipment,variety,period,lastTime,state){
	  $("#spinner2").spinner();
	  $("#datepicker2").datepicker();
	  $("#edit-acc-form")[0].reset();
	  //表单赋值
	  $("#edit-acc-form input[name='id']").val(id);
	  $("#edit-acc-form input[name='equipment']").val(equipment);
	  $("#edit-acc-form input[name='variety']").val(variety);
	  $("#edit-acc-form input[name='period']").val(period);
      $("#datepicker2").datepicker("setValue",lastTime);
	  $("#edit-acc-form input[name='state']").val(state);
	  
	  $("#edit-acc-modal").dialog({
		  resizable:false,
		  modal:true,
		  width:"400px",
		  buttons:{
			"提交":function(){
				updateAcc();
			},
			"取消":function(){
				$(this).dialog("close");
			},
		  },
	  });
  }
  
  //更新附件
  function updateAcc(){
	  //获取序列化表单信息
	  var aey=$("#edit-acc-form").serializeJSON();
	  var aeyStr=JSON.stringify(aey);
	  
	  $.ajax({
		  type:"PUT",
		  url:"accessoryServlet",
		  data:aeyStr,
		  contentType: 'application/json;charset=utf-8',
		  dataType:"json",
		  success:function(data){			  
			  if(data.isSuccess){
				  $("#edit-acc-modal").dialog("close");
				  showMsg("更新成功！");
			  }else{
				  $("#edit-acc-modal").dialog("close");
				  showMsg("更新失败！");				  
			  }
		  },
		  error:function(){
			console.log("ajax error");  
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