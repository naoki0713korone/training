<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録画面</title>
<link rel="stylesheet" href="css/Login.css">
</head>
<body>
	<form action="TrainingServlet" method="post">
		<h1>ユーザー登録</h1>
		<p>下記に登録情報を記入してください</p>
		名前:<input type="text" pattern=".{1,10}" placeholder="ユーザー名"
			name="name" required autofocus><br>
		<!-- autofocusで読み込み時自動的に該当テキストを出る -->
		パスワード:<input type="password" pattern="[0-9].{1,4}" placeholder="パスワード"
			name="pass" required><br>
		<!-- required 必須項目に変える -->
		身長(cm):<input type="text" pattern=".{1,5}" placeholder="例:170.0"
			name="height" required><br>
		体重(kg):<input type="text" pattern=".{1,5}" placeholder="例:60.0"
			name="weight" required><br> <input type="submit"
			name="btn" value="ログイン登録">
	</form>
</body>
</html>
