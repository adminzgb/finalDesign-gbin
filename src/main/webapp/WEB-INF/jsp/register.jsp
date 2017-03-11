<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01Transitional//EN">
<html>
 <head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="/finalDesign/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style>
 .title{
 	text-align:center;
 	color:#FFFFFF;
 	letter-spacing:5.7px;
 	font-size:24px;
 	margin-top:150px;
 }
 .form-control{
 background-color:transparent;
 color:#FFFFFF;
 border-top:0px;
 border-right:0px;
 border-left:0px;
 width:50%;
 display: inline-block;
  margin-top:10px
 }

 .row{
 text-align:center
 }
 .myBtn{
 margin:15px;
 opacity: 0.72;
background: #F3CC8B;
border-radius: 100px;
width:20%;
padding:5px;
color:#FFFFFF;
border:none;
letter-spacing:10px;
}
 .myBtn2{
 margin:10px;
 opacity: 0.72;
background: transparent;
border-radius: 100px;
width:20%;
padding:5px;
color:#F3CC8B;
border:solid 1px #F3CC8B;
}
.href{
margin:20px;
color:#FFFFFF
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
color:#F3CC8B;
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
</style>
</head>
<input value="<%=basePath%>" type="hidden" id="basePath">
<body style="background-image:url('http://localhost:8080/finalDesign/static/images/bg.png');width:100%;height:100%;position: fixed;">
<div class="row title">
<p>欢迎来到一粒博客</p>
</div>
<div class="container">
<div class="row href">
<input class="form-control" type="text" id="loginName" name="loginName" placeholder="请输入账号" style="background-color:transparent">
<input class="form-control" type="password"  id="firstPwd" name="firstPwd" placeholder="请输入密码">
<input class="form-control" type="password"  id="secondPwd" name="secondPwd" placeholder="请输入密码">
<div class="row">
<button class="myBtn" type="submit" id="login-btn">注册</button>
</div>
<div class="row href">
<p>———————— 或  ————————</p>

</div>
<button class="myBtn2" id="login">已有账号，去登录</button>
</div>
</div>
</body>
 <script type="text/javascript" src="/finalDesign/static/js/jquery-3.1.1.min.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/bootstrap.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/layer.js"></script>
 <script type="text/javascript" src="/finalDesign/static/js/user.js"></script>
</html>
