<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>付款成功页面</title>
		<link rel="stylesheet"  type="text/css" href="AmazeUI-2.4.2/assets/css/amazeui.css"/>
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		
		<link href="css/sustyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>

	</head>

	<body>
		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
								<div class="menu-hd"><a href="${contextPath}" target="_top" class="h">商城首页</a></div>
						</div>
					</div>
				</ul>
				
				
				<ul class="message-r">
					<div class="topMessage">
						<div class="menu-hd">
							<c:if test="${!empty user}">
								<a href="loginPage">用户名：${user.name}</a>
							</c:if>
						</div>
					</div>
					<div class="topMessage">
						<div class="menu-hd">
							<c:if test="${!empty user}">
								<a href="forelogout">退出</a>
							</c:if>
						</div>
					</div>
				
				
					<div class="topMessage">
						<div class="menu-hd">
						<c:if test="${empty user}">
								<a href="loginPage" target="_top" class="h">亲，请登录</a>
						</c:if>
						</div>
					</div>
					<div class="topMessage">
						<div class="menu-hd">
						<c:if test="${empty user}">
								<a href="registerPage" target="_top">免费注册</a>
						</c:if>
						</div>
					</div>

					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="forebought" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="forecart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">${cartTotalItemNumber}</strong></a></div>
					</div>
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logo"><img src="images/logo.png" /></div>
					<div class="logoBig">
						<li><a href="${contextPath}"><img src="images/logobig.png" /></li></a>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form action="foresearch" method="post" >
							<input name="keyword" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>

			<%
					Date d = new Date();
					d.setDate(d.getDate()+1); 
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd ");
					String t = df.format(d);
			%>

			<div class="take-delivery">
			 <div class="status">
			   <h2>您已成功付款</h2>
			   <div class="successInfo">
			     <ul>
			       <li>付款金额<em>¥${param.total}</em></li>
			       <div class="user-info">
			         <p>收货人：${o.receiver}</p>
			         <p>联系电话：${o.mobile }</p>
			         <p>收货地址：${o.address}</p>
			         <p>预计        <%=t %>     送达	</p>
			       </div>
			             请认真核对您的收货信息，如有错误请联系客服
			                               
			     </ul>
			     <div class="option">
			       <span class="info">您可以</span>
			        <a href="forebought" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
			        <a href="forebought" class="J_MakePoint">查看<span>交易详情</span></a>
			     </div>
			    </div>
			  </div>
			</div>

</body>
</html>
