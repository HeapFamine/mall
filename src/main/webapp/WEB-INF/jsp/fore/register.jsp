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
	        <c:if test="${!empty msg}">
	        $("span.errorMessage").html("${msg}");
	        $("div.registerErrorMessageDiv").show();
	        </c:if>

	        $(".registerForm").submit(function(){
	            if(0==$("#name").val().length){
	                $("span.errorMessage").html("请输入用户名");
	                $("div.registerErrorMessageDiv").show();
	                return false;
	            }
	            if(0==$("#password").val().length){
	                $("span.errorMessage").html("请输入密码");
	                $("div.registerErrorMessageDiv").show();
	                return false;
	            }
	            if(0==$("#repeatpassword").val().length){
	                $("span.errorMessage").html("请输入重复密码");
	                $("div.registerErrorMessageDiv").show();
	                return false;
	            }
	            if($("#password").val() !=$("#repeatpassword").val()){
	                $("span.errorMessage").html("重复密码不一致");
	                $("div.registerErrorMessageDiv").show();
	                return false;
	            }

	            return true;
	        });
	        //当有表单有数据输入，ErrorMessage隐藏
	        $("form.registerForm input").keyup(function(){
	            $("div.registerErrorMessageDiv").hide();
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

						<h3 class="title">注册用户</h3>

						<div class="clear"></div>
							<div class="registerErrorMessageDiv">
								<div class="alert alert-danger" >
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
									<span class="errorMessage"></span>
								</div>
							</div>
						
						<div class="login-form">
							<form method="post" method="post" action="foreregister" class="registerForm">
										<div class="registerErrorMessageDiv">
											<div class="alert alert-danger" >
												<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
												<span class="errorMessage"></span>
											</div>
										</div>
													
										   <div class="user-email">
													<label for="name"><i class="am-icon-envelope-o"></i></label>
													<input type="name" name="name" id="name" placeholder="请输入用户名">
			                			 </div>			
			                			 							
						                 <div class="user-pass">
														    <label for="password"><i class="am-icon-lock"></i></label>
														    <input type="password" name="password" id="password" placeholder="设置密码">
						                 </div>			
						                 							
						                 <div class="user-pass">
														    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
														    <input type="password"  id="repeatpassword" placeholder="确认密码">
						                 </div>	

										<div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
			                 </form>  
           				</div>

				</div>
			</div>
		</div>

	</body>

</html>