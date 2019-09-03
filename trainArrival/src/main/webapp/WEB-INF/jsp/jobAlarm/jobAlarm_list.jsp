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
	
<!-- 1列检作业未接收报警，2商检作业未接收报警，
3车号作业未接收报警，4防溜作业未接收报警,5列尾作业未接收报警 -->
	<script type="text/html" id="alarmTypeStr">
    {{#  if(d.alarmType == 1){ }}
     	列检作业未接收
    {{#  } }}
	{{#  if(d.alarmType == 2){ }}
     	货检作业未接收
    {{#  } }}
    {{#  if(d.alarmType == 3){ }}
     	车号作业未接收
    {{#  } }}
	{{#  if(d.alarmType == 4){ }}
     	防溜作业未接收
    {{#  } }}	
	{{#  if(d.alarmType == 5){ }}
     	列尾作业未接收
    {{#  } }}
	</script>
	<script type="text/html" id="postStr">
    {{#  if(d.alarmType == 1){ }}
     	列检
    {{#  } }}
	{{#  if(d.alarmType == 2){ }}
     	货检
    {{#  } }}
    {{#  if(d.alarmType == 3){ }}
     	车号
    {{#  } }}
	{{#  if(d.alarmType == 4){ }}
     	防溜
    {{#  } }}	
	{{#  if(d.alarmType == 5){ }}
     	列尾
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
              ,even: true
              ,url: '${pageContext.request.contextPath }/jobAlarm/search' //数据接口
              ,page:true
              ,cols: [[ //表头
                 /* {type:'checkbox'} */
                {field: 'id', title: 'ID', width:120}
                ,{field: 'trackName', title: '股道', width:150}
                ,{field: 'trainNo', title: '车次', width:150}
                ,{field: 'postName', title: '报警岗点', templet:'#postStr', width:150}
                ,{field: 'alarmType', title: '报警内容', templet:'#alarmTypeStr', width:150}
                ,{field: 'alarmTime', title: '报警时间', width:150}
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
            	        content: '${pageContext.request.contextPath }/jobAlarm/detail',
            	        success: function(layero, index){
            	            var body = layer.getChildFrame('body',index);//建立父子联系
            	            //给编辑子页面赋值
            	            body.find('input[name="trackName"]').val(data.trackName);
            	            body.find('input[name="trainNo"]').val(data.trainNo);
            	            body.find('input[name="alarmType"]').val(data.alarmType);
            	            body.find('input[name="alarmTime"]').val(data.alarmTime);
            	        }
            	    });
              } 
            });
  });
    </script>
  </body>

</html>


















