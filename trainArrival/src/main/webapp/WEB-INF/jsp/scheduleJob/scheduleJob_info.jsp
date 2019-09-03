<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
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
	 <fieldset class="layui-elem-field layui-field-title" >
	    <legend>通知岗位作业</legend>
  	</fieldset>
   	<hr class="layui-bg-green">
    <div class="layui-form self-form">
		<form class="layui-form">
			<input type="hidden" name="id" value="${jobId }" class="layui-input">
			<input type="hidden" name="trackId" value="${trackId }"
				class="layui-input">
			<div class="layui-form-item info_div">
				<label class="layui-form-label">通知岗位</label>
				<div class="layui-input-block check-block">
					<!-- <input  type="checkbox" id="chehaoStatus" name="chehaoStatus" value="0" title="车号">
		      <input  type="checkbox" id="huojianStatus" name="huojianStatus" value="0" title="货检">
		      <input  type="checkbox" id="liejianStatus" name="liejianStatus" value="0" title="列检">
		      <input  type="checkbox" id="fangliuStatus" name="fangliuStatus" value="0" title="防溜">
		      <input  type="checkbox" id="lieweiStatus" name="lieweiStatus" value="0" title="列尾"> -->
				</div>
			</div>
			<div id="complete_div" class="layui-form-item" style="display: none;">
				<label class="layui-form-label"> </label>
				<button class="layui-btn" disabled="disabled">岗位已全部通知</button>

			</div>

			<div class="layui-form-item info_div">
				<label class="layui-form-label"> </label>
				<button class="layui-btn" lay-filter="send" lay-submit>确认通知</button>
			</div>
		</form>
	</div>
	
<script src="../../../layuiadmin/layui/layui.js"></script>
<script>

layui.use(['form','layer'], function(){
    /* $ = layui.jquery; */
  var form = layui.form,
  	  layer = layui.layer,
  	  $ = layui.$;
    
    if(${job.chehaoStatus == null}){
		$(".check-block").append('<input  type="checkbox" id="chehaoStatus" name="chehaoStatus" value="0" title="车号">');
	}
	if(${job.huojianStatus == null} ){
		$(".check-block").append('<input  type="checkbox" id="huojianStatus" name="huojianStatus" value="0" title="货检">');
		//$("#huojianStatus").remove();
 	}
 	if(${job.liejianStatus == null} ){
 		$(".check-block").append('<input  type="checkbox" id="liejianStatus" name="liejianStatus" value="0" title="列检">');
 		//$("#liejianStatus").remove();
 	}
 	if(${job.fangliuStatus == null}){
 		$(".check-block").append('<input  type="checkbox" id="fangliuStatus" name="fangliuStatus" value="0" title="防溜">');
 		//$("#fangliuStatus").remove();
 	}
 	if(${job.lieweiStatus == null} ){
 		$(".check-block").append('<input  type="checkbox" id="lieweiStatus" name="lieweiStatus" value="0" title="列尾">');
 		//$("#lieweiStatus").remove();
 	}
 	if(${job.chehaoStatus != null} && ${job.huojianStatus != null} && ${job.liejianStatus != null}
 		&& ${job.fangliuStatus != null} && ${job.lieweiStatus != null}){
 		$("#complete_div").css("display","block");
 		$(".info_div").css("display","none");
 	}
     
   form.render();
   //监听提交
   form.on('submit(send)', function(data){
       //发异步，把数据提交后台
       $.ajax({
 			url:"${pageContext.request.contextPath }/scheduleJob/sendInfo",
 			type:"post",
 			async: false,
 			cache : false,
 			data: data.field,
 			success:function(result){
 				if(result == 1){
 					layer.alert("通知成功", {icon: 6},function () {
	   	                // 获得frame索引
	   	                var index = parent.layer.getFrameIndex(window.name);
	   	                //关闭当前frame
	   	                parent.layer.close(index);
	   	             	window.parent.location.reload();
   	            	});
 				}else{
 					layer.alert("通知失败", {icon: 5},function () {
	   	                // 获得frame索引
	   	                var index = parent.layer.getFrameIndex(window.name);
	   	                //关闭当前frame
	   	                parent.layer.close(index);
	   	             	window.parent.location.reload();
   	            	});
 				}
 			}
 		});
       return false;
   });
   
 
 });
</script>

</body>

</html>