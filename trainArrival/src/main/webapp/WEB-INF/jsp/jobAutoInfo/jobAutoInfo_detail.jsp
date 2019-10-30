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
	    <legend>反馈详情</legend>
	  </fieldset>
       <div>
	   <hr class="layui-bg-green">
        <div class="layui-form self-form">
          <div class="layui-form-item">
              <label class="layui-form-label nowrap">
                 	 股道
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="trackName" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
			          
          <div class="layui-form-item">
              <label class="layui-form-label nowrap">
                 	 车次
              </label>
              <div class="layui-input-inline">
                  <input type="text" name="trainNo" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label nowrap">
                 	反馈内容
              </label>
              <div class="layui-input-inline">
                  <input type="text" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled" value="调度作业已全部完成"/>
              </div>
          </div>
          
          <div class="layui-form-item">
              <label class="layui-form-label nowrap">
                 	 反馈时间
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="jobAutoTime" name="jobAutoTime" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          </div>
	  </div>
	  </div>
  </body>
</html>