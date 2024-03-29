<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>集宁站接发车辅助系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="../css/naranja.min.css" media="all">
  <link rel="stylesheet" href="../css/style.css" media="all">
  <!-- live2d -->
  <link rel="stylesheet" type="text/css" href="../live2d/assets/waifu.min.css"/>
</head>
<body class="layui-layout-body">
  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header" style="background-color:#e6e6e6;">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
         
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
          
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          	<!-- 暂未设计消息中心 -->
          <!-- <li class="layui-nav-item" lay-unselect>
            <a lay-href="jobAlarm/toSearch" layadmin-event="message" lay-text="消息中心">
              <i class="layui-icon layui-icon-notice"></i>  
              
              如果有新消息，则显示小圆点
              <span class="layui-badge-dot"></span>
            </a>
          </li> -->
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="note">
              <i class="layui-icon layui-icon-note"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>
          <li class="layui-nav-item"  >
            <a href="javascript:;">
              <cite id="userName"></cite>
            </a>
            <dl class="layui-nav-child layui-anim layui-anim-upbit">
              <dd><a onclick="openAudio();">开启语音提醒</a></dd>
              <dd><a onclick="closeAudio();">关闭语音提醒</a></dd>
              <!-- <dd><a lay-href="set/user/info.html">基本资料</a></dd>
              <dd><a lay-href="set/user/password.html">修改密码</a></dd> -->
              <!-- <hr>
              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd> -->
            </dl>
          </li>
          <li class="layui-nav-item to-index" style="margin-right:18px;"><a href="/logout">注销</a></li>
          
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="home/console.html">
            <span>集宁站接发车</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
          	<li id="1000" data-name="user" class="layui-nav-item nav-hide">
              <a href="javascript:;" lay-tips="用户管理" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>用户管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd id="1001">
                  <a lay-href="user/toSearch">用户查询</a>
                </dd>
              </dl>
            </li>
          
            <li id="2000" data-name="assist" class="layui-nav-item nav-hide">
            	<a href="javascript:;" lay-tips="内勤作业管理" lay-direction="2">
                <i class="layui-icon layui-icon-survey"></i>
                <cite>内勤作业管理</cite>
             	 </a>
              <dl class="layui-nav-child">
                <dd id="2002" class="nav-hide">
                  <a lay-href="scheduleJob/toAdd">编辑进出站作业</a>
                </dd>
                <dd id="2001" class="nav-hide">
                  <a lay-href="scheduleJob/toSearch">作业情况查询</a>
                </dd>
                <dd id="2004" class="nav-hide">
                  <a lay-href="jobAlarm/toSearch">作业报警信息</a><span style="display:none;" class="layui-badge"></span>
                </dd>
                <dd id="2003" class="nav-hide">
                  <a lay-href="jobFeedback/toSearch">通知历史信息</a>
                </dd>
                <dd id="2005" class="nav-hide">
                  <a lay-href="jobAutoInfo/toSearch">自动反馈信息</a>
                </dd>
              </dl>
            </li>
            
            <li id="3000" data-name="job" class="layui-nav-item nav-hide">
            	<a href="javascript:;" lay-tips="岗点作业" lay-direction="2">
                <i class="layui-icon layui-icon-app"></i>
                <cite>岗点作业</cite>
             	 </a>
              <dl class="layui-nav-child">
                <dd id="3001" class="nav-hide">
                  <a lay-href="scheduleJob/toSearchChehao">车号</a>
                </dd>
                <dd id="3002" class="nav-hide">
                  <a lay-href="scheduleJob/toSearchHuojian">货检</a>
                </dd>
                <dd id="3003" class="nav-hide">
                  <a lay-href="scheduleJob/toSearchLiejian">列检</a>
                </dd>
                
                <dd id="3004" class="nav-hide">
                  <a lay-href="scheduleJob/toSearchFangliu">防溜</a>
                </dd>
                <dd id="3005" class="nav-hide">
                  <a lay-href="scheduleJob/toSearchLiewei">列尾</a>
                </dd>
              </dl>
            </li>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li id="home" lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
        	<!-- src="user/toSearch" -->
          <iframe id="mainFrame" src="" frameborder="0" class="layadmin-iframe"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
    <div class="footer">
        <div class="copyright">版权所有：上海瀚所信息技术有限公司 copyright ©hansuotech</div>  
    </div>
  </div>
  
  <!-- live2d -->
<!-- waifu-tips.js 依赖 JQuery 库 -->
<script src="../live2d/assets/jquery.min.js"></script>

<!-- 实现拖动效果，需引入 JQuery UI -->
<script src="../live2d/assets/jquery-ui.min.js"></script>

<div class="waifu">
    <div class="waifu-tips"></div>
    <canvas id="live2d" class="live2d"></canvas>
    <div class="waifu-tool">
        <span class="fui-home"></span>
        <span class="fui-chat"></span>
        <span class="fui-eye"></span>
        <span class="fui-user"></span>
        <span class="fui-photo"></span>
        <span class="fui-info-circle"></span>
        <span class="fui-cross"></span>
    </div>
</div>
    
<script src="../live2d/assets/waifu-tips.min.js"></script>
<script src="../live2d/assets/live2d.min.js"></script>
<script type="text/javascript">
/* 可直接修改部分参数 */
live2d_settings['modelId'] = 4;                  // 默认模型 ID
live2d_settings['modelTexturesId'] = 87;         // 默认材质 ID
live2d_settings['modelStorage'] = false;         // 不储存模型 ID
live2d_settings['canCloseLive2d'] = false;       // 隐藏 关闭看板娘 按钮
live2d_settings['canTurnToHomePage'] = false;    // 隐藏 返回首页 按钮
live2d_settings['waifuSize'] = '400x305';        // 看板娘大小
live2d_settings['waifuTipsSize'] = '200x100';    // 提示框大小
live2d_settings['waifuFontSize'] = '20px';       // 提示框字体
live2d_settings['waifuToolFont'] = '20px';       // 工具栏字体
live2d_settings['waifuToolLine'] = '50px';       // 工具栏行高
live2d_settings['waifuToolTop'] = '-60px';       // 工具栏顶部边距
live2d_settings['waifuDraggable'] = 'axis-x';    // 拖拽样式
/* 在 initModel 前添加 */
initModel("../live2d/assets/waifu-tips.json")
</script>
    
<script src="../layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/sockjs.min.js"></script>
<script src="../js/naranja.js"></script>

<!-- 右下角气泡提示框BEGIN -->

<!-- 右下角气泡提示框END -->
  <script>
  layui.config({
    base: '../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index'); 
  </script>
  

<script type="text/javascript">
/* narn("log",'test','keep')
narn("warn",'test','keep')
narn("error",'test','keep')
narn("success",'test','keep') */
/* type: log,warn,error,success */
function narn(type,message,keep) {
  if($(".naranja-notification.naranja-" + type).length > 0){
	  //同类型通知已经存在
	  closeNotify(type);
	  //return;
  }
  naranja()[type]({
    title: '新消息提示'
    ,text: message
    ,timeout: keep
    ,buttons: [{
      text: '确定',
      click: function (e) {
        naranja().success({
          title: '通知',
          text: '消息已查看'
        });
        //任务全部完成，点击确定后停止任务完成提示音
        if(type === 'success'){
        	if(checkPlaying()){
        		pause();
				  //play("${pageContext.request.contextPath }/audio/complete.mp3",3);
			}
        }
      }
    },{
      text: '忽略',
      click: function (e) {
        e.closeNotification()
      }
    }]
  })
}

//按通知类型来关闭消息提醒
function closeNotify(type){
	$(".naranja-notification.naranja-" + type).remove();
}

		<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String wsPath = "ws://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		%>
	
		var sock;
		if  ('WebSocket' in window) {
			sock = new WebSocket("<%=wsPath%>websocket");
		} else if('MozWebSocket' in window) {
		  sock = new MozWebSocket("<%=wsPath%>websocket");
		} else {
		  sock = new SockJS("<%=basePath%>sockjs/websocket");
		}
		sock.onopen = function (e) {
			console.log(e);
		};
		sock.onmessage = function (e) {
			var alarm = eval('(' + e.data + ')');
			console.log(alarm);
			//checkAlarm();
			//内勤助理提醒：
			//alarmType=1 --超时未接收报警提醒语音（报警提示不可关闭，报警循环播放，直到报警解决）：有任务超时未接收;         
			//报警解决条件：超时未接收的作业已接收
			//alarmType=2 --任务全部完成提醒语音（用户查看后关闭，用户未查看提醒循环播放三次）：作业已全部完成，可以进行下一步作业
			
			//岗位提醒：alarmType=3 --接到新任务提醒语音（报警提示不可关闭，语音循环播放，直到接受任务）：有新任务未接收
			//alarmType=5 --内勤助理一键完成任务，通知各岗点更新状态
			if(alarm.alarmType == 1){
				//TODO:播放语音
				//tipsPop(alarm.message,0,'alarmtips');
				narn('error',alarm.message,'keep');
				play("${pageContext.request.contextPath }/audio/timeout.mp3",0);
			}else if(alarm.alarmType == 2){
				
				//TODO:播放语音
				//tipsPop(alarm.message,1,null);
				narn('success',alarm.message,'');
				checkAlarm();
				//查看是否正在播放超时报警语音
				if(checkPlaying()){
				  play("${pageContext.request.contextPath }/audio/complete.mp3",3);
				}
			}else if(alarm.alarmType == 3){
				narn('warn',alarm.message,'keep');
				//TODO:播放语音
				//tipsPop(alarm.message,0,null);
				play("${pageContext.request.contextPath }/audio/new.mp3",0);
			}else if(alarm.alarmType == 4){
				checkAlarm();
			}else if(alarm.alarmType == 5){
				//关闭各岗点的未接收任务提醒，并且关闭播报语音
				console.log(alarm.message);
				closeNotify('warn');
				pause();
				$('#mainFrame').attr('src', $('#mainFrame').attr('src'));
			}
		};
		
		
		 
		 
		 function checkPlaying(){
			 //$("#alarmAudio").attr("src",src);
			 //console.log($("#alarmAudio"));
			 //console.log($("#alarmAudio")[0]);
			 //console.log($("#alarmAudio")[0].currentSrc);
			 if($("#alarmAudio").length> 0 && $("#alarmAudio")[0].currentSrc.indexOf('timeout') !== -1){
				 return false;
			 }
			 return true;
		 }
		 
		 
		 
		
		function checkNewJobAlarm(){
			var flag = false;
			$.ajax({
                type:"post",
                async:false,
                cache:false,
                url:"${pageContext.request.contextPath }/scheduleJob/searchNewJob",
                dataType:"json",
                success:function(data,status){
                	if(data.count != 0){
                		//仍有新任务没接收
                		play("${pageContext.request.contextPath }/audio/new.mp3",0);
                		//narn('warn','有新任务未接收','keep');
                		//tipsPop('有新任务未接收',0,null);
                		flag = true;
                	}
                }
            });
			return flag;
		}
		

		//src:播放语音； count:播放次数，0为循环播放 
		function play(src,count){
			//说明语音提醒已关闭
			if($("#alarmAudio").length === 0){
				return;
			}
			if(null != src){
				$("#alarmAudio").attr("src",src);
			}
			if(count < 0){
				return false;
			}else if(count == 0){
				$("#alarmAudio")[0].play();
				$("#alarmAudio")[0].loop = true;
			}else{
				$("#alarmAudio")[0].play();
				$("#alarmAudio")[0].loop = false;
				$("#alarmAudio")[0].addEventListener("ended",function(e){
					//console.log(e);
					count --;
					if(count > 0){
						//setTimeout(function(){$("#alarmAudio")[0].play();},0);
						e.target.play();
					}else{
						e.target.pause();
					}
				});
			}
		}
		
		function pause(){
			//说明语音提醒已关闭
			if($("#alarmAudio").length === 0){
				return;
			}
			$("#alarmAudio")[0].pause();
		}
</script>

  <script type="text/javascript">
    var index;
	var layer;
	var alarmIndexArray = new Array();
	
	setInterval(getAlarmCount,10000);
	
	function getAlarmCount(){
		$.ajax({
            type:"get",
            async:false,
            cache:false,
            url:"${pageContext.request.contextPath }/jobAlarm/getCount",
            dataType:"json",
            success:function(data,status){
            	if(data !== 0){
            		$(".layui-badge").css("display","inline");
            		$(".layui-badge").html(data);
            	}else{
            		$(".layui-badge").css("display","none");
            	}
            }
        });
	}
	
	function openAudio(){
		//$("#alarmAudio").removeAttr("disabled");
		var str = '<audio id="alarmAudio"  hidden controls="controls">';
			str = str + '<source src="${pageContext.request.contextPath }/audio/new.mp3" type="audio/mp3" />'; 
		    str = str + '</audio>';
		$("body").prepend(str);
		//play("${pageContext.request.contextPath }/audio/timeout.mp3",0);
		$.ajax({
            type:"get",
            async:false,
            cache:false,
            url:"${pageContext.request.contextPath }/updateAudioTrigger?on=true",
            dataType:"text",
            success:function(data,status){
            	checkNewJobAlarm();
    			checkAlarm();
            }
        });
		//window.location.reload();
	}
	
	function closeAudio(){
		$("audio").remove();
		$.ajax({
            type:"get",
            async:false,
            cache:false,
            url:"${pageContext.request.contextPath }/updateAudioTrigger?on=false",
            dataType:"json",
            success:function(data,status){
            	
            }
        });
	}
	
	function initAudio(){
		$.ajax({
            type:"post",
            async:false,
            cache:false,
            url:"${pageContext.request.contextPath }/getAudioTrigger",
            dataType:"json",
            success:function(data,status){
            	if(data){
            	   openAudio();
            	}
            }
        });
	}
	
	function checkAlarm(){
		$.ajax({
            type:"post",
            async:false,
            cache:false,
            url:"${pageContext.request.contextPath }/scheduleJob/alarmControl",
            dataType:"json",
            success:function(data,status){
            	if(typeof(data.message) !== "undefined"){
            		var message = eval('(' + data.message + ')');
            		//tipsPop(message.message,0,'alarmtips');
            		narn('error',message.message,'keep');
            		play("${pageContext.request.contextPath }/audio/timeout.mp3",0);
            	}else if(data.message === ''){
            		
            	}else{
            		if($("#alarmAudio")[0].currentSrc.indexOf('timeout') !== -1 && !$("#alarmAudio")[0].paused){
						 pause();
					}
            		//close timeout alarm
            		closeNotify('error');
            		/* alarmIndexArray.forEach(function (item, index, array) {
            		    console.log(item, index);
	            		layer.close(item);
            		}); */

            		if(!checkPlaying()){
            			pause();
            			$("#alarmAudio").attr("src","${pageContext.request.contextPath }/audio/new.mp3");
            		}
            	}
            }
        });
	}
	
	function closeTips(){
		//layer.close(index);
		layer.closeAll();
	 }
	
	
	
	function tipsPop(message,hasCloseBtn,id){
		 if(id === null){
		 //layui.use('layer', function(){
			//	layer = layui.layer;
				index = layer.open({
						id: 'normal',
						type:1,
						title:['提示信息', 'font-size:18px;'],
						closeBtn:hasCloseBtn, //0不显示关闭按钮
						shade: [0],
						area: ['300px', '200px'],
						offset: 'lb', //右下角弹出
						//time: 10000, //2秒后自动关闭
						anim: 2,
						shade: 0,
						content:'<div class="tips" > <p class="_p"> =>=>=>=>=></p>' + message + '<p class="_p"><=<=<=<=<=</p></div>',
						end:function(){
							//关闭弹窗，如果仍在播放任务完成语音，则停止语音
							if($("#alarmAudio")[0].currentSrc.indexOf('complete') !== -1 && !$("#alarmAudio")[0].paused){
								 pause();
							 }
						}
					});
				//})
		 }else{
			// layui.use('layer', function(){
				//	layer = layui.layer;
					alarmIndex = layer.open({
							//type:1,
							//id: id,
							title:['提示信息', 'font-size:18px;'],
							closeBtn:hasCloseBtn, //0不显示关闭按钮
							shade: [0],
							area: ['300px', '200px'],
							offset: 'rb', //右下角弹出
							//time: 10000, //2秒后自动关闭
							anim: 2,
							shade: 0,
							btn:[],
							content:'<div class="tips" > <p class="_p"> =>=>=>=>=></p>' + message + '<p class="_p"><=<=<=<=<=</p></div>',
							end:function(){
								//关闭弹窗，如果仍在播放任务完成语音，则停止语音
								//if($("#alarmAudio")[0].currentSrc.indexOf('timeout') !== -1 && !$("#alarmAudio")[0].paused){
								//	 pause();
								// }
							}
						});
					alarmIndexArray.push(alarmIndex);
			//}) 
		 }
		 }
	
	
		layui.use('layer', function(){
			layer = layui.layer;
			initAudio();
			if(checkNewJobAlarm()){
				//有新任务通知
				narn('warn','有新任务未接收','keep');
			}else{
				//没有新任务尝试去关闭已有的新任务通知
				closeNotify('warn');
			};
			checkAlarm();
			window.onbeforeunload = function(){
				sock.close();
		 	}
	
			$.ajax({
                type:"post",
                async:false,
                cache:false,
                url:"${pageContext.request.contextPath }/user/getUserRole",
                dataType:"json",
                success:function(data,status){
                	$("#userName").html(data[0].userName);
                	var j = 9999;
                	for(var i = 0;i<data.length;i++){
                        var menuId = data[i].mid;
                        var parentMenuId = data[i].parentMenuId;
                       /* 	$("#"+parentMenuId).show();
                       	$("#"+menuId).show(); */
                     	$("#"+parentMenuId).removeClass("nav-hide");
                       	$("#"+menuId).removeClass("nav-hide");
                       	
                       	
                       	if(parentMenuId != 0 && i <j){
                       		j = i;
                       		var url = $("#"+menuId).find('a').attr("lay-href");
                       		$("#mainFrame").attr("src", url);
                       		$("#home").attr("lay-attr", url);
                       	}
                    }
                }
            });
			
		});
 </script>
</body>
</html>