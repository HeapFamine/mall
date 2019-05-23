<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<!-- 完成页面定时的跳转 -->
<meta http-equiv="refresh" content="3;url=loginPage">
<body onload="run()">
	<div class="registerSuccessDiv">
	
		<img src="img/site/registerSuccess.png">
		恭喜注册成功<br><br>
		页面将在<span id="spanId">3</span>秒后跳转到登陆页面！！
	</div>

</body>

<script type="text/javascript">
    // 页面一加载完成，该方法就会执行
    // 读秒，一秒钟数字改变一次
    var x = 3;
    function run(){
        // 获取到的是span标签的对象
        var span = document.getElementById("spanId");
        // 获取span标签中间的文本
        span.innerHTML = x;
        x--;
        // 再让run方法执行呢，一秒钟执行一次
        window.setTimeout("run()", 1000);
    }
</script>
</html>