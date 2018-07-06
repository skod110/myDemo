<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>

 <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/styleH.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    
    <script type="text/javascript">
    	function addCart(){
    		//获得购买商品的数量
    		var buyNum = $("#buyNum").val();
    		location.href="${pageContext.request.contextPath}/product?method=addProductToCart&pid=${product.pid}&buyNum="+buyNum;
    	}
    </script>
</head>
<body>
	<!-- 引入header页面 -->
	<%@ include file="header.jsp" %>
	
	<div style="margin:0 auto; width : 950px;">
		<div class="row">		
			<div class="col-lg-6">
				<img style="opacity:1; width: 400px;height:350px;"title="" class="medium"
					src="${pageContext.request.contextPath }/${product.pimage}">
			</div>
			<div class="col-lg-6">
				<div>
					<strong>${product.pname }</strong>
				</div>
				<div style="border-bottom:1px dotted #dddddd; width:350px; margin:10px 0 10px 0;">
					<div>编号：${product.pid }</div>
				</div>
				
				<div style="margin:10px 0 10px 0;">
					官网价：<strong ><font size="15px" color="red">￥${product.shop_price }</font></strong> 厂商指导价：<del>￥${product.market_price }</del>
				</div>
				<div 
					style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0px 10px 0px;">
					<div style="margin:5px 0 10px 0;">黑色</div>
					
					<div
						style="boder-bottom:1px solid #faeac7;margin-top:2px;padding-left:10px">
						购买数量：<input id="buyNum" name="buyNum" value="1"
							maxlength="4" size="10" type="text">
					
					</div>
					
					<div style="margin:20px 0 10px 0;text-algin:center;">
						<a href="javascript:void(0);" onclick="addCart()">
						<input type="button" value="加入购物车" class="btn btn-success"></a>
					</div>
					<div class="clear"></div>
					
					
				</div>
				
			</div>
		</div>
		<div class="row">
			<div
				style="width:950px;margin:0 auto;">
				<div
					style="background-color:#d3d3d3;width:930px;padding:10px 10px ;margin:10px 0 10px 0;">
					<strong>商品介绍</strong>
				</div>
				
				<div>
					<img src="${pageContext.request.contextPath }/${product.pimage}">
				</div>
				
				<div
					style="background-color:#d3d3d3;width:930px;padding:10px 10px ;margin:10px 0 10px 0;">
					<table >
						<tbody>
							<tr class="active">
								<th colspan="2">基本参数</th>
								<td style="font-color:red">${product.pdesc }</td>
							</tr>
							<tr class="active">
								<th width="10%">级别</th>
							</tr>
						</tbody>
						
					</table>
				</div>
			</div>
			
		</div>
	</div>
	
	
	
	
	<!-- 底部页面 -->
	<%@include file="foot.jsp"%>
</body>
</html>