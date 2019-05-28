<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<%@include file="include/modal.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="css/optstyle.css" rel="stylesheet" type="text/css" />

	</head>
	<script>
	
	//删除订单项
	var deleteOrderItem = false;
	var deleteOrderItemid = 0;
	$(function(){
		$("a.deleteOrderItem").click(function(){
			deleteOrderItem = false;
			var oiid = $(this).attr("oiid")
			deleteOrderItemid = oiid;
			$("#deleteConfirmModal").modal('show');	   
		});
		$("button.deleteConfirmButton").click(function(){
			deleteOrderItem = true;
			$("#deleteConfirmModal").modal('hide');
		});
		
		$('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
			if(deleteOrderItem){
				var page="foredeleteOrderItem";
				$.post(
					    page,
					    {"oiid":deleteOrderItemid},
					    function(result){
							if("success"==result){
								location.reload(true);
							}
							else{
								location.href="login";
							}
					    }
					);
			}
		})	
		
		//勾选或取消勾选选择商品图标
		$("img.cartProductItemIfSelected").click(function(){
			var selectit = $(this).attr("selectit")
			if("selectit"==selectit){
				$(this).attr("src","img/site/cartNotSelected.png");
				$(this).attr("selectit","false")
			}
			else{
				$(this).attr("src","img/site/cartSelected.png");
				$(this).attr("selectit","selectit")
			}
			//当勾选或取消勾选时，对其他部件进行相应的设置
			syncSelect();
			syncCreateOrderButton();
			calcCartSumPriceAndNumber();
		});
		
		//全选按钮，全选或全不选
		$("img.selectAllItem").click(function(){
			var selectit = $(this).attr("selectit")
			if("selectit"==selectit){
				$("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
				$("img.selectAllItem").attr("selectit","false")
				$(".cartProductItemIfSelected").each(function(){
					$(this).attr("src","img/site/cartNotSelected.png");
					$(this).attr("selectit","false");
				});			
			}
			else{
				$("img.selectAllItem").attr("src","img/site/cartSelected.png");
				$("img.selectAllItem").attr("selectit","selectit")
				$(".cartProductItemIfSelected").each(function(){
					$(this).attr("src","img/site/cartSelected.png");
					$(this).attr("selectit","selectit");
				});				
			}
			syncCreateOrderButton();
			calcCartSumPriceAndNumber();
		});
		
		//点击提交按钮时，获取已选的订单项id,页面跳转
		$("button.createOrderButton").click(function(){
			var params = "";
			$(".cartProductItemIfSelected").each(function(){
				if("selectit"==$(this).attr("selectit")){
					var oiid = $(this).attr("oiid");
					params += "&oiid="+oiid;
				}
			});
			params = params.substring(1);
			location.href="forebuy?"+params;
		});
	})
	
	//判断是否全选，当有一个订单项没有选择时，则全选取消
	function syncSelect(){
		var selectAll = true;
		$(".cartProductItemIfSelected").each(function(){
			if("false"==$(this).attr("selectit")){
				selectAll = false;
			}
		});
		
		if(selectAll)
			$("img.selectAllItem").attr("src","img/site/cartSelected.png");
		else
			$("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
	}
	
	//设置结算按钮，当有商品被选择时才能结算
	function syncCreateOrderButton(){
		var selectAny = false;
		$(".cartProductItemIfSelected").each(function(){
			if("selectit"==$(this).attr("selectit")){
				selectAny = true;
			}
		});
		
		if(selectAny){
			$("button.createOrderButton").css("background-color","#FF3300");
			$("button.createOrderButton").removeAttr("disabled");
		}
		else{
			$("button.createOrderButton").css("background-color","#FFCC99");
			$("button.createOrderButton").attr("disabled","disabled");		
		}
	}

	//根据已选订单项，获取价格和数量，计算并设置总金额和数量
	function calcCartSumPriceAndNumber(){
		var sum = 0;
		var totalNumber = 0;
		$("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
			var oiid = $(this).attr("oiid");
			var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
			price = price.replace(/,/g, "");
			price = price.replace(/￥/g, "");
			sum += new Number(price);	
			
			var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
			totalNumber += new Number(num);	
		});
		
		$("span.cartSumPrice").html("￥"+formatMoney(sum));
		$("span.cartSumNumber").html(totalNumber);
	}
	</script>	


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

			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
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
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="clear"></div>
							<div class="bundle-main">
							<c:forEach items="${ois}" var="oi">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
							<img selectit="false" oiid="${oi.id}" class="cartProductItemIfSelected" src="img/site/cartNotSelected.png">
							<a style="display:none" href="#nowhere"><img src="img/site/cartSelected.png"></a>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="foreproduct?pid=${oi.product.id}" target="_blank" data-title="${oi.product.name}" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="img/productSingle_middle/${oi.product.firstProductImage.id}.png" class="itempic J_ItemImg"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="foreproduct?pid=${oi.product.id}" target="_blank" title="${oi.product.name}" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">

										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">￥${oi.product.originalPrice}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">￥${oi.product.promotePrice}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													
													<input type="text" style="width:20px" pid="${oi.product.id}" oiid="${oi.id}" class="orderItemNumberSetting" autocomplete="off" value="${oi.number}" disabled="disabled">
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<span class="cartProductItemSmallSumPrice" oiid="${oi.id}" pid="${oi.product.id}" >
										￥<fmt:formatNumber type="number" value="${oi.product.promotePrice*oi.number}" minFractionDigits="2"/>
										</span>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a href="#nowhere" oiid="${oi.id}" class="deleteOrderItem">删除</a>
										</div>
									</li>
								</ul>
								</c:forEach>		
						
							</div>
						</div>
					</tr>
					<div class="clear"></div>

				</div>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
						</div>
						<span>全选</span>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span>已选商品 <span class="cartSumNumber" >0</span> 件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span>合计 : </span> 
							<span class="cartSumPrice" >￥0.00</span>
						</div>
<!-- 						<div class="btn-area"> -->
<!-- 							<a href="" id="J_Go"  disabled="disabled" class="createOrderButton submit-btn" aria-label="请注意如果没有选择宝贝，将无法结算"> -->
<!-- 								<span>结&nbsp;算</span></a> -->
								<button type="submit" class="createOrderButton am-btn am-btn-warning"  style="height:50px;width:90px;" disabled="disabled" >结  算</button>
<!-- 						</div> -->
					</div>

				</div>
			</div>
	</body>

</html>