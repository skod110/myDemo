<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>

 <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/styleH.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <script type="text/javascript">
    	function confirmOrder(){
    		//提交
    		$("#orderForm").submit();
    	}
    </script>
</head>
<body>
	<!-- 引入header页面 -->
	<%@ include file="header.jsp" %>
	<!-- 订单 -->
	<div class="container">
		<div class="row">
			<div style="margin:0 auto;margin-top:10px; width : 950px;">
				<p class="bg-primary"><strong>订单详情</strong></p>
				<table class="table table-hover" style="width:1200px;margin:0 auto;">
			  		<thead>
			  			<tr>
			  				<th colspan="5">订单编号：${order.oid }</th>
			  			</tr>
			  			<tr>
				  			<th>图片</th>
				  			<th>名称</th>
				  			<th>价格</th>
				  			<th>数量</th>
				  			<th>小计</th>
				  			
				  		</tr>
				  	</thead>
			  		<tbody>
				  		
				  		<c:forEach items="${order.orderItems}" var="orderItem">
				  			<tr height="50px">
				  				<td >
				  					<img src="${pageContext.request.contextPath }/${orderItem.product.pimage}" height="50px">
				  				</td>
				  				<td >
				  					<a target="_blank">${orderItem.product.pname}</a>
				  				</td>
				  				<td >
				  					￥${orderItem.product.shop_price}
				  				</td>
				  				<td >
				  					${orderItem.count}
				  				</td>
				  				<td >
				  					<span>￥${orderItem.subtotal}</span>
				  				</td>
				  				
				  			</tr>
				  		</c:forEach>
				  		
			  		</tbody>
				</table>
				<div style="text-algin:right;">
					商品金额：<strong style="color:#ff6600;">￥${order.total }</strong>
				</div>
			</div>
			
			
			
		</div>
		
		<div>
			<hr />
			<form id="orderForm" class="form-horizontal" action="${pageContext.request.contextPath }/product"  method="post"
				style="margin-top:5px;margin-left:150px;">
				<!-- method的名字通过表单提交 -->
				<input type="hidden" name="method" value="confirmOrder">
				<!-- 传递订单oid -->
				<input type="hidden" name="oid" value="${order.oid }">
				<div class="form-group">
					<label for="address" class="col-sm-1 control-label">地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="address" name="address" placeholder="请输入收货地址">
						
					</div>
				</div>
				
				<div class="form-group">
					<label for="username" class="col-sm-1 control-label">收货人</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="username" name="username" placeholder="请输入收货人" value="${user.name }">
					</div>
				</div>
				
				<div class="form-group">
					<label for="telephone" class="col-sm-1 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="telephone" name="telephone" placeholder="请输入联系电话" value="${user.telephone }">
					</div>
				</div>
				<hr />
				
				<div style="margin-top:5px;">
					<strong>选择银行:</strong>
					<p>
						<br /><input type="radio" name="pd_FrpId" value="ICBBC-NWT-B2C"
							checked="checked"> <img  src="${pageContext.request.contextPath }/img/ICBC.png"> 工商银行&nbsp;&nbsp;&nbsp;&nbsp;<br />
						<br /><input type="radio" name="pd_FrpId" value="ABC-NWT-B2C"
							checked="checked"> <img  src="${pageContext.request.contextPath }/img/ABC.png"> 农业银行&nbsp;&nbsp;&nbsp;&nbsp;<br />
						<br /><input type="radio" name="pd_FrpId" value="CCB-NWT-B2C"
							checked="checked"> <img  src="${pageContext.request.contextPath }/img/CCB.png"> 建设银行
					</p>
				</div>
				
				<hr />
				<p style="text-algin:right;margin-right:100px;">
					<button type="button" onclick="confirmOrder()" class="btn btn-danger btn-lg"> 提交订单</button>
				</p>
			</form>
		</div>
	</div>
	
	
	<!-- 底部页面 -->
	<%@include file="foot.jsp"%>
</body>
</html>