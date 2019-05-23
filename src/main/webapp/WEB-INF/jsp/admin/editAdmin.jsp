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
    $(function(){
        $("#updateForm").submit(function(){
            if(!checkEmpty("name","管理员名称"))
                return false;
            return true;
        });
    });
</script>


<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding:  80px 10px ;">
  
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>编辑管理员</legend>
	</fieldset>
	
	<form method="post" id="updateForm" action="admin_update" enctype="multipart/form-data" class="layui-form layui-form-pane layui-col-md-offset4">
	  <div class="layui-form-item">
	    <label class="layui-form-label">管理员名称</label>
	    <div class="layui-input-inline">
	      <input id="name" type="text" name="name" value="${a.name}" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">登陆密码</label>
	    <div class="layui-input-inline">
	      <input type="password" id="password"  name="password" value="${a.password}" autocomplete="off"   class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">密码确认</label>
	    <div class="layui-input-inline">
	      <input type="password" id="repeatpassword"  name="repeatpassword"  value="${a.password}" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    <div class="layui-form-item">
	    <label class="layui-form-label">权限等级</label>
	    <div class="layui-input-inline">
	      <input id="authority" type="text" name="authority" autocomplete="off"  value="${a.authority}"class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	
	    <div class="layui-form-item layui-col-md-offset2">
	    <input type="hidden" name="id" value="${a.id}">
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