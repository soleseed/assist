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
<style type="text/css">
	.self-label-lg{
		width:118px !important;
	}
	.type-liewei{
		display:none;
	}
	.type-fangliu{
		display:none;
	}
</style>
 </head>
  
<body>
    <fieldset class="layui-elem-field layui-field-title" >
	    <legend>通知信息</legend>
  	</fieldset>
   <hr class="layui-bg-green">
      <div class="layui-form self-form">
         <div class="layui-form-item">
             <label class="layui-form-label self-label-lg">
                	 股道
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="trackName" lay-verify="required"
                 autocomplete="off" class="layui-input" disabled="disabled">
             </div>
         </div>
		          
         <div class="layui-form-item">
             <label class="layui-form-label self-label-lg">
                	 车次
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="trainNo" lay-verify="required"
                 autocomplete="off" class="layui-input" disabled="disabled">
             </div>
         </div>
         
         <div class="layui-form-item">
             <label class="layui-form-label self-label-lg">
                	 反馈岗点
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="postName" lay-verify="required"
                 autocomplete="off" class="layui-input" disabled="disabled">
             </div>
         </div>
         
         <div class="layui-form-item">
             <label class="layui-form-label self-label-lg">
                	 反馈内容
             </label>
             <div class="layui-input-inline">
                 <input type="text"  id="jobType" name="jobType" lay-verify="required"
                 autocomplete="off" class="layui-input" disabled="disabled">
             </div>
         </div>
         
         <div class="layui-form-item">
             <label class="layui-form-label self-label-lg">
                 	反馈时间
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="feedbackTime" lay-verify="required"
                 autocomplete="off" disabled="disabled" class="layui-input job-date">
             </div>
         </div>
         <div class="layui-form-item type-liewei">
             <label class="layui-form-label self-label-lg">
                 	列尾设备主机号
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="deviceNo" lay-verify="required"
                 autocomplete="off" disabled="disabled" class="layui-input">
             </div>
         </div>
         <div class="layui-form-item type-fangliu">
             <label class="layui-form-label self-label-lg">
                  	防溜/撤溜位置
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="antiLocation" lay-verify="required"
                 autocomplete="off" disabled="disabled" class="layui-input">
             </div>
         </div>
         <div class="layui-form-item type-fangliu">
             <label class="layui-form-label self-label-lg">
                 	防溜/撤溜器具编号
             </label>
             <div class="layui-input-inline">
                 <input type="text" name="antiTool" lay-verify="required"
                 autocomplete="off" disabled="disabled" class="layui-input">
             </div>
         </div>
  </div>
</body>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
   <script>
    	$(document).ready(function(){
    		if($("input[name='postName']").val() === "防溜"){
    		  $(".type-fangliu").css("display","block");
    		}
    		if($("input[name='postName']").val() === "列尾"){
      		  $(".type-liewei").css("display","block");
      		}
    		if($("#jobType").val() == 1){
    			$("#jobType").val("列检作业接收完成");
    		}
    		if($("#jobType").val() == 2){
    			$("#jobType").val("商检作业接收完成");
    		}
    		if($("#jobType").val() == 3){
    			$("#jobType").val("车号作业接收完成");
    		}
    		if($("#jobType").val() == 4){
    			$("#jobType").val("防溜作业接收完成");
    		}
    		if($("#jobType").val() == 5){
    			$("#jobType").val("列尾作业接收完成");
    		}
    		if($("#jobType").val() == 6){
    			$("#jobType").val("列检作业反馈完成");
    		}
    		if($("#jobType").val() == 7){
    			$("#jobType").val("商检作业反馈完成");
    		}
    		if($("#jobType").val() == 8){
    			$("#jobType").val("车号作业反馈完成");
    		}
    		if($("#jobType").val() == 9){
    			$("#jobType").val("防溜作业反馈完成");
    		}
    		if($("#jobType").val() == 10){
    			$("#jobType").val("列尾作业反馈完成");
    		}
    	});
    </script>	
</html>