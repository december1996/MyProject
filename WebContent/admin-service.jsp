<!doctype html>
<%@page import="cn.bean.User"%>
<%@page import="cn.bean.Record"%>
<%@page import="cn.dao.RecordDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.bean.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<%@ page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>业务查询</title>
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

  <%@ include file="head.txt"%>
  <!-- sidebar end -->
  
  <!-- content start -->
  
  	  <!-- 提示信息模态框 -->
  	  <div id="msg-modal" title="提示" style="display:none">
  	  	<p></p>
  	  </div>
  	  
  	  <!-- 删除 信息模态框-->
  	  <div id="delete-rec-modal" title="删除附件" style="display:none">
  	  	<p>确定删除？</p>
  	  </div>
  	  
  	  <!-- 显示巡检记录模态框 -->
  	  <div id="read-rec-modal" title="巡检记录" style="display:none">
  	  <form id="read-rec-form">
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
  	  
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">业务查询</strong> / <small>Business queries</small></div>
      </div>
      
      <hr>
     <div class="am-tabs-bd"> 
      <form class="am-form" action="recordServlet" method="get">
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
      			检查人：
      		</div>
      		<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
     		 	<input type="text" class="am-input-sm" name="user">
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
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th >附件编号</th>
                <th class="table-title">上次检查时间</th>
                <th class="table-type">检查人</th>
                <th class="table-author am-hide-sm-only">创建时间</th>
                <th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
              <%
              User user = (User)request.getSession().getAttribute("user");
              String uid=user.getUsername();
              
              RecordDaoImpl recordDaoImpl=new RecordDaoImpl();
              String sql;
              
              if(session.getAttribute("seachREC")!=null){
           	   sql =(String)session.getAttribute("seachREC");            	   
           	  }else{
           		//sql="select * From record";
           		sql = String.format("select * From record where user='%s'",uid);
           	  }
              Object[] params={};
              List<Record> recList=recordDaoImpl.getRecordList(sql, params);
              request.setAttribute("reclist", recList);
              %>	
          	  <c:forEach var="rec" items="${reclist}" varStatus="status">
          	  	<tr>
          	  		<td><input type='checkbox' /></td>
          	  		<td><c:out value="${rec.id}" default="无"/></td>
          	  		<td><c:out value="${rec.time}" default="无"/></td>
          	  		<td><c:out value="${rec.user}" default="无"/></td>
          	  		<td><c:out value="${rec.ctime}" default="无"/></td>
          	  		<td>
          	  		<div class="am-btn-toolbar">	
            		<div class="am-btn-group am-btn-group-xs">
          	  		<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" 
            			onclick="readRec('${rec.facade}','${rec.answer}','${rec.range}','${rec.jcresult}')">
            		<span class="am-icon-pencil-square-o"></span> 查看详情</button>
            		<button type="button" class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only' 
            		onclick="deleteRec('${rec.number}')">
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
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>

//查看巡检
function readRec(facade,answer,range,jcresult){
	$("#read-rec-form")[0].reset();
	$("#read-rec-form input[name='facade']").val(facade);
	$("#read-rec-form input[name='facade']").attr("readonly","readonly");
	$("#read-rec-form input[name='answer']").val(answer);
	$("#read-rec-form input[name='answer']").attr("readonly","readonly");
	$("#read-rec-form input[name='range']").val(range);
	$("#read-rec-form input[name='range']").attr("readonly","readonly");
	$("#read-rec-form input[name='jcResult']").val(jcresult);
	$("#read-rec-form input[name='jcResult']").attr("readonly","readonly");
	
	$("#read-rec-modal").dialog({
		resizable:false,
		modal:true,
		width:"400px",
	});
}

//删除记录
function deleteRec(number){
	  var data={};
	  data.number=number;
	  var dataStr = JSON.stringify(data);	  
	  //显示删除模态框
	  $("#delete-rec-modal").dialog({
		  resizable:false,
		  modal:true,
		  buttons:{
			"确认":function(){
				$.ajax({
					type: "DELETE",
					url:"recordServlet",
					data:dataStr,
					contentType: 'application/json;charset=utf-8',
					dataType:"json",
					success:function(data){
							
						if(data.isSuccess){
							$("#delete-rec-modal").dialog("close");
							showMsg("删除成功！");
						}else{
							$("#delete-rec-modal").dialog("close");
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
function test(id){
		alert(id);
	}
</script>
</body>
</html>
