<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="Header.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title></title>
</head>
<body>
 
<script>
    $(function(){
        $(".addForm").submit(function(){
            if(checkEmpty("filepath","图片文件")){
                $("#filepath").value("");
                return true;
            }
            return false;
        });
    });
</script> 

<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding: 80px 10px ;">  	
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>首页轮播图片管理</legend>
	</fieldset>

	<div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md6">
	      <div class="layui-card">
	        <div class="layui-card-header  layui-col-md-offset3" style="font-size: 20px;color:#FF0000;">新增轮播图</div>
		        <div class="layui-card-body " style="font-size: 16px;">
			         <div class="layui-form">
						<form method="post" class="addForm" action="admin_CarouselImage_add" enctype="multipart/form-data" class="layui-form layui-form-pane">
	
							 <table class="layui-table">
								<tr>
									<td>
										<div class="layui-form-item">
											<label class="layui-form-label">轮播图描述</label>
										    <div class="layui-input-inline">
										      <input id="description" type="text" name="description" autocomplete="off" placeholder="请输入轮播图描述" class="layui-input">
										    </div>
										</div>
										<div class="layui-form-item">
											<input id="filepath" type="file" name="image" />
											<button type="submit" class="layui-btn">立即提交</button>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
		        </div>
	      </div>
	    </div>
	
		<div class="layui-col-md6">
	      <div class="layui-card">
		        <div class="layui-card-body " style="font-size: 20px;">
			         <div class="layui-form">
						  <table class="layui-table">
						    <colgroup>
						      <col width="100">
						      <col width="300">
						      <col width="150">
						      <col>
						    </colgroup>
						    <thead>
						      <tr>
						        <th>ID</th>
						        <th>描述</th>
						        <th>产品单个图片缩略图</th>
						        <th>删除</th>
						      </tr> 
						    </thead>
							<tbody>
							<c:forEach items="${ci}" var="cii">
								<tr>
									<td>${cii.id}</td>
									<td>${cii.description}</td>
									<td>
										<a title="点击查看原图" href="img/lunbo/${cii.id}.png"><img height="50px" src="img/lunbo_small/${cii.id}.png"></a>
									</td>
									<td>
										<a href="admin_CarouselImage_delete?id=${cii.id}" class="layui-btn"><i class="layui-icon layui-icon-delete"></i>删除</a>
									</td>
	
								</tr>
							</c:forEach>
							</tbody>
						  </table>
					</div>
		        </div>
		      </div>
	    </div>
	    
	</div> 
	
  </div>
</div>

<script>
layui.use(['table', 'layer', 'jquery', 'form', 'element'], function(){
    var table = layui.table;
    var layer = layui.layer;
    var $ = layui.jquery;
    var form = layui.form;
    var element = layui.element;
});
</script>


</body>
</html>