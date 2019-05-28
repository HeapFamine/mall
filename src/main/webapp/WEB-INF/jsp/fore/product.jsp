<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="basic/js/quick_links.js"></script>

		<script type="text/javascript" src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="js/list.js"></script>

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
			<div class="listMain">

				<!--分类-->
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
						</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

            				<div class="tb-booth tb-pic tb-s310">
								<a href="img/productSingle/${p.firstProductImage.id}.png"><img src="img/productSingle/${p.firstProductImage.id}.png" alt="细节展示放大镜特效" rel="img/productSingle/${p.firstProductImage.id}.png" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<c:forEach items="${p.productSingleImages}" var="pi" varStatus="Status">
									<c:if test="${Status.first}">
										<li class="tb-selected">
											<div class="tb-pic tb-s40">
												<a href=""><img src="img/productSingle_small/${pi.id}.png" mid="img/productSingle/${pi.id}.png" big="img/productSingle/${pi.id}.png"></a>
											</div>
										</li>
									</c:if>
									<c:if test="${!Status.first}">
										<li>
											<div class="tb-pic tb-s40">
												<a href=""><img src="img/productSingle_small/${pi.id}.png" mid="img/productSingle/${pi.id}.png" big="img/productSingle/${pi.id}.png"></a>
											</div>
										</li>
									</c:if>

								</c:forEach>
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
				 				${p.name}
	          				</h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<dd><em>¥</em><b class="sys_item_price">${p.promotePrice}</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<dd><em>¥</em><b class="sys_item_mktprice">${p.originalPrice}</b></dd>									
								</li>
								<div class="clear"></div>
							</div>

							<div class="clear"></div>

							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">${p.saleCount}</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">${p.reviewCount}</span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">

												<div class="theme-signin-left">
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input class="productNumberSetting" id="text_box" name="" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">${p.stock}</span>件</span>
														</dd>

													</div>
													<div class="clear"></div>

													<div class="btn-op">
														<div class="btn am-btn am-btn-warning">确认</div>
														<div class="btn close am-btn am-btn-warning">取消</div>
													</div>
												</div>
												<div class="theme-signin-right">
													<div class="img-info">
														<img src="images/songzi.jpg" />
													</div>
													<div class="text-info">
														<span class="J_Price price-now">¥39.00</span>
														<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
													</div>
												</div>

											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							
							<div class="shopPromotion gold">
								<div class="hot">
									<dt class="tb-metatit">小标题</dt>
									<div class="gold-list">
										<p>${p.subTitle} </p>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						
						<script>
							$(function(){
							    var stock = ${p.stock};
							    $(".productNumberSetting").keyup(function(){
							        var num= $(".productNumberSetting").val();
							        num = parseInt(num);
							        if(isNaN(num))
							            num= 1;
							        if(num<=0)
							            num = 1;
							        if(num>stock)
							            num = stock;
							        $(".productNumberSetting").val(num);
							    });
							     
// 							    $(".increaseNumber").click(function(){
// 							        var num= $(".productNumberSetting").val();
// 							        num++;
// 							        if(num>stock)
// 							            num = stock;
// 							        $(".productNumberSetting").val(num);
// 							    });
// 							    $(".decreaseNumber").click(function(){
// 							        var num= $(".productNumberSetting").val();
// 							        --num;
// 							        if(num<=0)
// 							            num=1;
// 							        $(".productNumberSetting").val(num);
// 							    });
							     
							    $(".addCartLink").click(function(){
							    	//判断是否登录了
							        var page = "forecheckLogin";
							        $.get(
							                page,
							                function(result){
							                    if("success"==result){
							                        var pid = ${p.id};
							                        var num= $(".productNumberSetting").val();
							                        var addCartpage = "foreaddCart";
							                        //加入购物车
							                        $.get(
							                                addCartpage,
							                                {"pid":pid,"num":num},
							                                function(result){
							                                    if("success"==result){
							                                    	location.href= $(".addCartLink").attr("href");
							                                    }
							                                }
							                        );                          
							                    }
							                    else{
							                    	location.href="loginPage";                    
							                    }
							                }
							        );      
							        return false;
							    });
							    $(".buyLink").click(function(){
							        var page = "forecheckLogin";
							        $.get(
							                page,
							                function(result){
							                    if("success"==result){
							                        var num = $(".productNumberSetting").val();
							                        location.href= $(".buyLink").attr("href")+"&num="+num;
							                    }
							                    else{
							                        location.href="loginPage";
							                    }
							                }
							        );      
							        return false;
							    });
							     
							});
							 
							</script>

						<div class="pay">
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a  class="buyLink" href="forebuyone?pid=${p.id}" id="LikBuy" title="点此按钮到下一步确认购买信息">立即购买</a>
									
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a href="" class="addCartLink" id="LikBasket" title="加入购物车" ><i></i>加入购物车</a>
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>

				</div>
											
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2></h2>        
					            </div>
						     			      
					      
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>

							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="details">
										<div class="attr-list-hd after-market-hd">
											<h4>商品细节</h4>
										</div>
										<div class="twlistNews">
											<c:forEach items="${p.productDetailImages}" var="pi">
												<img src="img/productDetail/${pi.id}.png">
											</c:forEach>
										</div>
									</div>
									<div class="clear"></div>

								</div>

								<div class="am-tab-panel am-fade">

									<ul class="am-comments-list am-comments-list-flip">
										<li class="am-comment">
											<!-- 评论容器 -->
											<c:forEach items="${reviews}" var="r">
												<a href="">
													<img class="am-comment-avatar" src="images/hwbn40x40.jpg" />
													<!-- 评论者头像 -->
												</a>
									
												<div class="am-comment-main">
													<!-- 评论内容容器 -->
													<header class="am-comment-hd">
														<!--<h3 class="am-comment-title">评论标题</h3>-->
														<div class="am-comment-meta">
															<!-- 评论元数据 -->
															<a href="#link-to-user" class="am-comment-author">${r.user.anonymousName}</a>
															<!-- 评论者 -->
															评论于
															<time datetime=""><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></time>
														</div>
													</header>
									
													<div class="am-comment-bd">
														<div class="tb-rev-item " data-id="255776406962">
															<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
																${r.content }
															</div>
														</div>
									
													</div>
													<!-- 评论内容 -->
												</div>
											</c:forEach>
										
									<div class="clear"></div>

									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>
								</div>
							</div>

						</div>

						<div class="clear"></div>


					</div>

				</div>
			</div>

	</body>

</html>