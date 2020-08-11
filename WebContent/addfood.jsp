<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜品上架</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/add.action" method="post" enctype="multipart/form-data">
	图片: <input type="file" name="doc"/><br> 
	菜名:<input type="text" name="food.dishName"/><br>
	类别:<input type="text" name="food.type"/><br>
	价格:<input type="text" name="food.price"/><br>
	描述:<input type="text" name="food.introduction"/><br>
	销量:<input type="text" name="food.sales"/><br>
	<input type="submit" value="上架"/>
</form>
</body>
</html>