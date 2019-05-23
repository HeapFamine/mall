<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="css/dlstyle.css" rel="stylesheet" type="text/css">
	</head>


	<script>
	    $(function(){
	    	//判断是否后台传过来的msg是否为空
			<c:if test="${!empty msg}">
	        $("span.errorMessage").html("${msg}");
	        $("div.loginErrorMessageDiv").show();
	        </c:if>

	        //判断是否账号密码为空
	        $("form.loginForm").submit(function(){
	            if(0==$("#name").val().length||0==$("#password").val().length){
	                $("span.errorMessage").html("请输入账号密码");
	                $("div.loginErrorMessageDiv").show();
	                return false;
	            }
	            return true;
	        });

	        //当有表单有数据输入，ErrorMessage隐藏
	        $("form.loginForm input").keyup(function(){
	            $("div.loginErrorMessageDiv").hide();
	        });
	        
	    })
	</script>

	<body>

		<div class="login-boxtitle">
			<a href="${contextPath}"><img alt="logo" src="images/logobig.png" /></a>
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="images/big.jpg" /></div>
				<div class="login-box">

						<h3 class="title">登录商城</h3>

						<div class="clear"></div>
					<div class="loginErrorMessageDiv">
						<div class="alert alert-danger" >
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
							<span class="errorMessage"></span>
						</div>
					</div>
						
						<div class="login-form">
						  <form class="loginForm" action="forelogin" method="post">

							   <div class="user-name">
								    <label for="name"><i class="am-icon-user"></i></label>
								    <input type="text" name="name" id="name" placeholder="邮箱/手机/用户名">
                 				</div>
                 				<div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password" placeholder="请输入密码">
                				 </div>
                				 <div class="am-cf">
									<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
								</div>
              			 </form>
           				</div>
            
			            <div class="login-links">
			                <label for="remember-me"><a href="#" class="am-fr">忘记登录密码</a></label>
							<a href="registerPage" class="am-fr">注册</a>
							<br />
			            </div>

						<div class="partner">		
								<h3>合作账号</h3>
							<div class="am-btn-group">
								<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
								<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
								<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
							</div>
						</div>	

				</div>
			</div>
		</div>

	</body>

</html>