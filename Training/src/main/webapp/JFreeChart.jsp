<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分析情報</title>
<!-- BootstrapのCDNリンクを追加 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!--変更点　BootstrapのアイコンのCDN これでアイコンが使用可能になる -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- Bootstrap 5.0.2のJavaScriptライブラリの読み込み -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container bg-light">
		
			<form action="/Training/BarEvent" method="get">
				<div style="max-width: 22%; margin: 0 auto; padding: 7px; margin-bottom: 7px; border: 5px double #333333; border-radius: 10px; background-color: #ffff99;">
					<h1>トレーニング履歴</h1>
				</div>
				<div class="row">
				<div class="col-sm-1 dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">種目選択</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li>
							<button class="nav-link btn btn-warning btn-block"
								type="submit" name="btn" value="チェストプレス" style="width: 100%;">チェストプレス</button>
						</li>
						<li>
							<button class="nav-link btn btn-warning btn-block"
								type="submit" name="btn" value="ラットプルダウン" style="width: 100%;">ラットプルダウン</button>
						</li>
						<li>
							<button class="nav-link btn btn-warning btn-block"
								type="submit" name="btn" value="バイセプスカール" style="width: 100%;">バイセプスカール</button>
						</li>
						<li>
							<button class="nav-link btn btn-warning btn-block"
								type="submit" name="btn" value="ショルダープレス" style="width: 100%;">ショルダープレス</button>
						</li>
						<li>
							<button class="nav-link btn btn-warning btn-block"
								type="submit" name="btn" value="アブドミナル" style="width: 100%;">アブドミナル</button>
						</li>
						<li>
							<button class="nav-link btn btn-warning btn-block"
								type="submit" name="btn" value="レッグプレス" style="width: 100%;">レッグプレス</button>
						</li>
					</ul>
				</div>
				<div class="col-sm-2">
					<!-- <button onclick="location.href='DatabaseChartDemo2'" class="btn btn-primary" style="width: 100%;">過去の全履歴</button> -->
					<a href="DatabaseChartDemo2">グラフを表示</a>
				</div>
			</form>
		</div>
		<!-- 他のコンテンツをここに追加 -->
	</div>
	<img src="/Training/Bar">
	<br>
	<br>
	<br>
	<br>
	<h1>折れ線グラフ</h1>
	<img src="/Training/Line">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4 col-xs-4">
				<button class="nav-link btn btn-danger btn-block" onclick="location.href='/Training/Training.jsp'" style="width: 100%;">Home <i class="bi bi-house"></i></button>
			</div>
			<div class="col-sm-4 col-xs-4">
				<form action="/Training/TrainingServlet" method="post">
					<button class="nav-link btn btn-success btn-block" type="submit" name="btn" value="カレンダー" style="width: 100%;">カレンダー <i class="bi bi-calendar"></i></button>
				</form>
			</div>
			<div class="col-sm-4 col-xs-4">
				<form action="/Training/TrainingServlet" method="post">
					<button class="nav-link btn btn-info btn-block" type="submit" name="btn" value="本日の結果" style="width: 100%;">本日の結果<i class="bi bi-universal-access-circle"></i></button>
				</form>
			</div>
		</div>
	</div>
	<!-- bodyコンテナの終わり -->
</body>
</html>
