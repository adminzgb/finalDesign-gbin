$(function() {
	var editor = new wangEditor('div1');
	editor.create();
	layui.use('upload', function(){
		layui.upload({
			  url: 'upload'
			  ,success: function(res){
				  $("#uploadFile").attr('src',res.object);
				  $("#headimgurl").attr("value",res.object);
			  }
			}); 
		});
	
	$('#save').click(
			function() {
				// 获取编辑器区域完整html代码
				var richContent = editor.$txt.html();
				// 获取编辑器纯文本内容
				var text = editor.$txt.text();
				var headText = $('#summary').val();
				var headImgUrl = $('#headimgurl').val();
				var title = $("#title").val();
				var visiblity = $('.visiblity input[name="optionsRadios"]:checked ').val();
				var tags = $(".tag").val();
				var blog = {};
				blog.richContent = richContent;
				blog.text = text;
				blog.headText = headText;
				blog.headImgUrl = headImgUrl;
				blog.title = title;
				blog.visiblity = visiblity;
				if (richContent == null|| headImgUrl == null || title == null) {
					layer.msg("内容不能为空");
				}
				$.ajax({
					type : "POST", // 提交方式
					url : "newBlog",// 路径
					contentType: "application/x-www-form-urlencoded; charset=utf-8", 
					data : {
						"text":text,
						"richContent":richContent,
						"headText":headText,
						"headImgUrl":headImgUrl,
						"tags":tags,
						"title":title,
						"visibility":visiblity
						
					},// 数据，这里使用的是Json格式进行传输
					success : function(result) {// 返回数据根据结果进行相应的处理
						var basePath = $("#basePath").val();
						window.open(basePath+"yili/main","_self");
					}
				});
			});
	
	$('#both').click(
			function() {
				// 获取编辑器区域完整html代码
				var richContent = editor.$txt.html();
				// 获取编辑器纯文本内容
				var text = editor.$txt.text();
				var headText = $('#summary').val();
				var headImgUrl = $('#headimgurl').val();
				var title = $("#title").val();
				var visiblity = $('.visiblity input[name="optionsRadios"]:checked ').val();
				var tags = $(".tag").val();
				var blog = {};
				blog.richContent = richContent;
				blog.text = text;
				blog.headText = headText;
				blog.headImgUrl = headImgUrl;
				blog.title = title;
				blog.visiblity = visiblity;
				if (richContent == null || headText == null
						|| headImgUrl == null || title == null) {
					layer.msg("内容不能为空");
				}
				$.ajax({
					type : "POST", // 提交方式
					url : "publishBlog",// 路径
					contentType: "application/x-www-form-urlencoded; charset=utf-8", 
					data : {
						"text":text,
						"richContent":richContent,
						"headText":headText,
						"headImgUrl":headImgUrl,
						"title":title,
						"tags":tags,
						"visibility":visiblity
					},// 数据，这里使用的是Json格式进行传输
					success : function(result) {// 返回数据根据结果进行相应的处理
						var basePath = $("#basePath").val();
						window.open(basePath+"yili/main","_self");
					}
				});
			});

	$('#preview').click(
			function() {
				var richContent = editor.$txt.html();
				var headText = $('#summary').val();
				var headImgUrl = $('#headimgurl').val();
				var title = $("#title").val();
				var visiblity = $('.visiblity input[name="optionsRadios"]:checked ').val();
				var tags = $(".tag").val();
				if (richContent == null || headText == null
						|| headImgUrl == null || title == null) {
					layer.msg("内容不能为空");
				}
				$.ajax({
					type : "POST", // 提交方式
					url : "preview",// 路径
					contentType: "application/x-www-form-urlencoded; charset=utf-8", 
					data : {
						"richContent" : richContent,
						"title" : title,
						"headText" : headText,
						"headImgUrl" : headImgUrl,
						"visiblity":visiblity,
						"tags":tags
					},// 数据，这里使用的是Json格式进行传输
					success : function(result) {// 返回数据根据结果进行相应的处理
						window.open("preview?blogId=" + result.object)
					}
				});
			});


	$("#addTagBtn").click(function() {
		layer.prompt({
			title : '添加标签',
			formType : 2
		}, function(pass, index) {
			$(".select-result dl").append("<dd class=\"selected\"><a href=\"#\">"+pass+"</a></dd>");
			layer.close(index);
		});
	});
	
	$(".blogUrl").click(function(){
		var id = $(this).next(".newBlog").val();
		$.ajax({
			type : "GET", // 提交方式
			url : "getBlog",// 路径
			contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			data : {
				"blogId":id
			},// 数据，这里使用的是Json格式进行传输
			success : function(result) {// 返回数据根据结果进行相应的处理
				$("#div1").empty();
				$("#uploadFile").attr("src","");
				$("#title").val("");
				$("#summary").val("");
				$("#div1").append(result.object.richContent);
				$("#title").val(result.object.title);
				$("#summary").val(result.object.headText);
				$("#uploadFile").attr("src",result.object.headImgUrl);
				if(result.object.visibility == 0){
					$('.visiblity input[name="optionsRadios"]:checked ').val(0);
				}else{
					$('.visiblity input[name="optionsRadios"]:checked ').val(1);
				}
			}
		});
		
	});
	$(".select dd").click(function () { 
        if ($(".select-result dd").length > 1) { 
            $(".select-no").hide(); 
        } else { 
            $(".select-no").show(); 
        } 
    }); 

});