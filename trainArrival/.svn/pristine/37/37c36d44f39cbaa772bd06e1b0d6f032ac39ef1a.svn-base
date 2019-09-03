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
    
    <style type="text/css">
    	.blue{
    		color:blue !important;
    	}
    	.red{
    		color:red !important;
    	}
    	.yellow{
    		color:#DAA520 !important;
    	}
    	.green{
    		color:green !important;
    	}
    </style>
    
  </head>
  
  <body>
  	<input type="hidden" id="selectPostId" value=""/>
  	<input type="hidden" id="selectDeptId" value=""/>
  	<div class="layui-form self-form">
  	<div style="margin-top:10px;" class="layui-row" align="center">
	      <div class="layui-form-item search-form-item">
	      	<div class="layui-inline">
			    <div class="layui-input-inline">
	     			<input type="text" id="arriveTime" name="arriveTime" readonly='readonly' placeholder="作业日期" autocomplete="off" class="layui-input">
			    </div>
		    </div>
		    <div class="layui-inline">
	            <div class="layui-input-inline"> 
	              	  <select id=isArrive name="isArrive" lay-search>
			           <option value="">请选择出站/进站</option>
			           <option value="0">出站</option>
			           <option value="1">进站</option>
			          </select>
	             </div>
		    </div>
		    <div class="layui-inline">
          		<div class="layui-input-inline">
	              	  <select id="jobStatus" name="jobStatus" lay-search="">
			           <option value="">请选择作业状态</option>
			           <option value="0">未开始</option>
			           <option value="1">进行中</option>
			           <option value="2">已完成</option>
			           <option value="3">已确认</option>
			          </select>
	            </div>
		    </div>
		    <!-- <div class="layui-inline">
          		<input type="text" name="status"    placeholder="状态" autocomplete="off" class="layui-input">
		    </div> -->
		    <div class="layui-inline">
	          <button id="searchBtn" class="layui-btn layui-btn"  data-type="reload"><i class="layui-icon">&#xe615;</i></button>
		    </div>
		    <div class="layui-inline">
	          <button id="exportBtn" class="layui-btn layui-btn">导出查询结果<i class="layui-icon">&#xe615;</i></button>
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
	          <div class="layui-card-body">
	            <table class="layui-table" lay-filter="result" lay-even id="result-table"></table>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
    
    <script type="text/html" id="mytoolBar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" title="查看"><i class='layui-icon'>&#xe64c;</i></a>
	<a class="layui-btn layui-btn-xs" lay-event="info" title="通知岗位"><i class='layui-icon'>&#xe667;</i></a>
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="complete" title="一键完成"><i class='layui-icon'>&#xe623;</i></a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="confirm" title="确认完成"><i class='layui-icon'>&#x1005;</i></a>
	</script>
    <script type="text/html" id="indexTpl">
       {{d.LAY_TABLE_INDEX+1}}
	</script>
	<script type="text/html" id="isArriveStr">
    {{#  if(d.isArrive == 1){ }}
     	进站
    {{#  } else { }}
                     出站
    {{#  } }}	
	</script>
	<script type="text/html" id="jobStatusStr">

	{{#  if(d.jobStatus==null || d.jobStatus == 0){ }}
		<span class="red">未开始 </span>
    {{#  }}}
	{{#  if(d.jobStatus == 1){ }}
		<span class="red">进行中 </span>
    {{#  }}}
    {{#  if(d.jobStatus == 2){ }}
		<span class="green">已完成 </span>
    {{#  }}}
	{{#  if(d.jobStatus == 3){ }}
		<span class="green">已确认 </span>
    {{#  }}}
	</script>
	<!-- chehao -->
	<script type="text/html" id="chehaoStatusStr">
	{{#  if(d.chehaoStatus==null){ }}
		<span class="blue">未通知 </span>
    {{#  }}}
	{{#  if(d.chehaoStatus == 0){ }}
		<span class="red">未接收 </span>
    {{#  }}}
	{{#  if(d.chehaoStatus == 1){ }}
		<span class="red">进行中 </span>
    {{#  }}}
    {{#  if(d.chehaoStatus == 2){ }}
		<span class="green">已完成 </span>
    {{#  }}}
	</script>
	
	<!-- liejian -->
	<script type="text/html" id="liejianStatusStr">
	{{#  if(d.liejianStatus==null){ }}
		<span class="blue">未通知 </span>
    {{#  }}}
	{{#  if(d.liejianStatus == 0){ }}
		<span class="red">未接收 </span>
    {{#  }}}
	{{#  if(d.liejianStatus == 1){ }}
		<span class="red">进行中 </span>
    {{#  }}}
    {{#  if(d.liejianStatus == 2){ }}
		<span class="green">已完成 </span>
    {{#  }}}
	
	</script>
	<!-- huojian -->
	<script type="text/html" id="huojianStatusStr">
	{{#  if(d.huojianStatus==null){ }}
		<span class="blue">未通知 </span>
    {{#  }}}
	{{#  if(d.huojianStatus == 0){ }}
		<span class="red">未接收 </span>
    {{#  }}}
	{{#  if(d.huojianStatus == 1){ }}
		<span class="red">进行中 </span>
    {{#  }}}
    {{#  if(d.huojianStatus == 2){ }}
		<span class="green">已完成 </span>
    {{#  }}}
	
	</script>
	
	<!-- fangliu -->
	<script type="text/html" id="fangliuStatusStr">
	{{#  if(d.fangliuStatus==null){ }}
		<span class="blue">未通知 </span>
    {{#  }}}
	{{#  if(d.fangliuStatus == 0){ }}
		<span class="red">未接收 </span>
    {{#  }}}
	{{#  if(d.fangliuStatus == 1){ }}
		<span class="red">进行中 </span>
    {{#  }}}
    {{#  if(d.fangliuStatus == 2){ }}
		<span class="green">已完成 </span>
    {{#  }}}

	</script>
	<!-- liewei -->
	<script type="text/html" id="lieweiStatusStr">
	{{#  if(d.lieweiStatus==null){ }}
		<span class="blue">未通知 </span>
    {{#  }}}
	{{#  if(d.lieweiStatus == 0){ }}
		<span class="red">未接收 </span>
    {{#  }}}
	{{#  if(d.lieweiStatus == 1){ }}
		<span class="red">进行中 </span>
    {{#  }}}
    {{#  if(d.lieweiStatus == 2){ }}
		<span class="green">已完成 </span>
    {{#  }}}
	</script>
	
  <script src="../../../layuiadmin/layui/layui.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
  <script src="../../../layuiadmin/layui/xadmin.js"></script>
   <script>
  layui.config({
    base: '../../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table','laydate'], function(){
    var admin = layui.admin
    ,form = layui.form
    ,table = layui.table
    ,$ = layui.$
  	,laydate = layui.laydate
    //执行一个laydate实例
    laydate.render({
      elem: '#arriveTime', //指定元素
      //type: 'date'
      trigger: 'click',
	  format: 'yyyy-MM-dd'
    });
    
  	$("#exportBtn").click(exportData);
  	
  	//5秒更新一次表格内数据
  	setInterval('$(".layui-laypage-btn")[0].click();', 5000);
  	
    var resulttable = table.render({
			      elem: '#result-table'
			      ,even: true
			      ,height:480
			      ,url: '${pageContext.request.contextPath }/scheduleJob/search' //数据接口
	              ,cols: [[ //表头
	            	 //{type:'numbers',title:'序号'}
	                {field: 'arriveTime', title: '日期', width:120}
	                ,{field: 'isArrive', title: '进站/出站', width:100,templet:'#isArriveStr'}
	                ,{field: 'trackName', title: '股道', width:100}
	                ,{field: 'trainCount', title: '辆数', width:100}
	                ,{field: 'trainNo', title: '车次', width:100}
	                ,{field: 'jobStatus', title: '作业状态', width:100, align:'center',templet:'#jobStatusStr'}
	                
	                ,{field: 'chehaoStatus', title: '车号状态', width:100, templet:'#chehaoStatusStr'}
	                ,{field: 'liejianStatus', title: '列检状态', width:100, templet:'#liejianStatusStr'}
	                ,{field: 'huojianStatus', title: '商检状态', width:100, templet:'#huojianStatusStr'}
	                ,{field: 'fangliuStatus', title: '防溜/撤溜状态', width:150, templet:'#fangliuStatusStr'}
	                ,{field: 'lieweiStatus', title: '列尾状态', width:100, templet:'#lieweiStatusStr'}
	                
	                ,{field: 'trainInspectTime', title: '通知列检作业时分', width:150}
	                ,{field: 'tFinishTime', title: '列检作业完了时分', width:150}
	                ,{field: 'goodsInspectTime', title: '通知商检作业时分', width:150}
	                ,{field: 'gFinishTime', title: '商检作业完了时分', width:150}
	                ,{field: 'trainNumTime', title: '通知车号作业时分', width:150}
	                ,{field: 'antiRunningTime', title: '通知防溜/撤溜作业时分', width:150}
	                ,{field: 'antiLocation', title: '防溜/撤溜位置', width:150}
	                ,{field: 'antiTool', title: '防溜/撤溜器具编号', width:150}
	                ,{field: 'deviceNo', title: '列尾设备主机号', width:150}
	                ,{field: 'trainTailTime', title: '通知列尾作业时分', width:150}
	                ,{fixed: 'right', width: 180, align:'center', toolbar: '#mytoolBar'}
	              ]]
			      ,page: true
    });
    
  //监听搜索
    var active = {
          	      reload: function(){
          	      //执行重载
          	      	resulttable.reload({
              	        page: {
              	          curr: 1 //重新从第 1 页开始
              	        }
              	        ,where: {
              	        	arriveTime:setTime(),
              	        		//new Date($("#arriveTime").val()).format("yyyy-MM-dd hh:mm:ss"),
              	        	isArrive:$("#isArrive").val(),
              	        	jobStatus:$("#jobStatus").val(),
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
            	 // x_admin_show('','${pageContext.request.contextPath }/scheduleJob/detail?id='+data.id,1200,550)
            	  layer.open({
          	        type: 2,
          	        skin: 'CLYM-style',
          	        area: ['1200px','450px'],
          	        title: '',
          	        //maxmin:true,
          	        content: '${pageContext.request.contextPath }/scheduleJob/detail?id='+data.id,
          	        success: function(layero, index){
          	        	//layer.iframeAuto(index);
          	        }
	          	  });
              } else if(obj.event === 'del'){
                layer.confirm('确认删除吗?', function(index){
                	$.ajax({
                        type:"post",
                        async:false,
                        cache:false,
                        url:"${pageContext.request.contextPath }/user/delete",
                        data:{"id":data.id},
                        dataType:"json",
                        success:function(data,status){
	                          //刷新父窗口
	    					  //window.parent.location.reload();
		                      obj.del();
		                      layer.close(index);
                        }
                    });
                });
              } else if(obj.event === 'complete'){
            	  if(data.jobStatus === 2){
            		  layer.alert("作业已经完成！");
            		  return;
            	  }
            	  if(data.jobStatus === 3){
            		  layer.alert("作业已经确认完成！");
            		  return;
            	  }
            	  layer.confirm('一键完成作业吗?', function(index){
                  	$.ajax({
                          type:"post",
                          async:false,
                          cache:false,
                          url:"${pageContext.request.contextPath }/scheduleJob/complete",
                          data:{"jobId":data.id},
                          dataType:"json",
                          success:function(data,status){
  	                          //刷新父窗口
  	    					   window.location.reload();
  	    					//$(".layui-laypage-btn")[0].click();
  		                     // layer.close(index);
                          }
                      });
                  });
              }else if(obj.event === 'info'){
            	  layer.open({
            	        type: 2,
            	        skin: 'CLYM-style',
            	        area: ['450px','250px'],
            	        title: '',
            	        content: '${pageContext.request.contextPath }/scheduleJob/toInfo?jobId='+ data.id + '&trackId=' + data.trackId,
            	        success: function(layero, index){
            	        }
            	  }); 
              }else if(obj.event === 'confirm'){
            	  if(data.jobStatus === 3){
            		  layer.alert("作业流程已全部完成！");
            		  return;
            	  }
            	  if(data.jobStatus !== 2){
            		  layer.alert("请先确认作业已经完成！");
            		  return;
            	  }
            	  layer.confirm('确认作业已全部完成吗?', function(index){
                  	$.ajax({
                          type:"post",
                          async:false,
                          cache:false,
                          url:"${pageContext.request.contextPath }/scheduleJob/confirm",
                          data:{"jobId":data.id},
                          dataType:"json",
                          success:function(data,status){
  	                          //刷新父窗口
  	    					  // window.location.reload();
  	    					$(".layui-laypage-btn")[0].click();
  		                    layer.close(index);
                          }
                      });
                  }); 
              }
            });
  	
  
  
  });
    function setTime(){
  	  if($("#arriveTime").val() == ""){
  		  return null;
  	  }else{
  		  return $("#arriveTime").val() + ' 00:00:00';
  	  }
    }
    
   	function exportData(){
  		var param="test=test";
   		if(setTime() != null){
   			param = "arriveTime=" + setTime();
   		}
   		if($("#isArrive").val() != ""){
   			param = param + "&isArrive=" + $("#isArrive").val();
   		}
   		if($("#jobStatus").val() != ""){
	   		param = param + "&jobStatus=" + $("#jobStatus").val()
   		}
   		window.location.href = "${pageContext.request.contextPath }/scheduleJob/exportExcel?" + param;
   	}
    </script>
  </body>

</html>