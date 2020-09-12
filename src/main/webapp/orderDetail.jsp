<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>用户订单</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/login2.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.post("getAddress",{});
	});
	function upState(id) {
		$.post("updateOrderStatr","id="+id,{});
	}


</script>
</head>
<body style="background-color:#f5f5f5">
<%@ include file="header.jsp"%>
<div class="container" style="background-color: white;">
	<div class="row" style="margin-left: 40px">
		<h3>用户订单</h3>
	</div>
	<div class="row" style="margin-top: 40px;">
		<div class="col-md-12 ">
			<table class="table table-bordered table-striped table-hover">
 				<tr>
 					<th>序号</th>
 					<th>商品名称</th>
 					<th>价格</th>
 					<th>数量</th>
 					<th>小计</th>
					<th>下单时间</th>
					<th>收货人</th>
					<th>手机号</th>
					<th>地址</th>
					<th>状态</th>
 				</tr>
 				<c:set value="0" var="sum"></c:set>
 				<c:forEach items="${ordersList}" var="o" varStatus="i">
	 				<tr>
	 					<th>${i.count}</th>
	 					<th>${o.pname}</th>
	 					<th>${o.price}</th>
	 					<th>${o.num}</th>
	 					<th>${o.money}</th>
						<th><fmt:formatDate value="${o.create_time}" pattern="yyyy-MM-dd HH:mm:SS"/></th>

							<c:forEach items="${addressList}" var="a" >
								<c:if test="${a.id==o.address_id}">
									<th>${a.name}</th>
									<th>${a.phone}</th>
									<th>${a.province}/${a.city}/${a.detail}</th>
								</c:if>
							</c:forEach>

	 					<th>
							<c:if test="${o.order_state=='-1'}">
								<span class="badge" style="background-color:red;">待发货</span>
							</c:if>
							<c:if test="${o.order_state=='0'}">
								<span class="badge" style="background-color:yellowgreen;">已发货</span>
								<span class="badge" style="background-color:oldlace;"><a onclick="upState(${o.id})" href="/toOrder">确认收货</a></span>
							</c:if>
							<c:if test="${o.order_state=='1'}">
								<span class="badge" style="background-color:cornflowerblue;">已收货</span>
							</c:if>
						</th>
	 				</tr>
	 				<c:set var="sum" value="${sum+o.money}"></c:set>
 				</c:forEach>
 				<%--<tr>
 				 <td colspan="8">
 				 	<h5>收货地址</h5>
 				 	<select id="address" style="width:60%" class="form-control">
 				 		<c:forEach items="${addressList}" var="a" varStatus="ai">
 				 			<option value="${a.id}">${a.name}&nbsp;&nbsp;${a.phone}&nbsp;&nbsp;${a.province}&nbsp;&nbsp;${a.city}&nbsp;&nbsp;${a.detail}</option>
 				 		</c:forEach>
 				 	</select>
 				 	<c:if test="${empty addressList}">
 				 		<a href="self_info.jsp">添加收货地址</a>
 				 	</c:if>
 				 </td>
 				</tr>--%>
			</table>
		</div>
	</div>
	<hr>
<%--	<div class="row">
		<div style="margin-left: 40px;">
	            <h4>商品金额总计：<span id="total" class="text-danger"><b>￥&nbsp;&nbsp;${sum}</b></span></h4>
		</div>
	</div>
	<div class="row pull-right" style="margin-right: 40px;">
		 <div style="margin-bottom: 20px;">
	            <button  id="btn_add" class="btn  btn-danger btn-lg" type="button">提交订单</button>
	     </div>
	</div>--%>
</div>
	
    
<!-- 底部 -->
<%@ include file="footer.jsp"%>

</body>
</html>