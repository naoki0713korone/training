<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--pageディレクティブ　この頁の設定を行う宣言(言語、このブラウザで表現するタイプ指定、送信する際の文字指定)  -->
<!DOCTYPE html>
<!-- htmlのバージョンとタイプの指定。指定がなければhtml5を宣言する。下記のhtmlの宣言 -->
<html>
<head>
<meta charset="UTF-8">
<!-- 文字コードの指定 -->
<title>ログイン</title>
<link rel="stylesheet" href="css/Login.css">
<!-- link(外部のスタイルシートを使用するため宣言),rel(Relation,現在の頁との関係)href(hypetextRefalence) -->
</head>
<!-- この頁の設定やメタデータの提供を行う -->
<body>
	<!-- この頁の全てのコンテンツを表示するためのタグ -->
	<form action="TrainingServlet" method="post">
		<!-- 情報の収集を行い、宛先と送り方の指定 -->
		<h1>ログイン</h1>
		<!-- heddingの意味合い。見出しの定義。１～６まである -->
		<p>ユーザー名、パスワードを入力。「ログイン」をクリック</p>
		<!-- paragraphの意。段落 -->
		<input type="text" pattern=".{1,10}" placeholder="ユーザー名" name="name"
			autofocus><br>
		<!-- ユーザー情報を受け取るための要素。textやpassword,numver等あり -->
		<input type="password" pattern="[0-9].{1,4}" placeholder="パスワード"
			name="pass"><br>
		<!-- nameタグ.この名前を使用してデータに識別される -->
		<input type="submit" name="btn" value="ログイン"><br>
		<!-- 初期値設定。 -->
		<!-- submitは送信ボタンを生成する(提出するの意) -->
		<a href="register.jsp">ログイン登録画面へ</a>
		<!-- a アンカータグ(目印) -->
	</form>
</body>
</html>
<!-- 各終わり宣言 -->
<!-- "[0-9].{1,4}" 0~9の数字を使用できる。1~4は1文字から４文字まで共用できる宣言 -->


