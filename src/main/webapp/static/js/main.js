var userId = $('#userId').val();
if (userId != null && userId != "") {
	$('#modalContent').css('display', 'block');
}
$('.blogImgs')
		.each(
				function() {
					if ($(this)[0].src == null || $(this)[0].src == "") {
						$(this)
								.attr("src",
										"http://localhost:8080/finalDesign/static/images/top_bg.png");
					}
				});
$("#writeBlog").click(function() {
	var basepath = $("#basePath").val();
	var url = basepath + "blog/newBlog";
	userId = getCookie("user");
	var basepath = $("#basePath").val();
	var url = basepath + "blog/newBlog";
	if (userId == null || userId == "") {
		if (cookieId == null || cookieId == "") {
			layer.msg("未登陆！");
		} else {
			window.open(url, "_self");
		}
	} else {
		window.open(url, "_self");
	}
});
$(".title").click(function() {
	var blogId = $(this).next(".blogId").val();
	var basepath = $("#basePath").val();
	window.open(basepath + "blog/blogDetail/" + blogId);
});

function setCookie(name, value) {
	var Days = 30;
	var exp = new Date();
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = name + "=" + escape(value) + ";expires="
			+ exp.toGMTString();
}
function getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}
$("#mes-btn").click(function() {
	var basePath = $("#basePath").val();
	window.open(basePath + "yili/main", "_self");
});
$('.box').pagination();