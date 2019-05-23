<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<%@include file="include/modal.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>搜索页面</title>

		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</head>

	<body>
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
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${contextPath}">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						</div>
			</div>
			
					<c:if test="${empty param.categorycount}">
						<c:set var="categorycount" scope="page" value="100"/>
					</c:if>
					
					<c:if test="${!empty param.categorycount}">
						<c:set var="categorycount" scope="page" value="${param.categorycount}"/>
					</c:if>
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
							<div class="search-content">
								<div class="sort">
									<li class="first"><a title="综合"><a href="?cid=${c.id}&sort=all">综合排序</a></a></li>
									<li><a title="销量"><a href="?cid=${c.id}&sort=saleCount">销量排序</a></a></li>
									<li><a title="价格"><a href="?cid=${c.id}&sort=price">价格排序</a></a></li>
									<li><a title="评论"><a href="?cid=${c.id}&sort=review">评论排序</a></a></li>
								</div>
								<div class="clear"></div>
							
							
								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
								<c:forEach items="${c.products}" var="p" varStatus="stc">
									<c:if test="${stc.count<=categorycount}">
									<li>
										<div class="i-pic limit">
											<a href="foreproduct?pid=${p.id}"><img src="img/productSingle/${p.firstProductImage.id}.png"></a>										
											<p class="title fl"><a href="foreproduct?pid=${p.id}">${p.name}</a></p>
											<p class="price fl">
												<b>¥</b>
												<strong>${p.promotePrice}</strong>
											</p>
											<p class="number fl">
												销量<span>${p.saleCount}</span>
											</p>
										</div>
									</li>
									</c:if>
								</c:forEach>
								</ul>
							</div>
							
				</div>
			</div>

		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>

		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>

</html>