<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*"%>

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
<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding: 80px 10px ;">
  
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>订单详情</legend>
	</fieldset>   
	 
	<div style="padding: 20px; background-color: #F2F2F2;">
	  <div class="layui-row layui-col-space15">
	    <div class="layui-col-md6">
	      <div class="layui-card">
	        <div class="layui-card-header  layui-col-md-offset3" style="font-size: 20px;">订单号：${o.orderCode}</div>
	        <div class="layui-card-body" style="font-size: 20px;">
	            <label>状态：</label>${o.statusDesc}<br>
	            <label>金额：</label>￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/><br>
	            <label>商品数量：</label>${o.totalNumber}<br>
	            <label>买家名称：</label>${o.receiver}<br>
	            <label>地址：</label>${o.address}<br>
	            <label>电话：</label>${o.mobile}<br>
	            <label>创建时间：</label><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
	            <label>支付时间：</label><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
	            <label>发货时间：</label><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
	            <label>确认收货时间：</label><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
				<c:if test="${o.status =='waitDelivery'}">
				<a href="admin_order_delivery?id=${o.id}">
					<button class="layui-btn layui-col-md-offset5" style="font-size: 20px;">发货</button>
				</a>
				</c:if>
				<c:if test="${o.status !='waitDelivery'}">
				<a href="admin_order_delivery?id=${o.id}">
					<button class="layui-btn layui-btn-disabled layui-col-md-offset5 " disabled="disabled" style="font-size: 20px;">已发货</button>
				</a>
				</c:if>
	        </div>
	      </div>
	    </div>
	
	    <div class="layui-col-md6">
	      <div class="layui-card">
	        <div class="layui-card-header  layui-col-md-offset5" style="font-size: 18px;">商品</div>
	        <div class="layui-card-body">
	         <div class="layui-form">
				  <table class="layui-table">
				    <colgroup>
				      <col width="200">
				      <col width="150">
				      <col width="150">
				      <col>
				    </colgroup>
				    <thead>
				      <tr>
				        <th>商品名称</th>
				        <th>数量</th>
				        <th>单价</th>
				      </tr> 
				    </thead>
				    <tbody>
				      <c:forEach items="${o.orderItems}" var="oi">
						<tr>
							<td><a href="foreproduct?pid=${oi.product.id}"><span>${oi.product.name}</span></a></td>
							<td><span class="text-muted">${oi.number}个</span></td>
							<td><span class="text-muted">￥${oi.product.promotePrice}</span></td>
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
</div>

<script>
layui.use('layer', function(){
  var layer = layui.layer;
});    
</script>
</body>
</html>