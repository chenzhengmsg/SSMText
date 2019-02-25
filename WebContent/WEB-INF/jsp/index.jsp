<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

<title>SSM+EASYUI信息录入界面</title>

 <link type="text/css" rel="stylesheet"
	href="/SSMText/js/easyui/demo/demo.css" />
<link type="text/css" rel="stylesheet"
	href="/SSMText/js/easyui/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="/SSMText/js/easyui/themes/default/easyui.css" />
<script type="text/javascript" src="/SSMText/js/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="/SSMText/js/easyui/jquery.easyui.min.js"></script>

</head>
<body>
	<div id="login" class="easyui-window" style="padding-top: 5px;padding-left: 15px" >
		<form id="loginForm" action="/SSMText/save" method="post">
		<table>
		<tr>
			<td>
				<table>
				<tr><th>用户名:</th><td><input  class="easyui-validatebox"   id="userName" name="name" type="text"/></td><td colspan='2' rowspan = '2'><img src="/SSMText/image/456.png" width="50" height="50"/></td></tr>
				<tr><th>密 码:</th><td><input  class="easyui-validatebox"  id="passWord" name="password" type="password"></td></tr>
				<tr><th>验证码：</th><td><input  class="easyui-validatebox"   id="yanzhengma" name="yanzhengma" type="text" /></td>
				<td><img id="imgObj" alt="验证码" src="/SSMText/getCode"></td><td><a href="#" onclick = "changeImg()">看不清,换一张</a></td></tr>
				<tr><td colspan = '3'><div id="showMsg"></div></td></tr>
				</table>
			</td>
			</tr>
			
		</table>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#login").dialog({
				title : '登录',
				backcolor:'#00f',
				iconCls : 'icon-lock',	
				width : '460',
				height : '230',
				closable : true,
				minimizable : true,
				maximizable : true,
				resizable : false,
				modal : true,
				buttons : [ {
					text : '登录',
					iconCls : 'icon-ok',
					handler:function(){
					doLogin();
					}
				} ]
			});
		});
		function doLogin(){
			var text = "";
		 if($("#userName").val()=="" ){
	         text = "用戶名为空,请输入<br>";
	         }
		 if($("#passWord").val()=="") {
	        	 text += "密码为空,请输入<br>";
	         }
		 if($("#yanzhengma").val()=="") {
	        	 text += "验证码为空,请输入";
	         }
		if(text == "") {
			$("#login").dialog("close");
			$("#loginForm").get(0).submit();
		} else {
			 $("#showMsg").html("<p style= 'color:red'>"+text+"</p>");
	         $("#login").focus();
		}
		}
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
  </body>
</html>
