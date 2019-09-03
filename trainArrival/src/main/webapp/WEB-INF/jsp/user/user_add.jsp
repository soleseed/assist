<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
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
    	<hr class="layui-bg-green">
        <form class="layui-form self-form">
          <div class="layui-form-item">
              <label for="userName" class="layui-form-label self-label">
                  <span class="x-red">*</span>用户名
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="userName" name="userName" lay-verify="required|username"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="password" class="layui-form-label self-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password"  id="password" name="password" lay-verify="required|pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="aliases" class="layui-form-label self-label">
                  <span class="x-red">*</span>用户姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text"  id="aliases" name="aliases" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="deptId" class="layui-form-label self-label">
                  <span class="x-red">*</span>场
              </label>
              <div class="layui-input-inline">
              	  <select id="deptId" name="deptId" lay-verify="required" lay-search="">
		           <option value="">请选择</option>
		           <option value="3">车站</option>
		           <option value="1">场1</option>
		           <option value="2">场2</option>
		          </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="postId" class="layui-form-label self-label">
                  <span class="x-red">*</span>岗位
              </label>
              <div class="layui-input-inline">
              	  <select id="postId" name="postId" lay-verify="required" lay-search="">
		           <option value="">请选择</option>
		           <!-- <option value="8">系统管理员</option> -->
		           <option value="1">内勤助理</option>
		           <option value="2">车号</option>
		           <option value="3">货检</option>
		           <option value="4">列检</option>
		           <option value="5">防溜</option>
		           <option value="6">列尾</option>
		           <option value="7">安全作业指挥中心</option>
		          </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label  class="layui-form-label self-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit>
                  	添加
              </button>
          </div>
      </form>
    </div>
    <script src="../../../layuiadmin/layui/layui.js"></script>
    <script>
    
        layui.use(['form','layer'], function(){
            /* $ = layui.jquery; */
          var form = layui.form,
          	  $ = layui.jquery,
          	  layer = layui.layer;
            
          form.verify({
        	  username: function(value, item){ //value：表单的值、item：表单的DOM对象
        		    if(/.*[\u4e00-\u9fa5]+.*$/.test(value)) { 
        		    	return '用户名不能含有中文'; 
        		    } 
        		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
        		      return '用户名不能有特殊字符';
        		    }
        		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
        		      return '用户名首尾不能出现下划线\'_\'';
        		    }
        		    if(/^\d+\d+\d$/.test(value)){
        		      return '用户名不能全为数字';
        		    }
        		    if(!/^[\S]{6,20}$/.test(value)){
        		    	return '用户名必须6到20位,且不能出现空格';
        		    }
        		    /* if (/^[\u3220-\uFA29]+$/.test(value))
        		    {
        		    	return '不能输入中文';
        		    }  */
        	  }
        	  ,pass:[/^[\S]{6,20}$/,'密码必须6到20位，且不能出现空格'] 
          }); 
            
          //监听提交
          form.on('submit(add)', function(data){
              //发异步，把数据提交后台
              $.ajax({
        			url:"${pageContext.request.contextPath }/user/add",
        			type:"post",
        			async: false,
        			cache : false,
        			data: data.field,
        			success:function(result){
        				if(result == -1){
        					layer.alert("用户名重复,添加失败");
        				}else if(result != 0){
        					layer.alert("添加成功", {icon: 6},function () {
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