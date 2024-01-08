<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*"%>
<%-- <jsp:useBean id="ldto" scope="request" class="bean.LoginDTO" /> --%>



<%
LoginDTO ldto = (LoginDTO) request.getAttribute("ldto");
UserBean ub = null; // Beanの初期化

// cdtoから1件のデータを取り出す
if (ldto != null && ldto.size() > 0) {
    ub = ldto.get(0); 
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録画面</title>
<link rel="stylesheet" href="css/Login.css">
</head>
<body>
	<form>
		<h1>登録完了しました</h1>
		<p>あなたの登録情報は下記です</p>
		<br>
		<tr>
			<!-- %=は式タグ。javaの式を評価し出力する -->
			<td>名前:<%=ub.getName()%></td>
			<br>
			<!-- ubの値をgetterで取得する -->
			<td>パスワード:<%=ub.getPass()%></td>
			<br>
			<td>身長:<%=ub.getHeight()%></td>
			<br>
			<td>体重:<%=ub.getWeight()%></td>
			<br>
			<td>BMI :<%=ub.getBmi()%></td>
			<br>
			<td>体系:<%=ub.getBodyType()%></td>
			<br>
			<p>一緒に良い体を作りましょう</p>
		</tr>
		<a href="index.jsp">ログイントップへ</a>
	</form>
</body>
</html>
