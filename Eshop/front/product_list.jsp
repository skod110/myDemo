<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>

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
  	 <!-- 显示商品 -->
  	 <div class="container-fluid">
  	 <c:forEach items="${pageBean.list }" var ="pro">
  	 	<div class="col-lg-4">
  	 		<a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${pro.pid}">
  	 			<img src="${pageContext.request.contextPath }/${pro.pimage}" height="150px">
  	 		</a>
  	 		<p><a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${pro.pid}">${pro.pname }</a></p>
  	 		<p><font color="red">&yen;${pro.shop_price }</font></p>
  	 	</div>
  	 </c:forEach>
  	 </div>
  	 <!-- 分页 -->
  	<div>
  		<nav aria-label="Page navigation" style="margin:30px; text-align:center ">
		  <ul class="pagination">
		  <!-- 上一页 -->
		  <c:if test="${pageBean.currentPage==1 }">
		  	<li class="disable">
		      <a href="javascript:void(0);" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  </c:if>
		  
		  <c:if test="${pageBean.currentPage!=1 }">
		  	<li class="disable">
		      <a href="${pageContext.request.contextPath }/product?method=productList&cid=${cid}&currentPage=${pageBean.currentPage-1 }" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  </c:if>
		    
		    <!-- 显示每一页 -->
		    <c:forEach begin="1" end="${pageBean.totalPage }" var="page">
		    <c:if test="${page==pageBean.currentPage }">
		    	<li class="active"><a href="javascript:void(0);">${page }</a></li>
		    </c:if>
		    <c:if test="${page!=pageBean.currentPage }">
		    	<li ><a href="${pageContext.request.contextPath }/product?method=productList&cid=${cid}&currentPage=${page }">${page }</a></li>
		    </c:if>
		    </c:forEach>
		    
		    
		    <!-- 下一页 -->
		    <c:if test="${pageBean.currentPage== pageBean.totalPage }">
		  	<li class="disable">
		      <a href="javascript:void(0);" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </c:if>
		  
		  <c:if test="${pageBean.currentPage!=pageBean.totalPage }">
		  	<li class="disable">
		      <a href="${pageContext.request.contextPath }/product?method=productList&cid=${cid}&currentPage=${pageBean.currentPage+1 }" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </c:if>
		  </ul>
		</nav>
  	</div>
  	<div
  		style="width:1200px;margin:10px auto;padding:0 9px;border:1px solid #ddd;border-top:2px solid #999;height: 210px;">
  		<h4 style="width:50%;float:left;font:14px/30px 微软雅黑 ">浏览记录</h4>
  		<div style="width:50%;float:right;text-align:right;">
  			<a href="#">more</a>
  		</div>
  		<div style="clear:both;"></div>
  		<div style="overflow:hidden;">
  			<ul style="list-style:none;">
  				<c:forEach items="${historyProductList }" var="histroyPro">
  					<li style="width:150px;height:210px ;float:left;padding:20px;text-align:center">
  						<img src="${pageContext.request.contextPath }/${histroyPro.pimage }" width="130px" height="130px">
  					</li>
  				</c:forEach>
  			
  			</ul>
  		</div>
  	</div>
  	 
  	 
  	 <!-- 底部页面 -->
	<%@include file="foot.jsp"%>
</body>
</html>