<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
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
	 <legend>列尾设备</legend>
</fieldset>
<hr class="layui-bg-green">
   <form class="layui-form self-form">
     <div class="layui-form-item">
         <label for="deviceNo" class="layui-form-label self-label">
             <span class="x-red">*</span>列尾设备主机号
         </label>
         <div class="layui-input-inline">
             <input type="text"   name="deviceNo"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="20"
             autocomplete="off" class="layui-input">
         </div>
     </div>
     <div class="layui-form-item">
         <label  class="layui-form-label self-label">
         </label>
         <button  class="layui-btn" lay-filter="add" lay-submit>
             	完成
         </button>
     </div>
 </form>
 </div>
<script src="../../../layuiadmin/layui/layui.js"></script>
<script>
    
   layui.use(['form'], function(){
       /* $ = layui.jquery; */
     var form = layui.form;

       
     //监听提交
     form.on('submit(add)', function(data){
         parent.finish();
     });
   });
</script>
</body>
</html>