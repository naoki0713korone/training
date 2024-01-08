<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*"%>
<%
//リクエストスコープに保存されたHealthインスタンスを取得
HealthBean hb = (HealthBean) request.getAttribute("hb");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>診断結果</title>
<link rel="stylesheet" href="css/Health.css">
</head>
<body>
	<form>
		<h1>診断結果</h1>
		<p>
			身長:<%=hb.getHeight()%><br> 体重:<%=hb.getWeight()%><br> BMI :<%=hb.getBmi()%><br>
			体系:<%=hb.getBodyType()%>
		</p>
		<a href="HealthCheck">戻る</a>
	</form>
</body>
</html>