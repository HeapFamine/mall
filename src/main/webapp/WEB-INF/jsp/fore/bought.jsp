<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">待评价</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${os}" var="o">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#">${o.orderCode}</a></div>
													<span>成交时间：<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
												
													<div class="order-left">
													<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="foreproduct?pid=${oi.product.id}" class="J_MakePoint">
																		<img src="img/productSingle_middle/${oi.product.firstProductImage.id}.png" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="foreproduct?pid=${oi.product.id}">
																			<p>${oi.product.name}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${oi.product.promotePrice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${oi.number}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
														</c:forEach>    
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${o.total}
																<p>含运费：<span>00.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:if test="${o.status=='waitConfirm'}">
																		<a href="foreorderConfirmed?oid=${o.id}">
																			<button class="am-btn am-btn-danger anniu">确认收货</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='waitPay'}">
																		<a href="forealipay?oid=${o.id}&total=${o.total}">
																			<button class="am-btn am-btn-danger anniu">付款</button>
																		</a>								
																	</c:if>
																	
																	<c:if test="${o.status=='waitDelivery'}">
																		<span>待发货</span>
																	</c:if>
									
																	<c:if test="${o.status=='waitReview'}">
																		<a href="forereview?oid=${o.id}">
																			<button  class="am-btn am-btn-danger anniu">评价</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='finish'}">
																		<span>已完成<span>
																	</c:if>
																	<c:if test="${o.status=='delete'}">
																		<span>已删除<span>
																	</c:if>
																	
																</div>
															</li>
															<li class="td td-change">
																<div  class="am-btn am-btn-danger anniu"><a href="foredeleteOrder?oid=${o.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
												
											</div>
										</c:forEach>
										</div>

									</div>

								</div>


								<!-twoo!>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${os}" var="o">
										<c:if test="${o.status=='waitPay'}">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#">${o.orderCode}</a></div>
													<span>成交时间：<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
												
													<div class="order-left">
													<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="foreproduct?pid=${oi.product.id}" class="J_MakePoint">
																		<img src="img/productSingle_middle/${oi.product.firstProductImage.id}.png" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="foreproduct?pid=${oi.product.id}">
																			<p>${oi.product.name}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${oi.product.promotePrice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${oi.number}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
														</c:forEach>    
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${o.total}
																<p>含运费：<span>00.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:if test="${o.status=='waitConfirm'}">
																		<a href="foreorderConfirmed?oid=${o.id}">
																			<button class="am-btn am-btn-danger anniu">确认收货</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='waitPay'}">
																		<a href="forealipay?oid=${o.id}&total=${o.total}">
																			<button class="am-btn am-btn-danger anniu">付款</button>
																		</a>								
																	</c:if>
																	
																	<c:if test="${o.status=='waitDelivery'}">
																		<span>待发货</span>
																	</c:if>
									
																	<c:if test="${o.status=='waitReview'}">
																		<a href="forereview?oid=${o.id}">
																			<button  class="am-btn am-btn-danger anniu">评价</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='finish'}">
																		<span>已完成<span>
																	</c:if>
																	<c:if test="${o.status=='delete'}">
																		<span>已删除<span>
																	</c:if>
																	
																</div>
															</li>
															<li class="td td-change">
																<div  class="am-btn am-btn-danger anniu"><a href="foredeleteOrder?oid=${o.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
												
											</div>
											</c:if>
										</c:forEach>
										</div>

									</div>
								</div>


								<!tab3!>
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${os}" var="o">
										<c:if test="${o.status=='waitDelivery'}">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#">${o.orderCode}</a></div>
													<span>成交时间：<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
												
													<div class="order-left">
													<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="foreproduct?pid=${oi.product.id}" class="J_MakePoint">
																		<img src="img/productSingle_middle/${oi.product.firstProductImage.id}.png" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="foreproduct?pid=${oi.product.id}">
																			<p>${oi.product.name}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${oi.product.promotePrice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${oi.number}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
														</c:forEach>    
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${o.total}
																<p>含运费：<span>00.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:if test="${o.status=='waitConfirm'}">
																		<a href="foreorderConfirmed?oid=${o.id}">
																			<button class="am-btn am-btn-danger anniu">确认收货</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='waitPay'}">
																		<a href="forealipay?oid=${o.id}&total=${o.total}">
																			<button class="am-btn am-btn-danger anniu">付款</button>
																		</a>								
																	</c:if>
																	
																	<c:if test="${o.status=='waitDelivery'}">
																		<span>待发货</span>
																	</c:if>
									
																	<c:if test="${o.status=='waitReview'}">
																		<a href="forereview?oid=${o.id}">
																			<button  class="am-btn am-btn-danger anniu">评价</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='finish'}">
																		<span>已完成<span>
																	</c:if>
																	<c:if test="${o.status=='delete'}">
																		<span>已删除<span>
																	</c:if>
																	
																</div>
															</li>
															<li class="td td-change">
																<div  class="am-btn am-btn-danger anniu"><a href="foredeleteOrder?oid=${o.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
												
											</div>
											</c:if>
										</c:forEach>
										</div>

									</div>
								</div>


								
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${os}" var="o">
										<c:if test="${o.status=='waitConfirm'}">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#">${o.orderCode}</a></div>
													<span>成交时间：<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
												
													<div class="order-left">
													<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="foreproduct?pid=${oi.product.id}" class="J_MakePoint">
																		<img src="img/productSingle_middle/${oi.product.firstProductImage.id}.png" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="foreproduct?pid=${oi.product.id}">
																			<p>${oi.product.name}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${oi.product.promotePrice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${oi.number}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
														</c:forEach>    
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${o.total}
																<p>含运费：<span>00.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:if test="${o.status=='waitConfirm'}">
																		<a href="foreorderConfirmed?oid=${o.id}">
																			<button class="am-btn am-btn-danger anniu">确认收货</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='waitPay'}">
																		<a href="forealipay?oid=${o.id}&total=${o.total}">
																			<button class="am-btn am-btn-danger anniu">付款</button>
																		</a>								
																	</c:if>
																	
																	<c:if test="${o.status=='waitDelivery'}">
																		<span>待发货</span>
																	</c:if>
									
																	<c:if test="${o.status=='waitReview'}">
																		<a href="forereview?oid=${o.id}">
																			<button  class="am-btn am-btn-danger anniu">评价</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='finish'}">
																		<span>已完成<span>
																	</c:if>
																	<c:if test="${o.status=='delete'}">
																		<span>已删除<span>
																	</c:if>
																	
																</div>
															</li>
															<li class="td td-change">
																<div  class="am-btn am-btn-danger anniu"><a href="foredeleteOrder?oid=${o.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
												
											</div>
										</c:if>
										</c:forEach>
										</div>

									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${os}" var="o">
										<c:if test="${o.status=='waitReview'}">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#">${o.orderCode}</a></div>
													<span>成交时间：<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
												
													<div class="order-left">
													<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="foreproduct?pid=${oi.product.id}" class="J_MakePoint">
																		<img src="img/productSingle_middle/${oi.product.firstProductImage.id}.png" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="foreproduct?pid=${oi.product.id}">
																			<p>${oi.product.name}</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${oi.product.promotePrice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${oi.number}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
														</c:forEach>    
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${o.total}
																<p>含运费：<span>00.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:if test="${o.status=='waitConfirm'}">
																		<a href="foreorderConfirmed?oid=${o.id}">
																			<button class="am-btn am-btn-danger anniu">确认收货</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='waitPay'}">
																		<a href="forealipay?oid=${o.id}&total=${o.total}">
																			<button class="am-btn am-btn-danger anniu">付款</button>
																		</a>								
																	</c:if>
																	
																	<c:if test="${o.status=='waitDelivery'}">
																		<span>待发货</span>
																	</c:if>
									
																	<c:if test="${o.status=='waitReview'}">
																		<a href="forereview?oid=${o.id}">
																			<button  class="am-btn am-btn-danger anniu">评价</button>
																		</a>
																	</c:if>
																	<c:if test="${o.status=='finish'}">
																		<span>已完成<span>
																	</c:if>
																	<c:if test="${o.status=='delete'}">
																		<span>已删除<span>
																	</c:if>
																	
																</div>
															</li>
															<li class="td td-change">
																<div  class="am-btn am-btn-danger anniu"><a href="foredeleteOrder?oid=${o.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
												
											</div>
										</c:if>
										</c:forEach>
										</div>

									</div>

								</div>
							</div>

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