<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<script type="text/javascript">
	$(function(){
		var content = "";
		$.post(
			"${pageContext.request.contextPath}/product?method=categoryList",
			function(data){
				for(var i=0;i<data.length;++i){
					content += "<li role='presentation'><a href='${pageContext.request.contextPath}/product?method=productList&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
				}
				//将拼接好的li放在ul中
				$("#categoryUl").html(content);
			},
			"json"
		);
	});
</script>

<!-- 完成异步搜索功能 -->
<script type="text/javascript">
	function isShowDiv(obj){
		$("#showDiv").css("display","none");
	}
	function overFn(obj){
		$(obj).css("background","#DBEAF9");
	}
	function outFn(obj){
		$(obj).css("background","#fff");
	}
	function clickFn(obj){
		$("#search").val($(obj).html());
		$("#showDiv").css("display","none");
	}
	function searchWord(obj){
		//1.获得输入内容
		var word = $(obj).val();
		//2.根据输入内容，去数据库中模糊查询
		var content = "";
		$.post(
			"${pageContext.request.contextPath}/product?method=searchWord",
			{"word":word},
			function(data){
				for(var i=0;i<data.length;++i){
					content += "<div style='padding:5px;cursor:pointer' onclick='clickFn(this)' onmouseover='overFn(this)' onmouseout='outFn(this)' >"+data[i]+"</div>";
				}
				$("#showDiv").html(content);
				$("#showDiv").css("display","block");
			},
			"json"
			
		);
		//3.显示模糊查询字段
	}
</script>

<body>
	<div class="container-fluid" >
			<div class="row">
				<div class="col-lg-2" >
					<img src="${pageContext.request.contextPath }/img/logo.png" />
				</div>
				<div class="col-lg-6 ">
					<ul class="nav nav-pills" id="categoryUl" style="padding-top: 15px;">
					 
					</ul>
				</div>
				
				<div class="col-lg-2">
					<form class="navbar-form navbar-right" style="padding-top: 15px;">
        				<div class="form-group" style="position:relative">
			          		<input id="search" type="text" class="form-control" placeholder="Search" onkeyup="searchWord(this)" onblur="isShowDiv(this)">
		          			<div id="showDiv" onblur="isShowDiv(this);" style="display:none;position:absolute;z-index:1000;background:#fff;border:1px solid #ccc;width:190px;height:150px">
		          			
		          			</div>
	          			</div>
        		
        				
      				</form>
				</div>
				
				<div class="col-lg-2 " style="padding-top: 10px;">
					<c:if test="${empty user }">
						<a href="${pageContext.request.contextPath }/front/register.jsp">注册</a>&nbsp;
						<a href="${pageContext.request.contextPath }/front/login.jsp">登录</a>
						<a href="${pageContext.request.contextPath }/front/cart.jsp"><img src="${pageContext.request.contextPath }/img/购物车.png" /></a>
					</c:if>
					
					<c:if test="${!empty user }">
						<div class="btn-group" style="padding-top: 10px;">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    ${user.username } <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a href="${pageContext.request.contextPath }/product?method=myOrders">我的订单</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="${pageContext.request.contextPath }/user?method=logout">退出</a></li>
						  </ul>
						  <a href="${pageContext.request.contextPath }/front/cart.jsp"><img src="${pageContext.request.contextPath }/img/购物车.png" /></a>
						</div>
					</c:if>
				</div>
		</div>
		<div>
  	 	<ol class="breadcrumb">
  	 		<li><a href="${pageContext.request.contextPath }/product?method=index">首页></a></li>
  	 	</ol>
  	 </div>
	</div>
</body>
</html>