<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- 购物车 -->
<div class="sidebar false" style="transition:all 0.5s;">
			<div class="sidebar-tabs">
				<div class="tabs-top">
					<div class="top-image">
						<a href="#"><img src="img/tabs-top.png" alt="我的订单"></a>
					</div>
				</div>
				<div class="separator"></div>
				<div class="tabs-middle">
					<div class="middle-image">
						<a href="#" class="shop-image"><img src="img/tabs-middle.png"/></a>
					</div>
				</div>
				<div class="separator"></div>
				<div class="tabs-bottom">
					<div class="middle-image">
						<a href="#" class="bottom-image"><img src="img/tabs-bottom.png" alt="我的信息"/></a>
					</div>
				</div>
				<div class="ma-image">
					<div class="ma">
						<a href="#"><img src="img/ma.png"></a>
					</div>
				</div>
			</div>
			<div class="sidebar-content">
				<div class="content-top">
					<a href="queryshop.action" class="shopche" style="margin-left: 10px;text-decoration: none;font-size: 14px;color: #000000;">购物车</a>
					<a href="#" class="shop" style="float: right; margin-right:10px;text-decoration: none;">➤</a>
				</div>
				<div class="content-main">
	<!--显示购物车信息-->
					<s:iterator value="#session.shopcart">
						<li class="content-li">
							<font style="margin-left:10px;"><s:property value="dishName"/></font>
							<font style="margin-left:60px;"><s:property value="number"/>份</font>
							<input type="text" readonly value="￥<s:property value="price"/>"/>
						</li>
					</s:iterator>
					<div class="pay">
					<form action="" method="post">
						<input type="text" value="￥30" readonly style="margin-left:60px;border:none;width:70px;font-size:16px;color:#f90;font-weight:900px;height:59px;line-height:59px;"/>
						<li>
								<input type="submit" value="支付" />
						</li>
					</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="search">
			<div class="search-input">
			<form action="${pageContext.request.contextPath}/search.action" method="post">
				<input name="food.dishName" class="place-search-input ng-pristine ng-valid" id="globalsearch" placeholder="搜索商家,美食..." autocomplete="" ng-model="searchText">
				<input type="submit" class="search-sub" value="">
			</form>
			</div>
		</div>
		<div class="menu2">
			<div class="menu-filter">
				<span class="top-name">食品分类:</span>
				<a href="${pageContext.request.contextPath}/queryfood.action?food.type=美味快餐" class="fenlei">快餐便当</a>
				<a href="${pageContext.request.contextPath}/queryfood.action?food.type=小吃甜品" class="fenlei">小吃甜品</a>
				<a href="#" class="fenlei">异国料理</a>
				<a href="#" class="fenlei">小吃夜宵</a>
				<a href="#" class="fenlei">特色菜系</a>
				<a href="#" class="fenlei">果树生鲜</a>
				<a href="#" class="fenlei">蔬菜绿植</a>
				<a href="#" class="fenlei">早餐</a>
				<a href="#" class="fenlei">午餐</a>
				<a href="#" class="fenlei">晚餐</a>
				<a href="#" class="fenlei">下午茶</a>
			</div>
		</div>
		<!--main-->
		<div class="main">																	<!--main-->
			<!-- <h4>点击<a href="#" style="color:blue;">登陆</a>，查看更多</h4> -->
			<table align="center" cellspacing="0"  cellpadding="10" style="text-align:center;border:none;margin:5px auto;">
				<s:iterator value="foodlist" var="ob" status="count">
				 <s:if test="#count.index%4==0||#count.first">
					<tr>
				 </s:if> 
					<td style="width:285px;margin-left:10px;background:#fff;border:1px solid #eee;" class="foodtd">
						<div class="image">
							<a href="#"><img src="img/<s:property value="#ob.dishImg"/>"/></a>
						</div>
						<h3 class="foodname"><s:property value="#ob.dishName"/></h3>
						<div class="foodinfo">
							<p>类别：<s:property value="#ob.type"/></p>
							<p>价格：￥<s:property value="#ob.price"/></p>
						</div>
						<a href="queryall.action?id=<s:property value="#ob.dishName"/>" class="sell" style=" text-decoration:none;">详情</a>
					</td>
				</s:iterator>
				 <s:if test="#count.index%3!=0||#count.last"> 
				 </s:if> 
			</table>
		</div>
		<%@ include file="footer.jsp" %>
</body>
</html>