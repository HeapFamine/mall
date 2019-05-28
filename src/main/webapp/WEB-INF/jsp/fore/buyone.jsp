<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>

		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="js/address.js"></script>

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




			<div class="clear"></div>
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
				<form action="buyone_createOrder" method="post" class="am-form am-form-horizontal">
					<div class="add-dress">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">填写地址</strong> / <small>Add&nbsp;address</small></div>
						</div>
						<hr/>

						<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">收货人</label>
									<div class="am-form-content">
										<input  name="receiver" value="${user.name}" placeholder="收货人" type="text">
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">手机号码</label>
									<div class="am-form-content">
										<input name="mobile"  value="${user.mobile}" placeholder="手机号必填" type="text">
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">详细地址</label>
									<div class="am-form-content">
										<input name="address" value="${user.address}" placeholder="详细地址必填" type="text">
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">邮政编码</label>
									<div class="am-form-content">
										<input name="post" placeholder="邮递区号" type="text">
									</div>
								</div>
						</div>

					</div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">单价</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">金额</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">配送方式</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>

							<tr id="J_BundleList_s_1911116345_1" class="item-list">
								<div id="J_Bundle_s_1911116345_1_0" class="bundle  bundle-last">
									<div class="bundle-main">
										<ul class="item-content clearfix">
										
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="foreproduct?pid=${p.id}" class="J_MakePoint">
															<img src="img/productSingle_middle/${p.firstProductImage.id}.png" class="itempic J_ItemImg"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="foreproduct?pid=${p.id}" target="_blank" title="${p.name}" class="item-title J_MakePoint" data-point="tbcart.8.11">${p.name}</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">${p.subTitle}</span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">${p.promotePrice}</em>
														</div>
													</div>
												</li>
											</div>

											<li class="td td-amount">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${num}</em>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${p.promotePrice*num}</em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														包邮
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
							</tr>
							</div>
							<div class="clear"></div>
							<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label>
										<input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>

							</div>
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>¥</span><em class="pay-sum">${p.promotePrice*num}</em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${p.promotePrice*num}</em>
											</span>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
<!-- 											<a id="J_Go" type="submit" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a> -->
											<button  type="submit" class="am-btn am-btn-warning am-fr" tabindex="0" title="点击此按钮，提交订单"  >提交订单</button>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
					</form>	
				</div>
			</div>
			<div class="clear"></div>
	</body>

</html>