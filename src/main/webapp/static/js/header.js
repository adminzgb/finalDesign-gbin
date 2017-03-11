$("#main").click(function(){
	$(this).css("color","white !important");
});
if(getCookie("user") == null){
	$("#personal").css("display","none");
}
function getCookie(name)
{
var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
if(arr=document.cookie.match(reg))
return unescape(arr[2]);
else
return null;
}
$("#uploadPic").click(function(){
	var basePath = $("#basePath").val();
	window.open(basePath+"pic/main","_self");
});