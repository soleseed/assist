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
	 <legend>防溜/撤溜信息补充</legend>
</fieldset>
<hr class="layui-bg-green">
   <form class="layui-form self-form">
     <div class="layui-form-item">
         <label class="layui-form-label self-label">
             <span class="x-red">*</span><span name="isArrive">防溜/撤溜</span>器具类型
         </label>
         <div class="layui-input-inline">
              <select id="toolType" name="type" lay-verify="required" lay-filter="type">
             	  		<option value="">请选择</option>
              			<option value="1">止轮器</option>
              			<option value="2">铁鞋</option>
	          </select>
         </div>
     </div>
     
     <div class="layui-form-item">
         <label class="layui-form-label self-label">
                  <span class="x-red">*</span><span name="isArrive">防溜/撤溜</span>器具编号
          </label>
          <div class="layui-input-inline">
          	  <select id="antiTool" name="antiTool" lay-verify="required">
          	  		<option value="">请选择</option>
        		</select>
          </div>
     </div>
     <div class="layui-form-item">
         <label class="layui-form-label self-label">
             <span class="x-red">*</span><span name="isArrive">防溜/撤溜</span>位置
         </label>
         <div class="layui-input-inline">
         	  <select id="antiLocation" name="antiLocation" lay-verify="required">
         	  		<option value="">请选择</option>
          			<option value="东端一位">东端一位</option>
          			<option value="东端二位">东端二位</option>
       		</select>
         </div>
     </div>
     <div class="layui-form-item">
              <label class="layui-form-label self-label">
                  <span class="x-red">*</span>作业股道
              </label>
              <div class="layui-input-inline">
              	<input type="text"  readonly="readonly" autocomplete="off" value="${track}" class="layui-input">
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
     var form = layui.form,
     	 $ = layui.jquery;
            
          if(${isArrive} ===0){
        	$("span[name='isArrive']").html("撤溜");
	  	  }else{
	  		$("span[name='isArrive']").html("防溜");
	  	  }
          
          form.on('select(type)',function(data){
        	  var jobId = ${jobId};
        	  var type = $("#toolType").val();
        	  if(type === ''){
        		  return;
        	  }
        	  $.ajax({
	                type:"post",
	                async:false,
	                cache:false,
	                url:"${pageContext.request.contextPath }/scheduleJob/getTools?jobId="+jobId + "&type=" + type,
	                dataType:"json",
	                success:function(data,status){
	                	$("#antiTool").empty();
	                	 $.each(data,function(n,value){
		                        var str = "<option value=" + value.no + ">" + value.no + "</option>";
		 		               $("#antiTool").append(str);
		                 });
				     	form.render('select');
	                	//console.log(data);
	                }
	            });
          });
            
          //监听提交
          form.on('submit(add)', function(data){
              parent.finish();
          });
     });
</script>
</body>

</html>