<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    
    <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
  	<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
  	<link rel="stylesheet" href="../css/style.css" media="all">
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div>
    <fieldset class="layui-elem-field layui-field-title" >
	    <legend>报警信息</legend>
  	</fieldset>
	   <hr class="layui-bg-green">
        <div class="layui-form self-form">
          <div class="layui-form-item">
              <label class="layui-form-label">
                 	 股道
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="trackName" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
			          
          <div class="layui-form-item">
              <label class="layui-form-label">
                 	 车次
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="trainNo" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label">
                 	 报警岗点
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="postName" name="postName" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label">
                 	 报警内容
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="alarmType" name="alarmType" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label">
                  	报警时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="alarmTime" lay-verify="required"
                  autocomplete="off" disabled="disabled" class="layui-input job-date">
              </div>
          </div>
          </div>
	  </div>
  </body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		if($("#alarmType").val() == 1){
			$("#alarmType").val("列检作业未接收");
			$("#postName").val("列检");
		}
		if($("#alarmType").val() == 2){
			$("#alarmType").val("货检作业未接收");
			$("#postName").val("货检");
		}
		if($("#alarmType").val() == 3){
			$("#alarmType").val("车号作业未接收");
			$("#postName").val("车号");
		}
		if($("#alarmType").val() == 4){
			$("#alarmType").val("防溜作业未接收");
			$("#postName").val("防溜");
		}
		if($("#alarmType").val() == 5){
			$("#alarmType").val("列尾作业未接收");
			$("#postName").val("列尾");
		}
	});
</script>	
</html>