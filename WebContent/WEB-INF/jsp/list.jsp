<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link type="text/css" rel="stylesheet"
	href="/SSMText/js/easyui/demo/demo.css" />
<link type="text/css" rel="stylesheet"
	href="/SSMText/js/easyui/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="/SSMText/js/easyui/themes/default/easyui.css" />
<script type="text/javascript" src="/SSMText/js/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="/SSMText/js/easyui/jquery.easyui.min.js"></script>
    <title>SSM+EASYUI列表展示界面</title>
	
  </head>
  <script type="text/javascript">
	$(document).ready(function() {
		$('#userList').datagrid({
			url : '/SSMText/getList',
			columns : [ [ {
				field : 'ck',
				title : '选择',
				checkbox : true,
				width : 100,
				align : 'center'
			},{
				field : 'id',
				title : '编号',
				width : 100,
				align : 'center'
			}, {
				field : 'name',
				title : '姓名',
				width : 100,
				align : 'center'
			}, {
				field : 'password',
				title : '密码',
				width : 100,
				align : 'center'
			}, {
				field : 'age',
				title : '备注',
				width : 100,
				align : 'center'
			} ] ],
			//更改分页默认的显示行数
			pageList : [ 3, 5, 10, 20 ]
		});

	});
  </script>
  <body>
  <table id="userList" class="easyui-datagrid"  
            title="信息列表" iconCls="icon-save" fitColumns="true" pagination="true"
     toolbar="#tb" rownumbers="true">
       
        <tbody>
  </tbody>
    </table>
  
  </body>
</html>
