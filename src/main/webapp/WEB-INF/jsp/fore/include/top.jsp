<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<nav class="top">
	<span>欢迎来到乐淘网</span>

	<span class="pull-right">
			<a href="${contextPath}">
				<span style="color:#C40000;margin:4px" class="glyphicon glyphicon-home redColor"></span>
				乐淘网首页
			</a>
			<c:if test="${!empty user}">
				<a href="loginPage">${user.name}</a>
				<a href="forelogout">退出</a>
			</c:if>
		
			<c:if test="${empty user}">
				<a href="loginPage">请登录</a>
				<a href="registerPage">免费注册</a>
			</c:if>
			<a href="forebought">我的订单</a>
			<a href="forecart">
			<span style="color:#C40000;margin:4px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			购物车<strong>${cartTotalItemNumber}</strong>件</a>
		</span>

</nav>



