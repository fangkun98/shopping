<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<script type="text/javascript">
			$(function () {

				//用户名的异步校验
				$("#username").change(function () {
					var username = $("#username").val();
					// alert(username)
					$.ajax({
						url: "getUserByName",
						data: "username="+username,
						type: "post",
						dataType:"json",
						success:function (result) {
							// alert(JSON.stringify(result));
							if(result=="1"){
								$("#usernameMsg").html("用户名已经存在").css("color","red");
								$("#registerBtn").attr("disabled",true);
							}else{
								// alert(data);
								$("#usernameMsg").html("用户名可用").css("color","green");
								$("#registerBtn").removeAttr("disabled");
							}
						}
					});
				});

					 //前端验证 输入信息格式
					$("#form1").validate({
						rules:{
							username:"required",
							password:{required:true,minlength:6},
							repassword:{equalTo:"#password"},
							email:"required"
						},
						messages:{
							username:"用户名不能为空",
							password:"密码不能少与六位",
							repassword:"前后密码不一致",
							email:"请注意邮箱格式且不能为空,"
						}
					});

					//ajax获取信息

				/*	$("#registerBtn").click(function () {
						//判断表单数据是否全部填写
						var result=$("#form1").valid();
						if(result==true){
							//获取表单数据
							var data=$("#form1").serialize();
							alert(data);
							$.ajax({
								url:"register",
								data: {"data=":data},
								type: "post",
								dataType:"json",
								success:function (result){
									if(result.code==200){
										alert(result.messages);
										location.href="login.jsp"
									}else {
										alert(result.messages);
										location.href="";
									}
								}

							})

						}
					});*/




			})
		</script>
<title>注册</title>
</head>
<body>
	<div class="regist">
		<div class="regist_center">
			<div class="regist_top">
				<div class="left fl"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;会员注册</div>
				<div class="right fr">
					<a href="index.jsp" target="_black">小米商城</a>
				</div>
				<div class="clear"></div>
				<div class="xian center"></div>
			</div>
			<div class="center-block" style="margin-top: 80px;">
				<form id="form1" class="form-horizontal" action="/register" method="post">

					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-8" style="width: 40%">
							<input type="text" id="username" name="username"
								   class="form-control col-sm-10" placeholder="Username"/>
						</div>
						<div class="col-sm-2">
							<p class="text-danger"><span id="usernameMsg" class="help-block "></span>
								<lable class="error" for="username"></lable>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-8" style="width: 40%">
							<input type="password" name="password" id="password"
								   class="form-control col-sm-10" placeholder="Password"  />
						</div>
						<div class="col-sm-2">
							<p class="text-danger"><span id="passwordMsg" class="help-block ">请输入6位以上字符</span></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-8" style="width: 40%">
							<input  id="repassword" type="password"  class="form-control col-sm-10" name="repassword"
									placeholder="Password Again" />
						</div>
						<div class="col-sm-2">
							<p class="text-danger"><span id="repsswordMsg" class="help-block ">两次密码要输入一致</span></p>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-8" style="width: 40%">
							<input id="email" type="email" name="email" class="form-control col-sm-10"
								   placeholder="Email" />
						</div>
						<div class="col-sm-2">
							<p class="text-danger"><span id="emailMsg" class="help-block ">填写正确邮箱格式</span></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-8" style="width: 40%">
							<label class="radio-inline">
								<input type="radio"name="sex" value="男" checked="checked"> 男</label>
							<label class="radio-inline">
								<input type="radio"name="sex" value="女"> 女</label>
						</div>
						<div class="col-sm-2">
							<p class="text-danger"><span id="genderMsg" class="help-block ">你是帅哥 还是美女</span></p>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<div class="col-sm-7 col-sm-push-2">
							<input id="registerBtn" type="submit" value="注册" class="btn btn-primary  btn-lg" style="width: 200px;" disabled/> &nbsp; &nbsp;
							<input type="reset" value="重置" class="btn btn-default  btn-lg" style="width: 200px;"  />
						</div>
					</div>
					<div class="text-center" style="color:red">${registerMsg}</div>
				</form>


			</div>
		</div>
	</div>
	
</body>
</html>