<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户注册</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.1.js"></script>
    <!-- 表单校验插件 -->
    <script src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	li{
				
		list-style-type:none;
	}
    	.font-con{
		color: white;
	}
	
	.error{
		color:red
	}
    </style>
<script type="text/javascript">
	 function reload(){
		document.getElementById("image").src="<%=request.getContextPath() %>/imageServlet?date="+new Date().getTime();
		$("#checkcode").val("");   // 将验证码清空
	} 
	 
</script>
<script type="text/javascript">
	//自定义校验规则
	$.validator.addMethod(
		//规则名称
		"checkUsername",
		//校验函数
		function(value,element,params){
			
			var flag = false;
			//value输入的内容			
			//element被校验的元素
			//params规则对应的参数值
			//目的：ajax校验
			
			$.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/user?method=checkUsername",
				"data":{"username":value},
				"type":"POST",
				"dataType":"json",
				"success":function(data){
					flag = data.isExist;
				}
			});
			//返回false代表校验器不通过
			return !flag;
			
		}
	);
	

	$(function(){
		$("#registForm").validate({
			rules:{
				username:{
					required:true,
					minlength:3,
					checkUsername:true
				},
				password:{
					required:true,
					digits:true,
					minlength:6,
					maxlength:12
				},
				repassword:{
					required:true,
					equalTo:"[name = 'password']"
				},
				email:{
					required:true,
					email:true
				},
				uname:{
					required:true,
					maxlength:5
				},
				sex:{
					required:true
				}
			},
			messages:{
				username:{
					required:"*用户名必填",
					minlength:"*用户名不得少于3位",
					checkUsername:"*用户名已存在"
				},
				password:{
					required:"*密码不能为空",
					minlength:"*密码不得少于6位",
					maxlength:"*密码不得多于12位"
				},
				repassword:{
					required:"*确认密码不能为空",
					equalTo:"*两次输入不一致"
				},
				email:{
					required:"*邮箱不能为空",
					email:"*邮箱格式不正确"
				},
				name:{
					required:"*名字不能为空",
					maxlength:"*名字不能多于5位"
				},
				sex:{
					required:"*性别不可为空"
				}
				
			}
			
		});
	});
 
</script>
</head>
<body>
	 <!-- 引入header页面 -->
  	 <%@ include file="header.jsp" %>
  	 
  	 
	<!-- 注册表单 -->
	<div class="container-fluid"style="padding:50px;">
		<div class="col-lg-3"></div>
		<div class="col-lg-6" 
			style="padding: 40px 80px;margin: 30px; border: 7px solid royalblue;">
			<form id="registForm" action="${pageContext.request.contextPath }/user?method=register" method="post">
			  <div class="form-group">
			   <label style="font-size: 20px;color: darkmagenta;">用户注册</label>
			  </div>
			  <div class="form-group">
			    <label for="username">用户名</label>
			    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
			  </div>
			  <div class="form-group">
			    <label for="password">密码</label>
			    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
			  </div>
			  <div class="form-group">
			    <label for="confirmpwd">确认密码</label>
			    <input type="password" class="form-control" id="confirmpwd" name="repassword" placeholder="两次密码请一致">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email address</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Email">
			  </div>
			  <div class="form-group">
			    <label for="usercaption">姓名</label>
			    <input type="text" class="form-control" id="usercaption" name="name" placeholder="请输入姓名">
			  </div>
			  <div class="form-group">
			    <label for="sex">性别</label>
			    <div>
				    <label class="radio-inline"><input type="radio" id="sex1" name="sex" value="male">男</label>
				    <label class="radio-inline"><input type="radio" id="sex2" name="sex" value="female">女</label>
				    <label class="error" for="sex" style="display:none"></label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="date">出生日期</label>
			    <input type="text" class="form-control"  name="birthday" >
			  </div>
			  <div class="form-group">
			    <label for="usercaption">请输入验证码</label>
			    <input type="text"  name="checkCode" >
			    <img src="${pageContext.request.contextPath }/imageServlet" id="image" />
			    <a href="javascript:reload();"><label>换一张</label></a><br> 
			    <span id="span" class="error">${registerInfo }</span>
			  </div>
			  <input type="submit" class="btn btn-default"  value="注册">
			</form>
			
		</div>
		<div class="col-lg-3"></div>
	</div>
	
	 <!-- 底部页面 -->
	<%@include file="foot.jsp"%>
	
	
</body>
</html>
