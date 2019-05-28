<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	</head>

	<body>
<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
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
							<div class="logoBig">
								<li><img src="images/logobig.png" /></li>
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
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="img/productSingle/${p.firstProductImage.id}.png" class="itempic">
									</a>
								</div>

								<div class="item-title">

									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${p.name}</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
										</div>
										<div class="item-price">
											价格：<strong>${p.originalPrice}</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<form method="post" action="foredoreview">
									<div class="item-comment">
										<textarea name="content" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
									</div>
									
									<input type="hidden" name="oid" value="${o.id}">
									<input type="hidden" name="pid" value="${p.id}">
<!-- 								<div class="info-btn"> -->
									<button type="submit" class="am-btn am-btn-danger">发表评论</button>
<!-- 	 							</div>		 -->
 								</form>
								
								<div class="item-opinion">
									<li><i class="op1"></i>好评</li>
									<li><i class="op2"></i>中评</li>
									<li><i class="op3"></i>差评</li>
								</div>
							</div>
						
													
													
								<script type="text/javascript">
									$(document).ready(function() {
										$(".comment-list .item-opinion li").click(function() {	
											$(this).prevAll().children('i').removeClass("active");
											$(this).nextAll().children('i').removeClass("active");
											$(this).children('i').addClass("active");
											
										});
							     })
								</script>					
					
												
							
						</div>

					</div>

				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="#"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="#">个人信息</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="forebought">订单管理</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>