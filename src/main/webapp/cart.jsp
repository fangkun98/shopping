<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/login2.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>


    <script type="text/javascript">

        function del(a) {
            var flag=confirm("您确定要删除商品吗?");
            if(flag){
                $.post("delCart","id="+a,function (result) {
                    if(result.code=="200"){
                        location.href="";
                    }
                    if(result.code=="500") {
                        alert(result.messages);
                    }
                });
            }
        }

        function dow(i) {
            var prices = document.getElementsByName("price")[i].value;
            var count = parseInt(document.getElementsByName("amount")[i].value) - 1;
            if (count < 1) {
                alert("不能再减了，再减就没有啦！");
            } else {
                document.getElementsByName("amount")[i].value = count;
                var totals = parseFloat(prices * count);
                document.getElementById("price" + i).innerHTML = "¥" + totals;
                total();
            }
        }

        function up(i) {
            var prices = document.getElementsByName("price")[i].value;
            var count = parseInt(document.getElementsByName("amount")[i].value) + 1;
            document.getElementsByName("amount")[i].value = count;
            var totals = parseFloat(prices * count);
            document.getElementById("price" + i).innerHTML = "¥" + totals;
            total();
        }

        function total() {
            var prices = document.getElementsByName("price");
            var count = document.getElementsByName("amount");
            var sum = 0;
            for (var i = 0; i < prices.length; i++) {
                sum += prices[i].value * count[i].value;
            }
            document.getElementById("total").innerHTML ="￥"+sum;
        }
        $(function () {
            total();
        })


    </script>
</head>
<body style="background-color:#f5f5f5">
<%@ include file="header.jsp" %>
<div class="container" style="background-color: white;">
    <div class="row" style="margin-left: 40px">
        <h3>我的购物车<small>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</small></h3>
    </div>
    <div class="row" style="margin-top: 40px;">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>序号</th>
                    <th>商品名称</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                <c:set value="1" var="sum1"></c:set>
                <c:forEach items="${allCart}" var="cartcom" step="1">
                    <tr>
                        <th>${sum1}</th>
                        <input type="hidden" name="price" value="${cartcom.price}" >
                        <th>${cartcom.pname}</th>
                        <th>￥${cartcom.price}</th>
                        <th width="100px">
                            <div class="input-group">
		 						<span class="input-group-btn">
		 							<button class="btn btn-default" name="dow" type="button"
                                            onclick="dow(${sum1-1})">-</button>
		 						</span>
                                <input type="text" class="form-control" name="amount" id="xx" value="${cartcom.sum}"
                                       readonly="readonly" style="width:40px">
                                <span class="input-group-btn">
		 							<button class="btn btn-default" type="button" name="up"
                                            onclick="up(${sum1-1})">+</button>
		 						</span>
                            </div>
                        </th>
                        <th id="price${sum1-1}">￥${cartcom.sum * cartcom.price}</th>
                        <th>
                            <button type="button" class="btn btn-default" onclick="del(${cartcom.id})">删除</button>
                        </th>
                    </tr>
                    <c:set var="sum1" value="${sum1+1}"></c:set>
                </c:forEach>
            </table>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="pull-right" style="margin-right: 40px;">

            <div>
                <a id="removeAllProduct" href="/delAll" class="btn btn-default btn-lg">清空购物车</a>
                &nbsp;&nbsp;
                <a href="goOrders" class="btn  btn-danger btn-lg">结账</a>

            </div>
            <br><br>
            <div style="margin-bottom: 20px;">
                商品金额总计：<span id="total" class="text-danger"><b></b></span>
            </div>
        </div>
    </div>
</div>


<!-- 底部 -->
<%@ include file="footer.jsp" %>


</body>
</html>