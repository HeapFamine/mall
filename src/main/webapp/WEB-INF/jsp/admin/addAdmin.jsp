<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<script>
	//检查表单字段
    $(function() {
        $("#addForm_admin").submit(function() {
            if (!checkEmpty("name", "管理员名称"))
                return false;
            if (!checkEmpty("password", "登陆密码"))
                return false;
            if (!checkEmpty("repeatpassword", "密码确认"))
                return false;
            if($("password").val() !=$("repeatpassword").val()){
            	layer.msg('密码不一致'); 
                return false;
            }
            
            return true;
        });
    });
</script>


<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding:  80px 10px ;">
  
  	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>增加管理员</legend>
	</fieldset>
  
	<a href="admin_list" class="layui-btn"><i class="layui-icon layui-icon-return"></i> 返回管理员列表</a>
	
	<form method="post" id="addForm_admin" action="admin_add" enctype="multipart/form-data" class="layui-form layui-form-pane layui-col-md-offset4">
	  <div class="layui-form-item">
	    <label class="layui-form-label">管理员名称</label>
	    <div class="layui-input-inline">
	      <input id="name" type="text" name="name" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">登陆密码</label>
	    <div class="layui-input-inline">
	      <input type="password" id="password"  name="password" autocomplete="off"   class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">密码确认</label>
	    <div class="layui-input-inline">
	      <input type="password" id="repeatpassword"  name="repeatpassword" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    <div class="layui-form-item">
	    <label class="layui-form-label">权限等级</label>
	    <div class="layui-input-inline">
	      <input id="authority" type="text" name="authority" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	
	    <div class="layui-form-item layui-col-md-offset2">
	    <button type="submit" class="layui-btn" style = "width:120px;">立即提交</button>
	    </div>
	</form>
  </div>
</div>

<script>
layui.use('layer', function(){
  var layer = layui.layer;
});    
</script>

</html>