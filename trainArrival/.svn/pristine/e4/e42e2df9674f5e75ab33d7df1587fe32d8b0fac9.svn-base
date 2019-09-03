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
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="isArrive" class="layui-form-label">
                  <span class="x-red">*</span>进/出站选择
              </label>
              <div class="layui-input-inline">
              	  <select id="isArrive" name="isArrive" lay-verify="required" lay-search="">
              	  		<option value="">请选择</option>
               			<option value="0">出站</option>
               			<option value="1">进站</option>
		          </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="trackId" class="layui-form-label">
                  <span class="x-red">*</span>到达股道
              </label>
              <div class="layui-input-inline">
              	  <select id="trackId" name="trackId" lay-verify="required" lay-search="">
              	  		<option value="">请选择</option>
		           <c:forEach items="${trackMap}" var="map"> 
               			<option value="${map.key}">${map.value}</option>
   				   </c:forEach>
		          </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="trainCount" class="layui-form-label">
                  <span class="x-red">*</span>到达辆数
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="trainCount" name="trainCount" lay-verify="number"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="trainId" class="layui-form-label">
                  <span class="x-red">*</span>到达车次
              </label>
              <div class="layui-input-inline">
              	  <select id="trainId" name="trainId" lay-verify="required" lay-search="">
              	  		<option value="">请选择</option>
		           <c:forEach items="${trainMap}" var="map"> 
               			<option value="${map.key}">${map.value}</option>
   				   </c:forEach>
		          </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="arriveTime" class="layui-form-label">
                  <span class="x-red">*</span>到达时分
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="arriveTime" name="arriveTime" lay-verify="required"
                  autocomplete="off" class="layui-input job-date">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="informTime" class="layui-form-label">
                  <span class="x-red">*</span>通知作业时间
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="informTime" name="informTime" lay-verify="required"
                  autocomplete="off" class="layui-input job-date">
              </div>
          </div>
          
          
          <div class="layui-form-item">
              <label  class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  	一键下发
              </button>
          </div>
      </form>
    </div>
    <script>
    	$(document).ready(function(){
    		
    	});
    
        layui.use(['form','layer','laydate'], function(){
            /* $ = layui.jquery; */
          var form = layui.form,
              laydate = layui.laydate
          	  layer = layui.layer;
            
        //执行一个laydate实例
          /* laydate.render({
            elem: '#arriveTime', //指定元素
           	,type: 'datetime'

          }); */
          /* 初始化多个日期控件 */
          lay('.job-date').each(function(){
		    laydate.render({
		      elem: this
		      ,type: 'datetime'
		    });
		  });

            
          //监听提交
          form.on('submit(add)', function(data){
              //发异步，把数据提交后台
              $.ajax({
        			url:"${pageContext.request.contextPath }/scheduleJob/add",
        			type:"post",
        			async: false,
        			cache : false,
        			data: data.field,
        			success:function(result){
        				if(result != 0){
        					layer.alert("一键下发成功", {icon: 6},function () {
        						//刷新父窗口
        						window.parent.location.reload();
	  	      	                // 获得frame索引
	  	      	                var index = parent.layer.getFrameIndex(window.name);
	  	      	                //关闭当前frame
	  	      	                parent.layer.close(index);
	  	      	            });
        				}else{
        					layer.alert("添加失败");
        				}
        			}
        		})
              return false;
          });
        });
    </script>

  </body>

</html>