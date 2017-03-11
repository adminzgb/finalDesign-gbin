<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<div id="app">
<div class="row">
	<img alt="" src="${blog.head_img_url}">
</div>
<div class="row">
	<h2>${blog.title}</h2>
</div>
<div class="row">
	<h3>${blog.head_text}</h3>
</div>
	<div class="row">
	<c:forEach items="${blog.tags }" var="tag">
		<span>${tag.name}</span>
	</c:forEach>
</div>
<div class="row">
	<span>${blog.viewNum }</span>
	<span>${blog.comment}</span>
</div>
<div class="row">
	<span>${blog.updateTime}</span>
</div>
</div>
${user}
 <script type="text/javascript" src="/finalDesign/static/js/header.js"></script>
