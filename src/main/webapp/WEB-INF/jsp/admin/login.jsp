<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>管理员登录</title>
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
  <link rel="stylesheet" href="layui/css/admin.css" media="all">
  <link rel="stylesheet" href="layui/css/login.css" media="all">
  <script src="js/jquery/2.0.0/jquery.min.js"></script>
  <script src="layui/layui.js"></script>

  
</head>
<body>  

<script>
	$(function(){
	    $("#adminForm").submit(function(){
	        if(0==$("#name").val().length||0==$("#password").val().length){
	        	layer.msg('请输入账号和密码'); 
	            return false;
	        }
	        layer.msg('请输入账号和密码'); 
	        return true;
	    });
	});
</script>


<form method="post" id="adminForm" action="admin_login" enctype="multipart/form-data" class="layui-form layui-form-pane">
<div class="layadmin-user-login layadmin-user-display-show"  style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>管理员登录</h2>
        <p>欢迎登录后台管理系统</p>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" ></label>
          <input type="text" name="name"   placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" ></label>
          <input type="password" name="password"   placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <button type="submit" class="layui-btn layui-btn-fluid" >登 入</button>
        </div>
      </div>
    </div>
</div>
</form>
</body>
<script>
layui.use('layer', function(){
  var layer = layui.layer;
});    
</script>
</html>