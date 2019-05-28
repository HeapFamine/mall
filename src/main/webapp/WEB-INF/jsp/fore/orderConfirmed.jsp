<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

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
			<div class="orderFinishDiv">
				<div class="orderFinishTextDiv">
					<span>交易已经成功，卖家将收到您的货款。</span>
				</div>
			</div>
		</body>