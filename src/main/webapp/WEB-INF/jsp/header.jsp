<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="/finalDesign/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/finalDesign/static/css/header.css" rel="stylesheet"
	type="text/css" />
<title>Insert title here</title>
</head>
<body>
<input value="<%=basePath%>" type="hidden" id="basePath">
	<!-- <div class="row bar">
<div class="row bar-in">
<button class="btn btn-default" id="mes-btn" type="button">主页</button>
 <div class="col-lg-6" id="search-bar">
                <div class="input-group">
                    <input type="text" class="form-control search-input" placeholder="搜索文章、作者"><span class="input-group-btn"><button class="btn btn-default" id="search-btn" type="button">Go!</button>
                    </span>
                </div>/input-group
            </div>/.col-lg-6
            <span class="btn-two">
<button class="btn btn-default head-btn" type="button" id="writeBlog">写博客</button>
<button class="btn btn-default head-btn" type="button">传图片</button>
</span>
</div>
</div> -->
	<nav class="navbar navbar-default bar" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=basePath%>yili/main" id="main">首页</a>
			<a class="navbar-brand" href="<%=basePath%>yili/personal" id="personal">个人主页</a>
			<a class="navbar-brand" href="<%=basePath%>yili/personal" id="Mmessage">消息</a>
		</div>
		<div>
			<form class="navbar-form navbar-left" role="search" action="<%=basePath%>blog/search" method="post">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						id="search-input" name="str">
				</div>
				<button class="btn btn-default head-btn" type="submit"
					>搜索</button>
				<button class="btn btn-default head-btn" type="button"
					id="writeBlog">写博客</button>
				<button class="btn btn-default head-btn" type="button" id="uploadPic">传图片</button>
			</form>
		</div>
	</div>
	</nav>
</body>
<script type="text/javascript"
	src="/finalDesign/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/bootstrap.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/layer.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/header.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/main.js"></script>
</html>