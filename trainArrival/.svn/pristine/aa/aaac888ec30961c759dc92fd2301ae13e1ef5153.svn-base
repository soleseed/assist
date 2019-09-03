<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
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
<div class="layui-form self-form">
  <div style="margin-top:10px;" class="layui-row" align="center">
	      <div class="layui-form-item search-form-item">
		    <div class="layui-inline">
	          <button id="searchBtn" class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i></button>
	          <button type="button" class="layui-btn" onclick="javascript:location.replace(location.href);"><i class="layui-icon">&#xe669;</i>刷新</button>
		    </div>
		  </div>
      </div>
</div>
<div class="layui-fluid">
 <hr class="layui-bg-green">
   <div class="layui-row layui-col-space15">
     <div class="layui-col-md12">
       <div class="layui-card">
         <!-- <div class="layui-card-header">用户查询</div> -->
        <div class="layui-card-body">
          <table class="layui-table" lay-filter="result" lay-even id="result-table"></table>
        </div>
      </div>
    </div>
  </div>
</div>
    
<script type="text/html" id="mytoolBar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" title="查看"><i class='layui-icon'>&#xe64c;</i></a>
</script>
<script type="text/html" id="indexTpl">
       {{d.LAY_TABLE_INDEX+1}}
</script>
	
<!-- 	1列检作业接收时分，2商检作业接收时分，
3车号作业接收时分，4防溜作业接收时分,5列尾作业接收时分，
6列检作业反馈时分，7商检作业反馈时分，
8车号作业反馈时分，9防溜作业反馈时分,10列尾作业反馈时分 -->
<script type="text/html" id="jobTypeStr">
    {{#  if(d.jobType == 1){ }}
     	列检作业接收完成
    {{#  } }}
	{{#  if(d.jobType == 2){ }}
     	商检作业接收完成
    {{#  } }}
    {{#  if(d.jobType == 3){ }}
     	车号作业接收完成
    {{#  } }}
	{{#  if(d.jobType == 4){ }}
     	防溜作业接收完成
    {{#  } }}	
	{{#  if(d.jobType == 5){ }}
     	列尾作业接收完成
    {{#  } }}
	{{#  if(d.jobType == 6){ }}
     	列检作业反馈完成
    {{#  } }}
	{{#  if(d.jobType == 7){ }}
     	商检作业反馈完成
    {{#  } }}
	{{#  if(d.jobType == 8){ }}
     	车号作业反馈完成
    {{#  } }}
	{{#  if(d.jobType == 9){ }}
     	防溜作业反馈完成
    {{#  } }}
	{{#  if(d.jobType == 10){ }}
     	列尾作业反馈完成
    {{#  } }}	
	</script>
<script src="../../../layuiadmin/layui/layui.js"></script>
<script>
layui.config({
    base: '../../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table'], function(){
	  var table = layui.table
      ,$ = layui.$; //表格
          //执行一个 table 实例
            var tableIns = table.render({
              elem: '#result-table'
              ,height: 480
              ,url: '${pageContext.request.contextPath }/jobFeedback/search' //数据接口
              ,page:true
              ,even:true
              ,cols: [[ //表头
                 /* {type:'checkbox'} */
                {field: 'id', title: 'ID', width:120}
                ,{field: 'trackName', title: '股道', width:150}
                ,{field: 'trainNo', title: '车次', width:150}
                ,{field: 'postName', title: '反馈岗点', width:150}
                ,{field: 'jobType', title: '反馈内容', templet:'#jobTypeStr', width:150}
                ,{field: 'feedbackTime', title: '反馈时间', width:200}
                ,{field: 'deviceNo', title: '列尾设备主机号', width:150}
                ,{field: 'antiTool', title: '防溜/撤溜器具编号', width:150}
                ,{field: 'antiLocation', title: '防溜/撤溜位置', width:150}
                ,{fixed: 'right', width: 100, align:'center', toolbar: '#mytoolBar'}
              ]]
            });
            
           var active = {
          	      reload: function(){
          	      //执行重载
          	      	tableIns.reload({
              	        page: {
              	          curr: 1 //重新从第 1 页开始
              	        }
              	        ,where: {
              	        }
          	      	});
          	      }
            }
              
              $('#searchBtn').on('click', function(){
                  var type = $(this).data('type');
                  active[type] ? active[type].call(this) : '';
               });
            
          	//监听工具条
            table.on('tool(result)', function(obj){ 
              //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
              var data = obj.data //获得当前行数据
              ,layEvent = obj.event; //获得 lay-event 对应的值
              if(obj.event === 'detail'){
            	//给当前页隐藏域赋值，供子页面获取
            	  layer.open({
            	        type: 2,
            	        skin: 'CLYM-style',
            	        area: ['500px','450px'],
            	        title: '',
            	        content: '${pageContext.request.contextPath }/jobFeedback/detail',
            	        success: function(layero, index){
            	            var body = layer.getChildFrame('body',index);//建立父子联系
            	            //给编辑子页面赋值
            	            body.find('input[name="trackName"]').val(data.trackName);
            	            body.find('input[name="trainNo"]').val(data.trainNo);
            	            body.find('input[name="postName"]').val(data.postName);
            	            body.find('input[name="jobType"]').val(data.jobType);
            	            body.find('input[name="feedbackTime"]').val(data.feedbackTime);
            	            body.find('input[name="deviceNo"]').val(data.deviceNo);
            	            body.find('input[name="antiLocation"]').val(data.antiLocation);
            	            body.find('input[name="antiTool"]').val(data.antiTool);
            	            body.find('input[name="antiRunningMan"]').val(data.antiRunningMan);
            	            
            	        }
            	    });
              } 
        });
 	})
</script>
</body>

</html>


















