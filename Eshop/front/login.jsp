<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户登录</title>
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>商城首页</title>

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
  	 <!-- 登陆表单 -->
  	 <div class="container-fluid">
  	 		<div class="row">
  	 			<div class="col-lg-6">
  	 				<img src="${pageContext.request.contextPath }/img/登录.png" />
  	 			</div>
  	 			<div class="col-lg-6">
  	 				<form action="${pageContext.request.contextPath }/user?method=login" method="post" style="width:350px;border:5px solid green;padding:10px;">
  	 				  <div>
  	 				  	<h3 style="color:purple;">用户登录</h3>
  	 				  </div>
					  <div class="form-group">
					    <label for="username">用户名</label>
					    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
					  </div>
					  <div class="form-group">
					    <label for="password">密码</label>
					    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
					  </div>
					  <div class="checkbox">
					    <label>
					      <input type="checkbox" name="autoLogin" value="autoLogin"> 自动登录
					    </label>
					  </div>
					  <input type="submit" class="btn btn-info" style="width:100px" value="登录"></button>
					</form>
  	 			</div>
  	 		</div>
  	 </div>
  	 
  	 
  	 
  	 <!-- 底部页面 -->
	<%@include file="foot.jsp"%>
</body>
</html>