<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
</head>

<body>
	<!-- <form action="UserServlet?action=login" method="post"> 
						<p>用户名 </p>
						<input id="input1" type="text" class="name" name="uid" placeholder="Username" required=""/>
						
						<input type="submit" value="登录"> 
					</form>  -->
	<p align="center" style="margin-top:50px">
		<button id="open" class="btn" style="width:100px; height:30px; ">开启摄像头</button>
		<button id="close" class="btn" style="width:100px; height:30px;">关闭摄像头</button>
		<button id="CatchCode" class="btn" style="width:100px; height:30px;">开始认证</button>
	</p>
	<div align="center" style="margin：0 auto;">
		<video id="video" width="800px" height="800px" autoplay></video>
		<canvas hidden="hidden" id="canvas" width="626" height="800"></canvas>
	</div>
</body>
<script type="text/javascript">
var video;//视频流对象
var context;//绘制对象
var canvas;//画布对象
$(function() {
	var flag = false;
	//开启摄像头
	$("#open").click(function() {
		//判断摄像头是否打开
		if (!flag) {
			//调用摄像头初始化
			open();
			flag = true;
		}
	});
	//关闭摄像头
	$("#close").click(function() {
		//判断摄像头是否打开
		if (flag) {
			video.srcObject.getTracks()[0].stop();
			flag = false;
		}
	});
	//拍照
	$("#CatchCode").click(function() {
		if (flag) {
			context.drawImage(video, 0, 0, 330, 250);
			CatchCode();
		} else
			alert("请先开启摄像头!");
	});
});
//将当前图像传输到后台
function CatchCode() {
	//获取图像
	var img = getBase64();
	//Ajax将Base64字符串传输到后台处理
	$.ajax({
		type : "POST",
		url : "FaceLoginServlet",
		data : {
			img : img
		},
		dataType : "JSON",
		success : function(data) {
			//返回的结果
			//取出对比结果的返回分数，如果分数90以上就判断识别成功了
			if(parseInt(data.result.user_list[0].score) > 90) {
				//关闭摄像头
				video.srcObject.getTracks()[0].stop();
				//提醒用户识别成功
				alert("验证成功!");
				//验证成功跳转页面
				window.location.href="admin.jsp";
	  		}
			
		},
		error : function(q, w, e) {
			alert("识别失败，请重试！");
			window.location.href="login.html";
		}
	});
};
//开启摄像头
function open() {
	//获取摄像头对象
	canvas = document.getElementById("canvas");
	context = canvas.getContext("2d");
	//获取视频流
	video = document.getElementById("video");
	var videoObj = {
		"video" : true
	}, errBack = function(error) {
		console.log("Video capture error: ", error.code);
	};
	context.drawImage(video, 0, 0, 330, 250);
	//初始化摄像头参数
	if (navigator.getUserMedia || navigator.webkitGetUserMedia
			|| navigator.mozGetUserMedia) {
		navigator.getUserMedia = navigator.getUserMedia
				|| navigator.webkitGetUserMedia
				|| navigator.mozGetUserMedia;
		navigator.getUserMedia(videoObj, function(stream) {
			video.srcObject = stream;
			video.play();
		}, errBack);
	}
}
//将摄像头拍取的图片转换为Base64格式字符串
function getBase64() {
	//获取当前图像并转换为Base64的字符串
	var imgSrc = canvas.toDataURL("image/png");
	//截取字符串
	return imgSrc.substring(22);
};
</script>
</html>