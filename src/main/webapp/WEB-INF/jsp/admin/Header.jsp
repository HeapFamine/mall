<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %> 

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>商场后台布局</title>
  <link rel="stylesheet" href="layui/css/layui.css">
  <script src="js/jquery/2.0.0/jquery.min.js"></script>
  <script src="layui/layui.js"></script>
</head>
<script type="text/javascript">
function createTime(v){
	var date = new Date(v);
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    m = m<10?'0'+m:m;
    var d = date.getDate();
    d = d<10?("0"+d):d;
    var h = date.getHours();
    h = h<10?("0"+h):h;
    var M = date.getMinutes();
    M = M<10?("0"+M):M;
    var str = y+"-"+m+"-"+d+" "+h+":"+M;
    if(str == "1970-01-01 08:00"){
    	str="";
    }
    return str;
}
</script>

<script>

//用于检验是否为空
function checkEmpty(id, name){
	var value = $("#"+id).val();
	if(value.length==0){
		layer.msg(name+ "不能为空"); 
		return false;
	}
	return true;
}

//用于检验是否为空且是否为数字
function checkNumber(id, name){
	var value = $("#"+id).val();
	if(value.length==0){
		layer.msg(name+ "不能为空"); 
		return false;
	}
	if(isNaN(value)){
		layer.msg(name+ "必须是数字"); 
		return false;
	}
	return true;
}

//判断是否为空且是否为整数
function checkInt(id, name){
	var value = $("#"+id).val();
	if(value.length==0){
		layer.msg(name+ "不能为空"); 
		return false;
	}
	if(parseInt(value)!=value){
		layer.msg(name+ "必须是整数"); 
		return false;
	}
	return true;
}
</script>	

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo" style="font-size: 21px;">后台管理</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left" >
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          ${admin.name}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="admin_logout">退了</a></li>
    </ul>
  </div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll" >
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree "  lay-filter="test">
      <li class="layui-nav-item layui-nav-itemed" ><a href="javascript:;"> <i class="layui-icon layui-icon-util"></i>库存管理</a> 
        <dl class="layui-nav-child">
	      <dd><a href="admin_category_list">分类管理</a></dd>
    	</dl>
      </li>

      <li class="layui-nav-item layui-nav-itemed" ><a href="javascript:;"> <i class=" layui-icon layui-icon-user"></i>用户管理</a> 
       	<dl class="layui-nav-child">
	      <dd><a href="admin_user_list">用户</a></dd>
    	</dl>
    	<dl class="layui-nav-child">
	      <dd><a href="admin_list">管理员</a></dd>
    	</dl>
      </li>

      <li class="layui-nav-item layui-nav-itemed" ><a href="javascript:;"> <i class="layui-icon layui-icon-list"></i>订单管理</a>
       	<dl class="layui-nav-child">
	      <dd><a href="admin_order_list">订单</a></dd>
    	</dl>
      </li>
      <li class="layui-nav-item layui-nav-itemed" ><a href="javascript:;"> <i class="layui-icon layui-icon-list"></i>评论管理</a>
       	<dl class="layui-nav-child">
	      <dd><a href="admin_review_list">评论</a></dd>
    	</dl>
      </li>
      <li class="layui-nav-item layui-nav-itemed" ><a href="javascript:;"> <i class="layui-icon layui-icon-picture"></i>轮播图管理</a>
       	<dl class="layui-nav-child">
	      <dd><a href="admin_CarouselImage_list">轮播图</a></dd>
    	</dl>
      </li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>