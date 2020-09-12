<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>商品列表页</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login2.css">
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.min.js"></script>

   <style type="text/css">
   	.div1{
   		height:260px;
   		text-align: top;
   	}
   </style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<% pageContext.findAttribute("productByCate"); %>


<div class="panel panel-default" style="margin: 0 auto;width: 95%;">
	<div class="panel-heading">
	    <h3 class="panel-title"><span class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;商品列表</h3>
	</div>
	<div class="panel-body">
	   	   <!--列表开始-->
	    <div class="row ${pageBean.totalCount<=0?"div1":"" }">

<%--			${allProduct.list};--%>

	    	<c:if test="${allProduct.total==0}">没有查询到您所需要的商品！！！</c:if>
	    	<c:forEach items="${allProduct.list}" var="p" varStatus="i">
		    	<div class="col-sm-3">
				    <div class="thumbnail">
<%--				      <img src="${pageContext.request.contextPath}/goodsImgs/${xxx}" width="180" height="180"  alt="${xxx}" />--%>
						  <a href="${pageContext.request.contextPath}/info?id=${p.id}&cid=${p.cate_id}">
				     			 <img src="${p.path}" width="180" height="180"   />
						  </a>
				      <div class="caption">
				        <h4>商品名称:<a href="${pageContext.request.contextPath}/info?id=${p.id}&cid=${p.cate_id}">${p.trade}</a></h4>
				        <p>热销指数
				        	<c:forEach begin="1" end="${p.stars}">
				        		<img src="image/star_red.gif" alt="star"/>
				        	</c:forEach>
				        </p>
				         <p>上架日期:<fmt:formatDate value="${p.create_time}" pattern="yyyy-MM-dd"/></p>
			             <p style="color:orange">价格:${p.price}起</p>
				      </div>
				    </div>
				  </div>
	    	</c:forEach>

		<%--普通分页--%>
		<%--<div style="text-align:center">
			<tr style="text-align:center">
				<td colspan="6" >
					<span  style='margin:20px;'> <a href="${pageContext.request.contextPath}/productList?pageNum=${1}">首页</a></span>
					<span  style='margin:20px;'><a href="${pageContext.request.contextPath}/productList?pageNum=${allProduct.prePage}">上一页</a></span>
					<span  style='margin:20px;'><a href="${pageContext.request.contextPath}/productList?pageNum=${allProduct.nextPage}">下一页</a></span>
					<span  style='margin:20px;'><a href="${pageContext.request.contextPath}/productList?pageNum=${allProduct.pages}">尾页</a></span>
					<span  style='margin-left:20px;'>第${allProduct.getPageNum()}页</span>/
					<span>共${allProduct.getPages()}页</span>
				</td>
			</tr>
		</div>--%>

		<%--带下标的分页--%>
		</div>
			<nav aria-label="..." class="text-center">
			  <ul class="pagination">
				  <li><a href="${pageContext.request.contextPath}/query?pageNum=${allProduct.prePage}&query=${query}&cate_id=${cate_id}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						<c:forEach var="i" begin="${1}" end="${allProduct.getPages()}" step="1">
							  <c:if test="${i==allProduct.pageNum}">
								  <li class="active"><a href="#">${i}<span class="sr-only">(current)</span></a></li>
							  </c:if>
							  <c:if test="${i!=allProduct.pageNum}">
								  <li ><a href="${pageContext.request.contextPath}/query?pageNum=${i}&query=${query}&cate_id=${cate_id}">${i}</a></li>
							  </c:if>
						 </c:forEach>
			     <li><a href="${pageContext.request.contextPath}/query?pageNum=${allProduct.nextPage}&query=${query}&cate_id=${cate_id}" aria-label="Next"><span >»</span></a></li>
				 <li><span>第${allProduct.getPageNum()}页/共${allProduct.getPages()}页</span></li>
		  	  </ul>
			</nav>
   		</div>
</div>
      <!-- 底部 -->
   <%@ include file="footer.jsp"%>
</body>
</html>