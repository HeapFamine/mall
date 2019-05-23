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
            if(!checkEmpty("name","分类名称"))
                return false;
            return true;
        });
    });
</script>
<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding:  80px 10px ;">
  
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>编辑分类</legend>
	</fieldset>
	
	<form method="post" id="updateForm" action="admin_category_update" enctype="multipart/form-data" class="layui-form layui-form-pane">
	  <div class="layui-form-item">
	
	    <label class="layui-form-label">分类名称</label>
	    <div class="layui-input-inline">
	      <input id="name" type="text" name="name" autocomplete="off" value="${c.name}" class="layui-input">
	    </div>
	    <input type="hidden" name="id" value="${c.id}">
	    <button type="submit" class="layui-btn">立即提交</button>
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