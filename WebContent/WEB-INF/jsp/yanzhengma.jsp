<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入插件文件 -->
<script type="text/javascript" src="/SSMText/js/easyui/jquery-1.8.0.min.js"></script>
</head>
<body>
	<form action="" method= "post">
		请输入验证码：<input type ="text" name= "code" style = "width:80px;"/>
		<img id="imgObj" alt="验证码" src="/SSMText/getCode">
		<a href="#" onclick = "changeImg()">看不清,换一张</a><br>
		<input type="submit" value ="提交">
	</form>
</body>
<script type="text/javascript">
	$(function(){
		
	});
	function changeImg() {
		var imgSrc = $("#imgObj");
		var src = imgSrc.attr("src");
		imgSrc.attr("src",chgUrl(src));
	}
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		url = url.substring(0,20);
		if(url.indexOf("&")>=0){
			url = url+"*tamp=" + timestamp;
		} else {
			url = url + "?timestamp" + timestamp;
		}
		return url;
	}
</script>
</html>