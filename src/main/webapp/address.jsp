<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/login2.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>个人中心-收货地址页面</title>
<script type="text/javascript">
	function deleteAddr(id){
		var res = confirm("是否删除");
		if(res==true){
			$.post("delAddress","id="+id,function (result) {
				location.href = "";
			});
		}
	}
	function defaultAddr(id){
		var res = confirm("是否设为默认");
		if(res==true){
			$.post("updateState","id="+id,function (result) {
					location.href = "";
			});
			
		}
	}
</script>
</head>
<body>
<%--头部--%>
<%@ include file="header.jsp"%>

<!--网站中间内容开始-->
<div style="text-align: center">
	<div id="left" style="float: left;margin-left:250px;height: 500px; width:900px;overflow: scroll;">
		<h3>收货地址</h3>
		<hr>
		<table class="table table-striped table-hover table-bordered">
			<tr>
				<th>序号</th>
				<th>收件人</th>
				<th>手机号</th>
				<th>省份</th>
				<th>城市</th>
				<th>街道</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${addList}" var="address"  varStatus="i" >
				<tr>
					<Td>${i.count}</Td>
					<td>${address.name}</td>
					<td>${address.phone}</td>
					<td>${address.province}</td>
					<td>${address.city}</td>
					<td>${address.detail}</td>
					<td>
						<button onclick="deleteAddr(${address.id})" class="btn btn-danger btn-sm">删除</button>&nbsp;&nbsp;
						<button class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal${address.id}">修改</button>&nbsp;&nbsp;
						<!-- 弹出模态框 -->

						<div class="modal fade" tabindex="-1" role="dialog" id="myModal${address.id}">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span>&times;</span>
										</button>
										<h4 class="modal-title">修改地址</h4>
									</div>
									<form action="/updateAddress" method="post" class="form-horizontal">
										<div class="motal-body">
											<div class="form-group">
												<label class="col-sm-2 control-label">收件人</label>
												<div class="col-sm-10">
													<input type="hidden" name="id" value="${address.id}">
													<input type="hidden" name="state" value="${address.state}">
													<input type="text" name="name" class="form-control" value="${address.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">电话</label>
												<div class="col-sm-10">
													<input type="text" name="phone" class="form-control" value="${address.phone}">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">省份</label>
												<div class="col-sm-10">
													<input type="text" name="province" class="form-control" value="${address.province}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">城市</label>
												<div class="col-sm-10">
													<input type="text" name="city" class="form-control" value="${address.city}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">街道</label>
												<div class="col-sm-10">
													<input type="text" name="detail" class="form-control" value="${address.detail}">
												</div>
											</div>

										</div>
										<div class="motal-footer">
											<button type="submit" class="btn btn-primary">修改</button>
										</div>
									</form>
								</div>
							</div>
						</div>

						<button onclick="defaultAddr(${address.id})" class="btn btn-primary btn-sm">设为默认</button>
						<c:if test="${address.state==1}">
							<span class="badge" style="background-color:red;">默认</span>
						</c:if>
						<c:if test="${address.state==0}">
							<span class="badge">普通</span>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<div id="right" style="float: left; width: 500px" class="container">
		<h3 style="margin-left: -350px;">添加地址</h3>
		<form action="/addAddress" method="post" class="form-horizontal" style="margin:50px 40px">
			<div class="form-group">
				<label class="col-sm-3 form-label">收件人</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="name" style="width: 200px"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 form-label">手机号</label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" name="phone" style="width: 200px"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 form-label">省份</label>
				<input type="text"  class="form-control" name="province" style="margin-left:120px;width: 200px"/>
			</div>
			<div class="form-group">
				<label class="col-sm-3 form-label">城市</label>
				<input type="text"  class="form-control" name="city" style="margin-left:120px;width: 200px"/>
			</div>
			<div class="form-group">
				<label class="col-sm-3 form-label">街道</label>
				<input type="text"  class="form-control" name="detail" style="margin-left:120px;width: 200px"/>
			</div>
			<div class="form-group col-md-12">
				<input type="submit" class="btn btn-primary" value="添加地址">
			</div>
		</form>
	</div>
</div>

<!-- 底部 -->
<div style="margin-top: 500px">
	<%@ include file="footer.jsp"%>
</div>

</body>
</html>