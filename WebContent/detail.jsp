<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>详情</title>
<link rel="stylesheet" href="css/detail.css" />
    <script type="text/javascript">
    function add() {
        var txt=document.getElementById("txt");
        var price=document.getElementById("price")
        var sum=document.getElementById("sum")
        var p=price.value;
        var s=sum.value;
        var a=txt.value;
        a++;
        txt.value=a;
       	sum.value=a*p;
    }
    function cut() {
        var txt=document.getElementById("txt");
        var price=document.getElementById("price");
        var sum=document.getElementById("sum");
        var p=price.value;
        var s=sum.value;
        var b=txt.value;
        b--;
        if(b>1){
        	txt.value=b;
        	sum.value=b*p;
        }else {
        	txt.value=1;
        	sum.value=1*p;
        }
    }
</script>
</head>
<body>
<div class="right-content">
				<div class="headz">
					<h3>详情</h3>
				</div>
				<div class="content">
					<div class="foodimg">
			<!-- 图片 -->			<img src="img/<s:property value="#session.dfood.dishImg"/>"/>
					</div>
				</div>
				<div class="detail">
					<form action="${pageContext.request.contextPath}/adddish.action" method="post">
			<!--菜名  -->	<li><input type="text" value="<s:property value="#session.dfood.dishName"/>" name="shop.dishName" readonly="true"  
							style="border: none;height:40px;line-height: 40px;font-size: 18px;font-weight:700;width: 120px;"/></li>
			<!-- 销量 -->				<div class="sales">已售<input type="text" value="<s:property value="#session.dfood.sales"/>" readonly style="border: none;width: 50px;font-size: 12px;"/></div>
			<!-- 类别 -->			<li><input type="text" value="<s:property value="#session.dfood.type"/>" readonly style="border: none;width: 120px;margin-bottom:10px;"/></li>
			<!--  单价-->			<input type="hidden" value="<s:property value="#session.dfood.price"/>"id="price"/>
						<li style="color:#f90;height:35px;line-height: 35px;font-size:18px;">
			<!-- 总价-->		￥<input type="text" value="<s:property value="#session.dfood.price"/>" readonly name="shop.price" id="sum" style="border: none;width: 100px;color: #f90;height:35px;line-height:35px;font-size:18px;"/>
						</li>
						<li>
							<input value="-" type="button" onclick="cut()" style="background: #1e89e0;cursor:pointer;color: #fff;border: none;width: 30px;height: 30px;"/>
			<!--数量 -->		<input type="text" value="1" readonly id="txt" name="shop.number" width="200" style="width:24px;margin-left: 0px;height:24px;text-align: center;"/>
							<input value="+" type="button" onclick="add()"style="background: #1e89e0;cursor:pointer;color: #fff;border: none;width: 30px;height: 30px;"/>
							<input type="submit" value="加入购物车" class="submit"/>
						</li>
					</form>
					
			</div>
			<div class="miaoshu">
		<!-- 介绍 -->	<p><s:property value="#session.dfood.introduction"/></p>
			</div>
			<div class="pingjia"> 
				<div class="headz">
					<h3>评价</h3>
				</div>
				<li>
		<!-- 评价人 -->	<font><s:property value="#session.dfood.appraiser"/></font><font style="float: right;"><s:property value="#session.dfood.evalTime"/></font>
		<!-- 评价内容 -->		 <p style="margin-left: 30px;"><s:property value="#session.dfood.evalWord"/></p>
				</li>
				<div class="allping">
					<a href="#" style="color: #fff;">全部评论</a>
				</div>
			</div>
<%-- <form action="${pageContext.request.contextPath}/adddish.action" method="post">
	<img src="img/<s:property value="#session.dfood.dishImg"/>"/><br>
	<input type="text" value="<s:property value="#session.dfood.dishName"/>" name="shop.dishName"  readonly /><br>
	<input type="hidden" value="<s:property value="#session.dfood.price"/>"  id="price"/>
	<input value="-" type="button" onclick="cut()">
	<input type="text" value="1" id="txt" name="shop.num" width="200" />
	<input value="+" type="button" onclick="add()"/><br>
	<input type="text" value="<s:property value="#session.dfood.price"/>"  name="shop.price" id="sum"/><br>
	<input type="text" value=<s:property value="#session.dfood.type"/> readonly /><br>
	<textarea cols="24" rows="8" readonly><s:property value="#session.dfood.introduction"/></textarea><br>
	<input type="text" value=<s:property value="#session.dfood.sales"/> readonly/><br>
	<input type="text" value=<s:property value="#session.dfood.appraiser"/> readonly /><br>
	<textarea cols="24" rows="8" readonly><s:property value="#session.dfood.evalWord"/></textarea><br>
	<input type="text" value=<s:property value="#session.dfood.evalTime"/> readonly/><br>
	<input type="submit" value="加入购物车"/>
</form> --%>
</body>
</html>