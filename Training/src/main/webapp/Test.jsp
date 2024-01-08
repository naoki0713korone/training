<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録画面</title>

<!--  css -->
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<link href="https://fonts.googleapis.com/css?family=Philosopher"
	rel="stylesheet">
<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<div id="contact" class="big-bg">

		<header class="page-header wrapper">
			<div class="wrapper">
				<h2 class="page-title">TrainingRegister</h2>




				<main>

					<!-- フォーム部分 コンテナの開始 -->
					<div class="container  bg-secondary  ">

						<form action="/Training/TrainingServlet" method="post">
							<!-- 背景画像 -->
							<!-- background-sizeプロパティを使用して背景画像のサイズを変更。
           サイズ調整オプションcontain: 背景画像を要素に合わせて表示し、要素の中で完全に表示されるように調整しますが、要素全体を覆わないことがあります。 -->
							<!--  background: rgba(255, 255, 255, 0.5); で透過度を0.5に調整  -->
							<!-- <div -->
							<!-- style="background-color: rgba(255, 255, 255, 0.1); background-image: url('picture/unsplash.jpg'); background-size: contain;"> -->
							<!--  カレンダー列  -->
							<div class="row mb-3">
								<div class="col-sm-2">
									<label class="col-form-label" for="date"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">トレーニング日</label>
								</div>
								<div class="col-sm-2">
									<input type="date" class="form-control" id="date" name="date"
										required max="<%=java.time.LocalDate.now()%>">
								</div>
							</div>
							<!--	チェストプレス部分の列-->
							<div class="row ">
								<div class="col-sm-2">
									<label class="col-form-label" for="chestpress"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">チェストプレス</label>
								</div>
								<div class="col-sm-2">
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
										id="latpulldownweight" name="latpulldownweight"
										placeholder="kg">
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
										id="shoulderpresscount" name="shoulderpresscount"
										placeholder="回">
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
				</main>
				</form>



			<!-- </div> -->
			<!-- <a href="index.html"><img class="logo" src="picture/???.svg"
				alt="トレーニングホーム"</a> -->
		</header>
	</div>
	
	
	
	
<section>






</section>
	
	
	
	

	<footer>
		<div class="wrapper">
			<p>
				<small>&copy; 2023 teamNOUKIN</small>
			</p>
		</div>
	</footer>
</body>
</html>