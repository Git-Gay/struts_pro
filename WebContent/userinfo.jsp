<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息</title>
<link rel="stylesheet" href="css/userinfo.css" />
<script src="js/jquery.js"></script>
		<script>
			$(document).ready(function(){
				$(".li").mouseover(function(){
					$(this).css("background","#eee")
				});
				$(".li").mouseout(function(){
					$(this).css("background","#fff")
				});
				$(".update").click(function(){
					$(".page").css("display","block");
					
				});
				$(".esc").click(function(){
					$(".page").css("display","none");
					
				});
			});
			
		</script>
</head>
<body>
 <%@ include file="header.jsp" %> 
<div class="userinfo">
			<div class="left-list">
				<ul class="list">
					<li class="select">
						<h3>我的资料</h3>
						<ul>
							<li class="li"><a href="queryuser.action?id=张三"  style="text-decoration:none;">个人资料</a></li>
							<li class="li"><a href="#" style="text-decoration:none;">地址管理</a></li>
						</ul>
					</li>
					<li class="select">
						<h3>订单中心</h3>
						<ul>
							<li class="li"><a href="#" style="text-decoration:none;">我的订单</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="right-content">
				<div class="headz">
					<h3>个人资料</h3>
				</div>
				<div class="header-img">
					<img src="img/<s:property value="#session.user.userImg"/>"   class="head"/>
					<form action="${pageContext.request.contextPath}/updateimg.action?user.userImg=<s:property value="#session.user.userImg"/>" method="post" enctype="multipart/form-data">
					
						<input class="file" type="file" name="doc" />
						<input class="submit" type="submit" value="修改头像" style="width:72px;"/>
						
					</form>
				</div>
				<div class="info">
					<ul>
						<li>用户名：<s:property value="#session.user.username"/></li>
						<li>手机号：<s:property value="#session.user.bPhone"/></li>
						<li>关联QQ号：<s:property value="#session.user.relationUser"/></li>
					</ul>
				</div>
				<a href="#" class="update">修改资料</a>
			</div>
		</div>
		<div class="page" style="display:none;">							<!--隐藏框-->
			<div class="content" style="opacity:1;">
				<div class="up-header"><h3>修改资料</h3></div>
				<div class="esc">
					<a href="#" style="text-decoration: none;color: #000000;">X</a>
				</div>
				<form action="update.action?id=<s:property value="#session.user.username"/>" method="post" class="form">
					<table style=" border-collapse: separate; border-spacing: 10px 20px;">
						<tr>
							<td>用户名：</td>
							<td><input type="text" name="user.username" id="input" value="<s:property value="#session.user.username"/>" readonly/></td>
						</tr>
						<tr>
							<td>手机号：</td>
							<td><input type="text" name="user.bPhone" class="input"/></td>
						</tr>
						<tr>
							<td>关联QQ号：</td>
							<td><input type="text" name="user.relationUser" class="input"/></td>
						</tr>
					</table>
					<input type="submit" value="确认"  class="submit"/>
				</form>
			</div>
		</div>
</body>
</html>