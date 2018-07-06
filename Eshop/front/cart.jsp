<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/styleH.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <script type="text/javascript">
    	function delProFromCart(pid){
    		if(confirm("您确定删除该商品？")){
    			location.href="${pageContext.request.contextPath}/product?method=delProFromCart&pid="+pid;
    		}
    	}
    </script>
    
     <script type="text/javascript">
    	function clearCart(){
    		if(confirm("您确定清空购物车？")){
    			location.href="${pageContext.request.contextPath}/product?method=clearCart";
    		}
    	}
    </script>
</head>
<body>
	<!-- 引入header页面 -->
	<%@ include file="header.jsp" %>
	<c:if test="${!empty cart.cartItems }">
		<div class="container" style="margin-bottom:50px">
		<p><font style="color:#880000;font-size: 20px">购物车详情</font></p>
		<table class="table table-hover" style="width:1200px;margin:0 auto;">
	  		<thead>
	  			<tr>
		  			<th>图片</th>
		  			<th>名称</th>
		  			<th>价格</th>
		  			<th>数量</th>
		  			<th>小计</th>
		  			<th>操作</th>
		  		</tr>
		  	</thead>
	  		<tbody>
		  		
		  		<c:forEach items="${cart.cartItems }" var="entry">
		  			<tr height="50px">
		  				<td >
		  					<input type="hidden" name="id" value="">
		  					<img src="${pageContext.request.contextPath }/${entry.value.product.pimage}" height="50px">
		  				</td>
		  				<td >
		  					<a target="_blank">${entry.value.product.pname}</a>
		  				</td>
		  				<td >
		  					￥${entry.value.product.shop_price}
		  				</td>
		  				<td >
		  					${entry.value.buyNum}
		  				</td>
		  				<td >
		  					<span>￥${entry.value.subtotal}</span>
		  				</td>
		  				<td >
		  					<a href="javascript:void(0);" onclick="delProFromCart('${entry.value.product.pid}')" >删除</a>
		  				</td>
		  			</tr>
		  		</c:forEach>
		  		
	  		</tbody>
		</table>
		<div style="text-algin:right;margin-top:10px;magin-bottom:10px">
				商品总额：<strong style="color:#ff6600;">￥${cart.total }</strong>
				<a href="javascript:;" onclick="clearCart()" id="clear" class="clear">清空购物车</a></br>
				<a href="${pageContext.request.contextPath }/product?method=submitOrder">
					<input type="submit"  class="btn btn-danger" value="提交订单">
				</a>
		</div>
	</div>
	</c:if>
	
	<c:if test="${empty cart.cartItems }">
		<div style="width: 1210px;margin: 0 auto; height:220px">
			<div style="margin: 0 auto;">
				<p align="center"><font style="font-size: 20px;color:grey;">您的购物车是空的，马上去选商品！</font></p>
			</div>
			<div>
				<p align="center"><a href="${pageContext.request.contextPath }"><button type="button" class="btn btn-info">去首页</button></a></p>
				
			</div>
		</div>
	
	</c:if>
	
	
	
	
	
	<!-- 底部页面 -->
	<%@ include file="foot.jsp"%>
</body>
</html>