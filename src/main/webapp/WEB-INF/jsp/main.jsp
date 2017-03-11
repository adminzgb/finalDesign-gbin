<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="/finalDesign/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/finalDesign/static/css/main.css" rel="stylesheet" type="text/css"/>

<!-- Owl Carousel Assets -->
    <link href="/finalDesign/static/owl-carousel/owl.carousel.css" rel="stylesheet">
    <!-- <link href="owl-carousel/owl.theme.css" rel="stylesheet"> -->
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="/finalDesign/static/css/style.css">
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="/finalDesign/static/css/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">

<title>一粒博客</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div id="banner" style="width:100%;background-image:url('<%=basePath%>static/images/top_bg.png')"><img src="http://localhost:8080/finalDesign/static/images/top_bg.png"/>
<input value="<%=basePath%>" type="hidden" id="basePath">
<input type="hidden" value="${user.id}" id="userId"/>
<!-- 模态窗口内容DIV，将本页面DIV内容设置到父窗口DIV上并模态显示 -->  
    <div id='modalContent' style="display:none">  
            <div class="row">
            	<img alt="" src="<%=basePath%>static/images/user_head.png">  
            </div>
            <div class="row">
            <p class="name">${user.loginName}</p>
            <p class="introduce">
            <span>sex  |    </span><span>hobbit  |    </span><span>job</span>
            </p>
            <p>and etc</p>
            </div>  
    </div> 
</div>
<div id="app">
<div class="container">
<h1>热门文章</h1>
<div class="row">
<c:forEach items="${blogs}" var="blog">
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content">
	
		<!-- ////////////Content Box 01 -->
		<section class="box-content box-1">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="box-item">
						<input type="hidden" class="blogId" value="${blog.id}"/>
							<img src="${blog.headImgUrl}" class="img-responsive blogImgs"/>
							<div class="content">
								<h3>${blog.title}</h3>
								<p>${blog.headText}</p>
								<a href="<%=basePath%>blog/blogDetail/${blog.id}">Read More...</a>
								<br><br>
								<span>${blog.updateTime}</span><br>
								<span>标签：${blog.tags}</span><br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	</c:forEach>
	<c:if test="${fn:length(blogs)==0}">
   <h3 id="idNone" style="text-align:center">暂无文章，快来写一篇吧</h3>
	</c:if>
	<div class="box"></div>
</div>
</div>
</div>

</body>
 <script type="text/javascript" src="/finalDesign/static/js/jquery-3.1.1.min.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/bootstrap.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/layer.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/vue.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/jquery.pagination.min.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/main.js"></script>
 
</html>