<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="grossWeight" scope="session" class="java.lang.String" />

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">


<!--変更点　BootstrapのアイコンのCDN これでアイコンが使用可能になる -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- CSSファイルの読み込み -->

<link rel="stylesheet" type="text/css" href="css/style.css">


<title>Home</title>




</head>

<header>


	<!-- ナビゲーションメニュー -->
	<div class="container mt-3">
		<div class="row">
	
			<ul class="nav" style="background-color: #FFFF66;">

				<div class="col-sm-3 col-xs-3">
					<form action="/Training/TrainingServlet" method="post">


						<button class="nav-link btn btn-danger btn-block" type="submit"
							name="btn" value="グラフ" style="width: 100%;">
							グラフ<i class="bi bi-bar-chart-line-fill"></i>
						</button>
					</form>
				</div>
				<div class="col-sm-3 col-xs-3">
					<form action="/Training/TrainingServlet" method="post">
						<button class="nav-link btn btn-warning btn-block" type="submit"
							name="btn" value="カレンダー" style="width: 100%;">
							カレンダー <i class="bi bi-calendar"></i>
						</button>
					</form>
				</div>

				<div class="col-sm-3 col-xs-3">
					<form action="/Training/TrainingServlet" method="post">


						<button class="nav-link btn btn-info btn-block" type="submit"
							name="btn" value="本日の結果" style="width: 100%;">
							本日の結果<i class="bi bi-universal-access-circle"></i>
						</button>
					</form>
				</div>


				<div class="col-sm-3 col-xs-3">
					<form action="/Training/Logout" method="get">
						<button class="nav-link btn btn-warning btn-block" type="submit"
							name="btn" value="ログアウト" style="width: 100%;">
							Logout<span class="br"><i
								class="bi bi-bar-chart-line-fill"></i>
						</button>
					</form>
				</div>
			</ul>
		</div>
		<!--  ナビゲーションコンテナの終わり  -->
</header>
<main>

	<!-- フォーム部分 コンテナの開始 -->
	<div class="container  bg-secondary  ">

		<form action="/Training/TrainingServlet" method="post">
			<!-- 背景画像 -->
			<div
				style="background-color: rgba(255, 255, 255, 0.1); background-image:
				url('picture/adem.jpg'); background-size: cover;">
				<!--  カレンダー列  -->
				<div class="row mb-3">
					<div class="col-sm-2">
						<label class="col-form-label" for="date"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">トレーニング日</label>
					</div>
					<div class="col-sm-2">
						<input type="date" class="form-control" id="date" name="date"
							required max="<%=java.time.LocalDate.now()%>">
							<!-- 入力できる最大値を現在日時に設定している -->
					</div>
					
					
				
				
					<div class="col-sm-1 offset-sm-7">
					<a href="profile.jsp"><img class="logo" src="picture/iconProfile.png" alt="profile"></a>
					</div>
				
					
					
					
					
					
				</div>
				<!--	チェストプレス部分の列-->
				<div class="row ">
					<div class="col-sm-2">
						<label class="col-form-label" for="chestpress"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">チェストプレス</label>
					</div>
					<div class="col-sm-2">
					<!-- "[0-9].{1,4}" 0~9の数字を使用できる。1~3は1文字から３文字まで使用できる宣言 -->
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="chestpressweight" name="chestpressweight"
							placeholder="kg:数字3桁まで">
					</div>
					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="chestpresscount" name="chestpresscount"
							placeholder="回：数字3桁まで">
					</div>
				</div>

				<!-- チェストプレス列の終わり -->
				<!--	ラットプルダウンの列-->
				<div class="row mt-3">
					<div class="col-sm-2">
						<label class="col-form-label" for="chestpress"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">ラットプルダウン</label>
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="latpulldownweight" name="latpulldownweight" placeholder="kg">
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="latpulldowncount" name="latpulldowncount" placeholder="回">
					</div>

				</div>

				<!--	バイセプスカールの列-->
				<div class="row mt-3">

					<div class="col-sm-2">
						<label class="col-form-label" for="chestpress"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">バイセプスカール</label>
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="bicepscurlweight" name="bicepscurlweight" placeholder="kg">
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="bicepscurlcount" name="bicepscurlcount" placeholder="回">
					</div>

				</div>


				<!--ショルダープレスの列-->
				<div class="row mt-3">

					<div class="col-sm-2">
						<label class="col-form-label" for="chestpress"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">ショルダープレス</label>
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="shoulderpressweight" name="shoulderpressweight"
							placeholder="kg">
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="shoulderpresscount" name="shoulderpresscount" placeholder="回">
					</div>

				</div>

				<!--	アブドミナルの列-->
				<div class="row mt-3">

					<div class="col-sm-2">
						<label class="col-form-label" for="chestpress"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">アブドミナル</label>
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="abdominalweight" name="abdominalweight" placeholder="kg">
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="abdominalcount" name="abdominalcount" placeholder="回">
					</div>

				</div>

				<!--レッグプレス部分の列-->
				<div class="row mt-3">

					<div class="col-sm-2">
						<label class="col-form-label" for="chestpress"
							style="color: black; background-color: rgba(255, 215, 0, 0.85);">レッグプレス</label>
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="legpressweight" name="legpressweight" placeholder="kg">
					</div>

					<div class="col-sm-2">
						<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
							id="legpresscount" name="legpresscount" placeholder="回">
					</div>

				</div>
				
				
				
				
				
				<!--    ボタンの列-->

				<div class="row mt-5">

					<div class="col-sm-2">
						<button class="btn button-025" type="submit" name="btn"
							value="入力結果" onclick="showRegistrationAlert()">
							<!-- onclick="showRegistrationAlert()"でクリックされた時にアラートを出せる javascript -->

							<span>登録<i class="bi bi-arrow-right-square-fill"></i></span>
						</button>
					</div>






					<!-- 吹き出し -->
					<div class="balloon3-left col-sm-2 offset-sm-4">※空白の場合は0になります※</div>
					
					
					
		<div class="col-sm-3 offset-sm-4">
	<div id="carouselExample" class="carousel slide">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<!--		リンク先チェストプレスのやり方のYouTube動画-->
				<!--https://shinnetbusiness.com/3426.html   バナーの作り方参考サイト-->
				<a href="https://www.youtube.com/watch?v=NMLFTGXgXvo"><img
					src="picture/bannerChest.jpg" class="d-block w-100" alt="..."
					border="0" /></a>
			</div>

			<div class="carousel-item">
				<a href="https://www.youtube.com/watch?v=NMLFTGXgXvo"><img
					src="picture/bannerLatpull.jpg" class="d-block w-100" alt="..."
					border="0" /></a>
			</div>

			<div class="carousel-item">
				<a href="https://www.youtube.com/watch?v=NMLFTGXgXvo"><img
					src="picture/bannerLegpress.jpg" class="d-block w-100" alt="..."
					border="0" /></a>
			</div>

		</div>
		<!-- carousel-innerのタグ終わり-->

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>

	</div>
</div>
<!-- div id="carouselExample" class="carousel slide"のタグ終わり-->			
					
					
					
					
					
		
</div>	<!--    ボタンの列終わり-->		
					
</main>
</form>










<!-- JavaScriptの読み込み -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>




<script>
	// 登録ボタンがクリックされたときの処理
	function showRegistrationAlert() {
		// 日付のテキストボックスの値を取得
		var dateValue = document.getElementById("date").value;

		// 日付が入力されているかどうかをチェック
		if (dateValue.trim() === "") {
			// 日付が入力されていない場合、アラートダイアログボックスにエラーメッセージを表示
			window.alert("データを正しく入力してください。トレーニング日は必須項目です。");
		} else {
			// 日付が入力されている場合、登録完了メッセージを表示
			window.alert("登録完了しました。");
		}
	}
</script>



<!-- <script>
	function validateForm() {
		// フォーム内の各テキストボックスの値を取得
		var dateValue = document.getElementById("date").value;
		var chestpressWeight = document.getElementById("chestpressweight").value;
		var chestpressCount = document.getElementById("chestpresscount").value;
		var latpulldownWeight = document.getElementById("latpulldownweight").value;
		var latpulldownCount = document.getElementById("latpulldowncount").value;
		// 他のテキストボックスも同様に取得

		// 日付が入力されているかどうかをチェック
		if (dateValue.trim() === "") {
			// 日付が入力されていない場合、アラートダイアログボックスにエラーメッセージを表示
			window.alert("データを正しく入力してください。トレーニング日は必須項目です。");
			event.preventDefault(); // 画面が遷移しないようにする
			return;
		}

		// チェストプレスの条件チェック
		if (!isNumeric(chestpressWeight) || !isNumeric(chestpressCount)) {
			window.alert("チェストプレスの重量と回数は数字で入力してください。");
			event.preventDefault();
			return;
		}

		// ラットプルダウンの条件チェック
		if (!isNumeric(latpulldownWeight) || !isNumeric(latpulldownCount)) {
			window.alert("ラットプルダウンの重量と回数は数字で入力してください。");
			event.preventDefault();
			return;
		}

		// 他のテキストボックスの条件チェックも同様に追加

		// 画面が遷移しないようにする
		event.preventDefault();
	}

	// 文字列が数字であるかどうかをチェックするヘルパー関数
	function isNumeric(input) {
		return !isNaN(input) && isFinite(input);
	}
</script>
 -->



</html>
