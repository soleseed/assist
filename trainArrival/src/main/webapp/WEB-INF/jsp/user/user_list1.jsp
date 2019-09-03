<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/layui.css">
    <script src="${pageContext.request.contextPath }/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
  	<input type="hidden" id="selectPostId" value=""/>
  	<input type="hidden" id="selectDeptId" value=""/>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="javascript:void(0)">首页</a>
        <a>
          <cite>用户查询</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
    
      <div class="layui-row" align="center">
	      <div class="layui-form-item">
		    <div class="layui-inline">
          		<input type="text" id="userName" name="userName"  placeholder="用户名" autocomplete="off" class="layui-input">
		    </div>
		    <div class="layui-inline">
          		<input type="text" id="aliases" name="aliases"  placeholder="用户姓名" autocomplete="off" class="layui-input">
		    </div>
		    <div class="layui-inline">
          		<input type="text" id="postName" name="postName"    placeholder="岗位" autocomplete="off" class="layui-input">
		    </div>
		    <div class="layui-inline">
          		<input type="text" id="deptName" name="deptName" placeholder="场" autocomplete="off" class="layui-input">
		    </div>
		    <!-- <div class="layui-inline">
          		<input type="text" name="status"    placeholder="状态" autocomplete="off" class="layui-input">
		    </div> -->
		    <div class="layui-inline">
	          <button id="searchBtn" class="layui-btn layui-btn"  data-type="reload"><i class="layui-icon">&#xe615;</i></button>
	          
	          <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath }/user/toAdd',600,450)"><i class="layui-icon"></i>添加</button>
		    </div>
		  </div>
      </div>
      
      <table id="resultTable" class="layui-hide" lay-data="{id:resultTable}" lay-filter="demo">
      </table>
      <div id="page" class="page">
       
      </div>
    
    <script type="text/html" id="mytoolBar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" title="查看"><i class='layui-icon'>&#xe64c;</i></a>
  	<a class="layui-btn layui-btn-xs" lay-event="edit"><i class='layui-icon' title="编辑">&#xe642;</i></a>
 	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" title="删除"><i class='layui-icon'>&#xe640;</i></a>
	</script>
    <script type="text/html" id="indexTpl">
       {{d.LAY_TABLE_INDEX+1}}
	</script>
	<script type="text/html" id="statusStr">
    {{#  if(d.status == 1){ }}
     	有效
    {{#  } else { }}
                      无效
    {{#  } }}	
	</script>
    <script>
    
    $(document).ready(function(){
    	initTable();
    });
       
    function initTable(){
    	layui.use(['laypage','table'], function() {
            var laypage = layui.laypage
            ,table = layui.table //表格
          //执行一个 table 实例
            var tableIns = table.render({
              elem: '#resultTable'
              ,height: 500
              ,url: '${pageContext.request.contextPath }/user/search' //数据接口
              ,page:{layout: ['count','prev', 'page', 'next']}
              ,limits:[10]
              ,limit:10
              ,cols: [[ //表头
                 /* {type:'checkbox'} */
                {field: 'id', title: 'ID', width:100}
                ,{field: 'userName', title: '用户名', width:200}
                ,{field: 'aliases', title: '用户姓名', width:200}
                ,{field: 'postName', title: '岗位', width:300}
                ,{field: 'deptName', title: '场', width:100}
                ,{field: 'status', title: '状态', templet: '#statusStr',width:200}
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
              	        		userName:$("#userName").val(),
                  	        	postName:$("#postName").val(),
                  	        	deptName:$("#deptName").val(),
                  	        	aliases:$("#aliases").val()
              	        }
          	      	});
          	      }
            }
              
              $('#searchBtn').on('click', function(){
                  var type = $(this).data('type');
                  active[type] ? active[type].call(this) : '';
               });
            
          	//监听工具条
            table.on('tool(demo)', function(obj){ 
              //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
              var data = obj.data //获得当前行数据
              ,layEvent = obj.event; //获得 lay-event 对应的值
              if(obj.event === 'detail'){
            	  layer.open({
          	        type: 2,
          	        skin: 'CLYM-style',
          	        area: ['600px','450px'],
          	        title: '用户详情',
          	        content: '${pageContext.request.contextPath }/user/detail?id='+data.id,
          	        success: function(layero, index){
          	           //
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
              } else if(obj.event === 'edit'){
            	  //给当前页隐藏域赋值，供子页面获取
            	  $("#selectDeptId").val(data.deptId);
            	  $("#selectPostId").val(data.postId);
            	  layer.open({
            	        type: 2,
            	        skin: 'CLYM-style',
            	        area: ['600px','450px'],
            	        title: '用户信息修改',
            	        content: '${pageContext.request.contextPath }/user/toEdit',
            	        success: function(layero, index){
            	            var body = layer.getChildFrame('body',index);//建立父子联系
            	            //给编辑子页面赋值
            	            body.find('input[name="id"]').val(data.id);
            	            body.find('input[name="userName"]').val(data.userName);
            	            body.find('input[name="password"]').val(data.password);
            	            body.find('input[name="aliases"]').val(data.aliases);
            	        }
            	    });
              }
            });
     	})
    }
	
    </script>
  </body>

</html>


















