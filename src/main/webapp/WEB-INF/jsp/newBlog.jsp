<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="/finalDesign/static/css/wangEditor.css" rel="stylesheet"
	type="text/css" />
<link href="/finalDesign/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/finalDesign/static/css/newblog.css" rel="stylesheet"
	type="text/css" />
	<link href="/finalDesign/static/layui/css/layui.css" rel="stylesheet"
	type="text/css" />
	 <link rel="stylesheet" href="/finalDesign/static/css/slide.css" media="screen" type="text/css" />
<title>一粒博客-写博客</title>
<style type="text/css">
#div1 {
	width: 100%;
	height: 500px;
}

.bot {
	margin-left: 20px !important;
	margin-top: 20px !important;
}
</style>
</head>
<%@ include file="header.jsp"%>
<input value="<%=basePath%>" type="hidden" id="basePath">
<body>

 <div class='card-holder'>
 <c:forEach items="${blogVO}" var="blog">
  <div class='card-wrapper'>
    <a href='#' class="blogUrl">
      <div class='card bg-01'>
        <span class='card-content'>${blog.title}</span>
        
      </div>
    </a>
    <input type="hidden" value="${blog.id}" class="newBlog"/>
  </div>
  </c:forEach>
</div>


	<div id="div1">
	</div>
	<div class="row bot">
		<h3 style="color:#DDA850">草稿箱</h3>
	</div>
	<div class="row bot">
		<p>标题</p>
		<input class="form-control" type="text" id="title" />
	</div>
	<div class="row bot">
		<p>封面</p>
		<input type="file" name="file" class="layui-upload-file">
		<img alt="" src="" id="uploadFile" style="width:100px; border: 2px solid #fff;margin-top:5px">
		<input type="hidden" id="headimgurl" value=""/>
		
	</div>
	<div class="bot">
		<p>摘要</p>
		<textarea class="form-control" id="summary"></textarea>

	</div>
	<div class="bot visiblity">
		<p>可见性</p>
		<div class="radio">
			<label> <input type="radio" name="optionsRadios"
				id="optionsRadios1" value="0" checked>公开
			</label>
		</div>
		<div class="radio">
			<label> <input type="radio" name="optionsRadios"
				id="optionsRadios2" value="1"> 私人
			</label>
		</div>
	</div>
	<div class="bot">
		<p style="display: inline-block">标签</p>
		<!-- <button class="form-control btn btn-success"
			style="display: inlne-block; width: 6%" id="addTagBtn">添加标签</button>
		<ul class="select">
			<li class="select-result">
				<dl>
					<dt>已有标签：</dt>
					<dd class="select-no"></dd>
				</dl>
			</li>
		</ul> -->
		<input type="text" class="form-control tag" style="width:60%" placeholder="多个标签用,分隔"/>
	</div>
	<div class="row bot">
		<button class="form-control btn btn-primary mybtn" id="save">保存</button>
		<button class="form-control btn btn-primary mybtn" id="preview">预览</button>
		<button class="form-control btn btn-primary mybtn" id="both">保存并发布</button>
	</div>

	<script type="text/javascript"
		src="/finalDesign/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="/finalDesign/static/js/wangEditor.js"></script>
	<script type="text/javascript" src="/finalDesign/static/js/newblog.js">
	</script>
	<script type="text/javascript" src="/finalDesign/static/layui/layui.js">
	</script>
	<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
</body>
</html>