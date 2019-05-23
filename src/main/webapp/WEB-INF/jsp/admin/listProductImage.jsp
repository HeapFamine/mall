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
        $(".addFormSingle").submit(function(){
            if(checkEmpty("filepathSingle","图片文件")){
                $("#filepathSingle").value("");
                return true;
            }
            return false;
        });
        $(".addFormDetail").submit(function(){
            if(checkEmpty("filepathDetail","图片文件"))
                return true;
            return false;
        });
    });
</script> 

<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding: 80px 10px ;">
  	<a href="admin_product_list?cid=${p.cid}" class="layui-btn"><i class="layui-icon layui-icon-return"></i> 返回产品列表</a>
  	
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>图片管理</legend>
	</fieldset>

	<div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md6">
	      <div class="layui-card">
	        <div class="layui-card-header  layui-col-md-offset3" style="font-size: 20px;color:#FF0000;">新增产品单个图片</div>
		        <div class="layui-card-body " style="font-size: 20px;">
			         <div class="layui-form">
						<form method="post" class="addFormSingle" action="admin_productImage_add" enctype="multipart/form-data">
							 <table class="layui-table">
								<tr>
									<td align="center">
										<input id="filepathSingle" type="file" name="image" />
										<input type="hidden" name="type" value="type_single" />
										<input type="hidden" name="pid" value="${p.id}" />
										<button type="submit" class="layui-btn">提 交</button>
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
	        <div class="layui-card-header  layui-col-md-offset3" style="font-size: 20px;color:#FF0000;">新增产品详情图片</div>
		        <div class="layui-card-body " style="font-size: 20px;">
			         <div class="layui-form">
						<form method="post" class="addFormDetail" action="admin_productImage_add" enctype="multipart/form-data">
							 <table class="layui-table">
								<tr>
									<td align="center">
										<input id="filepathDetail" type="file" name="image" />
										<input type="hidden" name="type" value="type_detail" />
										<input type="hidden" name="pid" value="${p.id}" />
										<button type="submit" class="layui-btn">提 交</button>
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
						        <th>产品单个图片缩略图</th>
						        <th>删除</th>
						      </tr> 
						    </thead>
							<tbody>
							<c:forEach items="${pisSingle}" var="pi">
								<tr>
									<td>${pi.id}</td>
									<td>
										<a title="点击查看原图" href="img/productSingle/${pi.id}.png"><img height="50px" src="img/productSingle/${pi.id}.png"></a>
									</td>
									<td>
										<a href="admin_productImage_delete?id=${pi.id}" class="layui-btn"><i class="layui-icon layui-icon-delete"></i>删除</a>
									</td>
	
								</tr>
							</c:forEach>
							</tbody>
						  </table>
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
						        <th>产品详情图片缩略图</th>
						        <th>删除</th>
						      </tr> 
						    </thead>
							<tbody>
							<c:forEach items="${pisDetail}" var="pi">
								<tr>
									<td>${pi.id}</td>
									<td>
										<a title="点击查看原图" href="img/productDetail/${pi.id}.png"><img height="50px" src="img/productDetail/${pi.id}.png"></a>
									</td>
									<td>
										<a href="admin_productImage_delete?id=${pi.id}" class="layui-btn"><i class="layui-icon layui-icon-delete"></i>删除</a>
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
layui.use('layer', function(){
  var layer = layui.layer;
});    
</script>

</body>
</html>