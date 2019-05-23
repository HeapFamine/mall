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
        $("#addForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
            if (!checkNumber("originalPrice", "原价格"))
                return false;
            if (!checkNumber("promotePrice", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });
</script>


<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding:  80px 10px ;">
  
  	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>增加产品</legend>
	</fieldset>
  
	<a href="admin_product_list?cid=${c.id}" class="layui-btn"><i class="layui-icon layui-icon-return"></i> 返回产品列表</a>
	
	<form method="post" id="addForm" action="admin_product_add" enctype="multipart/form-data" class="layui-form layui-form-pane layui-col-md-offset4">
	  <div class="layui-form-item">
	    <label class="layui-form-label">产品名称</label>
	    <div class="layui-input-inline">
	      <input id="name" type="text" name="name" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">产品小标题</label>
	    <div class="layui-input-inline">
	      <input id="subTitle" type="text" name="subTitle" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">原价格</label>
	    <div class="layui-input-inline">
	      <input id="originalPrice" type="text" name="originalPrice" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	
		<div class="layui-form-item">
	    <label class="layui-form-label">优惠价格</label>
	    <div class="layui-input-inline">
	      <input id="promotePrice" type="text" name="promotePrice" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    
	    <div class="layui-form-item">
	    <label class="layui-form-label">库存</label>
	    <div class="layui-input-inline">
	      <input id="stock" type="text" name="stock" autocomplete="off"  class="layui-input" style = "width:240px;">
	    </div>
	    </div>
	    <div class="layui-form-item layui-col-md-offset2">
	    <input type="hidden" name="cid" value="${c.id}">
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