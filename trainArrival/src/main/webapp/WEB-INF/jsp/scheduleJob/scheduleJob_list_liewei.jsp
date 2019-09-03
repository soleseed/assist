<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css"
	media="all">
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
		<div style="margin-top: 10px;" class="layui-row" align="center">
			<div class="layui-form-item search-form-item">
				<div class="layui-inline">
					<button id="searchBtn" class="layui-btn" data-type="reload">
						<i class="layui-icon">&#xe615;</i>
					</button>
					<button type="button" class="layui-btn"
						onclick="javascript:location.replace(location.href);">
						<i class="layui-icon">&#xe669;</i>刷新
					</button>
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
						<table class="layui-table" lay-filter="result" lay-even
							id="result-table"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/html" id="mytoolBar">
    	{{# if(d.canModify == 1){
				if(d.lieweiStatus == 0){ }}
     			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="get" title="接受作业"><i class='layui-icon'>接受作业</i></a>
    		{{#  } 
				if(d.lieweiStatus == 1){ }}
            	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="complete" title="完成"><i class='layui-icon'>作业完成请点击确认</i></a>
   	 		{{#  } }}
		{{# } }}
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
	<script type="text/html" id="statustmp">
		{{#	if(d.lieweiStatus == 0 || d.lieweiStatus == null){ }}
     			 <span class="red">未接收 </span>
    		{{#  } 
				if(d.lieweiStatus == 1){ }}
            	 <span class="red">进行中 </span>
   	 		{{#  } }}

</script>
	<script>
 // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
    // 例子： 
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth() + 1, //月份 
            "d+" : this.getDate(), //日 
            "h+" : this.getHours(), //小时 
            "m+" : this.getMinutes(), //分 
            "s+" : this.getSeconds(), //秒 
            "q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
            "S" : this.getMilliseconds()
        //毫秒 
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
        for ( var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
                        : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    } 
</script>
<script src="../../../layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
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
		    ,url: '${pageContext.request.contextPath }/scheduleJob/searchByPost?statusParam=lieweiStatus' //数据接口
		    ,page:true
		    ,even:true
		    ,cols: [[ //表头
		       /* {type:'checkbox'} */
		       {field: 'userName', title: '用户', width:150}
		      ,{field: 'arriveTime', title: '日期', width:150}
		      ,{field: 'isArrive', title: '进站/出站', width:100,templet:'#isArriveStr'}
		      ,{field: 'trackName', title: '股道', width:200}
		      ,{field: 'status', title: '状态', templet:'#statustmp', width:100}
		      ,{field: 'trainCount', title: '辆数', width:100}
		      ,{field: 'trainNo', title: '车次', width:150}
		      ,{field: 'trainTailTime', title: '通知列尾作业时分', width:250}
		      ,{fixed: 'right', width: 200, align:'center', toolbar: '#mytoolBar'}
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
              	        	/* arriveTime:$("#arriveTime").val(),
              	        	isArrive:$("#isArrive").val(),
              	        	jobStatus:$("#jobStatus").val(), */
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
              id = data.id;
              if(obj.event === 'get'){
            	  $.ajax({
                      type:"post",
                      async:false,
                      cache:false,
                      url:"${pageContext.request.contextPath }/scheduleJob/updateStatus",
                      //列尾作业接收时分 （反馈类型）
                      data:{"id":data.id,"lieweiStatus": 1,"ttStartTime": new Date().format("yyyy-MM-dd hh:mm:ss"), 
                    	  "jobType":5,"feedbackTime": new Date().format("yyyy-MM-dd hh:mm:ss")},
                      dataType:"json",
                      success:function(data,status){
	                          //父窗口
	    					 //window.location.reload();
	    					 $(".layui-laypage-btn")[0].click()
	    					//检查是否仍有其他未接收的任务
   							$.ajax({
   				                type:"post",
   				                async:false,
   				                cache:false,
   				                url:"${pageContext.request.contextPath }/scheduleJob/searchNewJob?statusParam=lieweiStatus",
   				                dataType:"json",
   				                success:function(data,status){
   				                	if(data.count != 0){
   				                		//仍有新任务没接收,播放语音提醒
   				                		window.parent.play(null,0);
   				                	}else{
   				                		window.parent.pause();
   				                		//window.parent.closeTips();
   				                		window.parent.closeNotify('warn');
   				                	}
   				                }
   				            });
                      }
                  });
              } else if(obj.event === 'complete'){
                	  layer.open({
                	        type: 2,
                	        skin: 'CLYM-style',
                	        area: ['500px','250px'],
                	        title: '',
                	        content: '${pageContext.request.contextPath }/scheduleJob/addLiewei',
                	        success: function(layero, indexChild){
                	           index = indexChild;
      	          	        }
      	          	  });
                  }
     	})
   	})
    
    function finish(){
    	//
    	 var body = layer.getChildFrame('body',index);//建立父子联系
         /* var iframeWin = window[layero.find('iframe')[0]['name']]; */
         // console.log(arr); //得到iframe页的body内容
         // console.log(body.find('input'));
         //给编辑子页面赋值
         var deviceNo = body.find('input[name="deviceNo"]').val();
	         $.ajax({
	             type:"post",
	             async:false,
	             cache:false,
	             url:"${pageContext.request.contextPath }/scheduleJob/updateStatus",
	            //列尾作业完成时分 （反馈类型）
	             data:{"id":id,"lieweiStatus": 2,"deviceNo":deviceNo,"ttFinishTime": new Date().format("yyyy-MM-dd hh:mm:ss"), 
	           	  "jobType":10,"feedbackTime": new Date().format("yyyy-MM-dd hh:mm:ss")},
	             dataType:"json",
	             success:function(data,status){
					window.location.reload();
					//$(".layui-laypage-btn")[0].click()
	             }
	     	});
 		}
</script>
</body>

</html>