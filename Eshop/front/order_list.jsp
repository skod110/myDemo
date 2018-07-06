<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/styleH.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
</head>
<body>
	<!-- 引入header页面 -->
	<%@ include file="header.jsp" %>
	<!-- 订单 -->
	<div class="container">
		<div class="row">
			<div style="margin:0 auto;margin-top:10px; width : 950px;">
				<p class="bg-primary"><strong>我的订单</strong></p>
				<table class="table table-hover">
					<c:forEach items="${orderList }" var="order">
						<thead>
			  			<tr class="success">
			  				<th colspan="5">订单编号：${order.oid } &nbsp;&nbsp;${order.state==0?"未付款":"已付款" }</th>
			  			</tr>
			  			<tr class="warning">
				  			<th>图片</th>
				  			<th>商品 </th>
				  			<th>价格</th>
				  			<th>数量</th>
				  			<th>小计</th>
				  			
				  		</tr>
				  		</thead>
					  	<c:forEach items="${order.orderItems }" var="orderItem">
					  		<tbody>
					  			<tr>
					  				<td width="60"><img src="${pageContext.request.contextPath }/${orderItem.product.pimage}" width="70" height="60"></td>
					  				<td width="30%"><a target="_blank">${orderItem.product.pname}</a></td>
					  				<td width="20%">￥${orderItem.product.shop_price}</td>
					  				<td width="10%">${orderItem.count }</td>
					  				<td width="15%">${orderItem.subtotal }</td>
					  			</tr>
				  		
				  			</tbody>
					  	</c:forEach>					
					</c:forEach> 					
				</table>
			</div>
		</div>
	</div>





	<!-- 底部页面 -->
	<%@ include file="foot.jsp"%>
</body>
</html>