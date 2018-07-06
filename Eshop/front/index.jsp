<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
    	$(function(){
    		//显示图片定时
				time = setInterval("showAd()",3000);	
//				$("p").hover(function(){
//			  	$("p").css("background-color","yellow");
//				},function(){
//			    $("p").css("background-color","pink");
//				});
			});
			function showAd(){
				//获取ad对象
				//$("#ad").show(1000);
				//$("#ad").slideDown(1000);
				$("#ad").fadeIn(3000);
				//清除显示图片定时
				clearInterval(time);
				//设置隐藏图片的定时
				time2 = setInterval("hiddenAd()",3000);
			}
			
			function hiddenAd(){
				//$("#ad").hide();
				//$("#ad").slideUp(1000);
				$("#ad").fadeOut(4000);
				clearInterval(time2);
			}

    </script>
</head>
<body>
	<div>
  		<img src="${pageContext.request.contextPath }/img/弹出广告.png" width="100%" style="display: none;" id="ad"/>
  	</div>
  	<!-- 引入header页面 -->
  	 <%@ include file="header.jsp" %>
  	 
  	 
  	 <!--轮播图-->
		<div class="container-fluid">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img src="${pageContext.request.contextPath }/img/滚动1.png" alt="...">
			      <div class="carousel-caption">
			      </div>
			    </div>
			    <div class="item">
			      <img src="${pageContext.request.contextPath }/img/滚动2.png" alt="...">
			      <div class="carousel-caption">
			      </div>
			    </div>
			    <div class="item">
			      <img src="${pageContext.request.contextPath }/img/滚动3.jpg" alt="...">
			      <div class="carousel-caption">
			      </div>
			    </div>
			  </div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<!--明星单品-->
		<div class="container" style="margin-top: 10px;">
			<div class="row">
				<span id="" style="font-size: 25px;color: gray;">
					<img src="${pageContext.request.contextPath }/img/明星.png" />&nbsp;明星单品 
				</span>
			</div>
			
			<div class="row">
				<c:forEach items="${hotProductList }" var="hotPro">
					<div class="col-lg-3" align="center" >
						<a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${hotPro.pid}"><img src="${pageContext.request.contextPath }/${hotPro.pimage }" width="200px"/></a>
						<p><a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${hotPro.pid}"><font color="black">${hotPro.pname }</font></a></p>
						<p><font color="red">￥${hotPro.shop_price }</font></p>
					</div>
				</c:forEach>
				
			</div>	
			<div class="row">
				<a href="#"><img src="${pageContext.request.contextPath }/img/广告.png" width="100%" /></a>
			
			</div>
		</div>
		<!--分类商品-->
		<div class="container">
			<div class="row" style="padding-left: 28px ;margin: 10px;">
				<span id="" style="font-size: 25px;color: gray;">笔记本/平板</span>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<img src="${pageContext.request.contextPath }/img/分类广告.jpg" width="290px" height="480px"/>
				</div>
				<div class="col-lg-9" style="padding-left: 30px;">
					<div class="row">
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;height: 242px;">
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本11.png" width="100%" /></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本12.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey; height: 242px;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本13.png" width="100%"/></a>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本21.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本22.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;height: 240px;">
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本23.png" width="100%"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" style="padding-left: 28px ;margin: 10px;">
				<span id="" style="font-size: 25px;color: gray;">笔记本/平板</span>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<img src="${pageContext.request.contextPath }/img/分类广告.jpg" width="290px" height="480px"/>
				</div>
				<div class="col-lg-9" style="padding-left: 30px;">
					<div class="row">
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;height: 242px;">
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本11.png" width="100%" /></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本12.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey; height: 242px;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本13.png" width="100%"/></a>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本21.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本22.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;height: 240px;">
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本23.png" width="100%"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" style="padding-left: 28px ;margin: 10px;">
				<span id="" style="font-size: 25px;color: gray;">笔记本/平板</span>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<img src="${pageContext.request.contextPath }/img/分类广告.jpg" width="290px" height="480px"/>
				</div>
				<div class="col-lg-9" style="padding-left: 30px;">
					<div class="row">
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;height: 242px;">
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本11.png" width="100%" /></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本12.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey; height: 242px;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本13.png" width="100%"/></a>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本21.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;" >
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本22.png" width="100%"/></a>
						</div>
						<div class="col-lg-4" class="pro" style="border: 1px solid grey;height: 240px;">
							<a href="#"><img src="${pageContext.request.contextPath }/img/笔记本23.png" width="100%"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 底部页面 -->
	<%@include file="foot.jsp"%>
</body>
</html>