<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理端全菜品查询</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/all.action">查询</a><br>
<br>
<br>
<table  align="center" cellspacing="0"  cellpadding="10" border="1">
<s:iterator value="foodlist" status="s">
	<tr>
		<td width="100"><img src="img/<s:property value="dishImg"/>"/></td>
		<td width="100">菜名：<s:property value="dishName"/></td>
		<td width="100">类别：<s:property value="type"/></td>
		<td width="100">价格：<s:property value="price"/></td>
		<td width="100">描述：<s:property value="introduction"/></td>
		<td width="100">销量：<s:property value="sales"/></td>
		<td><a href="delete.action?food.dishName=<s:property value="dishName"/>">下架</a></td>
	</tr>
</s:iterator>
</table>
</body>
</html>