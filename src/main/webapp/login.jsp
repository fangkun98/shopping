<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="application/javascript">

		function login() {
			var loginData = $("#userLogin").serialize();
			// alert(loginData);
			$.ajax({
				url:"/login",
				data:loginData,
				type:"post",
				dataType:"json",
				success: function (result) {
					//alert(JSON.stringify(result));
					if(result.code=="200"){
						location.href="index.jsp"
					}
					if (result.code=="300"){
						alert(result.message);
					}
					if (result.code=="500"){
						alert(result.message);
						location.href="";
					}
				}
			});
		}

		//更新验证码
		$(function(){
			$("#cap").click(function(){
				//刷新验证码
				path = $(this).attr("src")+"?"+new Date().getTime();
				$(this).attr("src",path);
			});

			//验证输入的验证码 是否正确
			$("#vcode").change(function () {
				var vcode=$("#vcode").val();
				$.post("checkCode","vcode="+vcode,function (data) {
					if(data==1){
						$("#sp").html("正确").css("color","green");
						$("#btn").removeAttr("disabled");
					}else{
						$("#sp").html("验证码错误").css("color","red");
						$("#btn").attr("disabled",true);
					}
				});
			});



		});



	</script>


<title>登录</title>
</head>
<body>
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="${pageContext.request.contextPath}/index.jsp" target="_blank"><img src="./image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form  method="post"  class="form center" id="userLogin" name="userLogin" >
		<div class="login">
			<div class="login_center" >
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="${pageContext.request.contextPath }/register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">
						<div class="left fl">用户名:&nbsp;</div>
						<div class="right fl">
						<input class="shurukuang" type="text" name="username" id="username"  placeholder="请输入你的用户名"/>
						<label id="nameMsg"></label>
						</div>
					</div>
					<div class="username">
						<div class="left fl">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;</div>
						<div class="right fl">
						<input class="shurukuang" type="password" name="password"  id="password"  placeholder="请输入你的密码"/>
						</div>
					</div>
					<div class="username">
						<div class="left fl">验证码:&nbsp;</div>
						<div class="right fl"><input class="yanzhengma" id="vcode" name="vcode" type="text" placeholder="验证码"/>
						<img  id="cap" src="${pageContext.request.contextPath}/captcha"><span id="sp"></span></label></div>
					</div>
					<div class="username">
						<div class="left fl">&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="right fl"><label id="checkMsg"></label></div>
					</div>
					<div class="username">
						<input id="autoLogin" name="autoLogin" type="checkbox" />&nbsp;&nbsp;两周以内自动登录
						<span id="autoLoginMsg"></span>
					</div>
					<div class="login_submit">
						<input class="submit" type="button" name="btn" value="立即登录" onclick="login()" id="btn" >
					</div>
					<span style="color:red">${msg}</span>
				</div>	
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
	</body>
</html>