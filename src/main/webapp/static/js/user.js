//登录
var basePath = $('#basePath').val();
$('#submit').click(function(){
	var loginName = $('#loginName').val();
	var pwd = $('#password').val();
	
	if(loginName == null || loginName == "" || pwd == null || pwd == ""){
		layer.msg("用户名或密码不能为空");
		return;
	}
	
	$.ajax({  
	     type : "POST",  //提交方式  
	     url : "user/login",//路径  
	     data : {  
	        "loginName":loginName,
	        "password":pwd
	     },//数据，这里使用的是Json格式进行传输  
	     success : function(result) {//返回数据根据结果进行相应的处理  
	    	 if(result.code=='FAIL'){
	    		 layer.msg("登录失败");
	    	 }else{
	    		 setCookie("user",result.object.id);
	    		 layer.msg("登录成功");
	    		 setTimeout(function(){
	    			 window.open("yili/main","_self");	 
	    		 },1500);
	    	 }
	     }  
	 }); 	
});
function setCookie(name,value)
{
var Days = 30;
var exp = new Date();
exp.setTime(exp.getTime() + Days*24*60*60*1000);
document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie(name)
{
var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
if(arr=document.cookie.match(reg))
return unescape(arr[2]);
else
return null;
}
//注册
$('#login-btn').click(function(){
	var loginName = $('#loginName').val();
	var fPwd = $('#firstPwd').val();
	var sPwd = $('#secondPwd').val();
	if(loginName == null || loginName == "" || fPwd == null || fPwd == null){
		layer.msg("用户名或密码不能为空");
		return;
	}
	if(fPwd!=sPwd){
		layer.msg("两次密码不一致");
		return;
	}
	$.ajax({  	
	     type : "POST",  //提交方式  
	     url : "register",//路径  
	     data : {  
	        "loginName":loginName,
	        "password":fPwd
	     },//数据，这里使用的是Json格式进行传输  
	     success : function(result) {//返回数据根据结果进行相应的处理  
	    	 //alert(result.object);
	    	 if(result.code=='FAIL'){
	    		 layer.msg("用户名已存在");
	    	 }else{
	    		 layer.msg("注册成功");
	    		 setCookie("user",result.object.id);
	    		 setTimeout(function(){
	    			 window.open(basePath+"yili/main","_self");	 
	    		 },1500);
	    		 
	    	 }
	     }  
	 }); 	
});

//登录页面跳转注册页面
$('#signup').click(function(){
	window.open(basePath+"user/register","_self");	
	
});
//注册页面跳转登录页面
$('#login').click(function(){
	window.open(basePath,"_self");
});
//去逛逛
$('#hang').click(function(){
	window.open(basePath+"yili/main","_self");	
	
});


 