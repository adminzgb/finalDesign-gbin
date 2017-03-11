<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="/finalDesign/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/finalDesign/static/css/main.css" rel="stylesheet"
	type="text/css" />
<title>浏览博客</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<input type="hidden" value="<%=basePath%>" id="basePath" />
	<div id="banner"
		style="width: 100%; background-image: url('http://localhost:8080/finalDesign/static/images/top_bg.png')">
		<img src="http://localhost:8080/finalDesign/static/images/top_bg.png" />
		<input type="hidden" value="${user.id}" id="userId" />
		<!-- 模态窗口内容DIV，将本页面DIV内容设置到父窗口DIV上并模态显示 -->
		<div id='modalContent' style="bottom: 10px">
			<div class="row">
				<p class="name" style="margin-top: 80px">${blogVO.title}</p>
			</div>
		</div>
	</div>
	<div id="app" style="margin-top: 15px">
		<input type="hidden" value="${blogVO.id }" id="blogId" />
		<div class="container">
			<h3>摘要</h3>
			<div class="row">${blogVO.headText}</div>
			<h3>正文</h3>
			<div class="row">${blogVO.richContent}</div>
			<div class="row">
				<h3>标签</h3>
				<input class="form-control" id="tag" type="text" readonly="readonly"
					style="width: 60%; height: 34px; margin-bottom: 10px" value="${blogVO.tags}"/>
			</div>
			<div class="row">
				<h3>可见性</h3>
				<c:if test="${blogVO.visibility==1}">
					<h4>个人可见</h4>
				</c:if>
				<c:if test="${blogVO.visibility==0}">
					<h4>公开</h4>
				</c:if>
			</div>
			<div class="row">
				<h3>评论</h3>
				<input class="form-control" id="comment" type="text"
					style="width: 60%; height: 68px; margin-bottom: 10px" />
				<button class="btn btn-primary" id="addComment">发表评论</button>
			</div>

			<div class="row">
				<h3>评论列表</h3>
				<c:forEach items="${blogVO.comments}" var="comment">
					<div class="row">
						<p style="font-size: 16px; color: #F3CC8B">${comment.name }</p>
						<p style="margin-left: 20px">${comment.content }</p>
						<p>${comment.createTime }</p>
						<input type="hidden" value="${comment.id}" />
					</div>
				</c:forEach>

			</div>
		</div>
	</div>

</body>
<script type="text/javascript"
	src="/finalDesign/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/bootstrap.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/layer.js"></script>
<script type="text/javascript">
	$('#addComment').click(
			function() {
				var comment = $("#comment").val();
				if (comment == null || comment == "") {
					layer.msg("评论不能为空");
				}
				var blogId = $("#blogId").val();
				var basePath = $("#basePath").val();
				$.ajax({
					type : "POST", //提交方式  
					url : basePath + "comment/addComment",//路径  
					data : {
						"content" : comment,
						"blogId" : blogId
					},//数据，这里使用的是Json格式进行传输  
					success : function(result) {//返回数据根据结果进行相应的处理  
						if (result.code == 'FAIL') {
							layer.msg("评论失败");
						} else {
							window.open(basePath + "blog/blogDetail/" + blogId,
									"_self");
						}
					}
				});

			});
</script>
</html>