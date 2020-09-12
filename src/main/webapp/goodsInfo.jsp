<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<title>商品详情页</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login2.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>

    	<div style="margin: 0 auto;width: 90%;">
	   <ol class="breadcrumb">
		  <li><a href="index.jsp">小米商城</a></li>
		  <li class="active"><a href="${pageContext.request.contextPath}/query?cate_id=${requestScope.kind.id}">${requestScope.kind.kind}</a></li>
	   </ol>
   </div>

	<div class="container">
		<div class="row">
		  <div class="col-xs-6 col-md-6">
		    <a href="#" class="thumbnail">
		      <img src="${requestScope.productById.path}"  width="560" height="560"  alt="${goods.name}" />
		    </a>
		  </div>
		  <div class="col-xs-6 col-md-6">
		   	<div class="panel panel-default" style="height: 560px">
			  <div class="panel-heading">商品详情</div>
			  <div class="panel-body">
			    <h4>产品名称:<span style="font-weight:400;font-size: 30px">${requestScope.productById.trade}</span></h4>
			    <div style="margin-left: 10px;">

				   <p>市场价格:&nbsp;&nbsp;&nbsp;<span class="text-danger" style="font-size: 15px;">${requestScope.productById.price}</span><span class="glyphicon glyphicon-yen" style="font-size: 15px;"></span></p>
				    <p>上市时间:&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${requestScope.productById.create_time}" pattern="yyyy-MM-dd"/></p>
				     <p>热销指数:&nbsp;&nbsp;&nbsp;
						<c:forEach begin="1" end="${requestScope.productById.stars}">
				        		<img src="image/star_red.gif" alt="star"/>
				        	</c:forEach>
					</p>
				    <p>详细介绍:</p>
				    <p style="color: darksalmon">&nbsp;&nbsp;${requestScope.productById.detail}</p>
				    <a id="jojn"  class="jojn btn btn-warning">加入购物车&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
				    <button  class="btn btn-danger">直接购买</button>
					<script type="text/javascript">
						$(function () {
							$("#jojn").click(function () {
								var pid=${requestScope.productById.id};
								$.post("cart","pid="+pid,function (result) {
									// alert(JSON.stringify(result));
									if(result.code=="200"){
										alert(result.message);
									}
									if(result.code=="500") {
										alert(result.message);
									}
									if(result.code=="250"){
										alert(result.message);
										location.href="/tolog"
									}
								})
							})
						})

					</script>
			    </div>
			  </div>
			</div>
		  </div>
		</div>
	</div>
   <!-- 底部 -->
   <%@ include file="footer.jsp"%>


</body>
</html>