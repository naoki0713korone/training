<%@page contentType="text/html;charset=utf-8"%>
<%@page import="bean.*"%>

<jsp:useBean id="tdto" scope="request" class="bean.TrainingDTO" />
<!-- リクエストスコープの情報を使用する為表記 -->
<jsp:useBean id="msg" scope="request" class="java.lang.String" />


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





<title>トレーニング結果</title>




</head>


<body>

	<h2><%=msg%></h2>
	<!-- 変数msgの情報をタイトルへ -->





	<table class="table table-hover table-bordered table-striped">
		<thead>
			<tr class="table-dark">
				<th scope="col">menu</th>
				<th scope="col">kg</th>
				<th scope="col">count</th>
			</tr>
		</thead>
		<tbody>


			<%
			for (int i = 0; i < tdto.size(); i++) { 
				TrainingBean tb = tdto.get(i);
			%>


			<tr>
				<th scope="row">チェストプレス</th>
				<td><%=tb.getChestpressweight()%></td>
				<td><%=tb.getChestpresscount()%></td>
			</tr>


			<tr>
				<th scope="row">ラットプルダウン</th>
				<td><%=tb.getLatpulldownweight()%></td>
				<td><%=tb.getLatpulldowncount()%></td>
			</tr>


			<tr>
				<th scope="row">バイセプスカール</th>
				<td><%=tb.getBicepscurlweight()%></td>
				<td><%=tb.getBicepscurlcount()%></td>
			</tr>

			<tr>
				<th scope="row">ショルダープレス</th>
				<td><%=tb.getShoulderpressweight()%></td>
				<td><%=tb.getShoulderpresscount()%></td>
			</tr>


			<tr>
				<th scope="row">アブドミナル</th>
				<td><%=tb.getAbdominalweight()%></td>
				<td><%=tb.getAbdominalcount()%></td>
			</tr>


			<tr>
				<th scope="row">レッグプレス</th>
				<td><%=tb.getLegpressweight()%></td>
				<td><%=tb.getLegpresscount()%></td>
			</tr>

			<tr>
				<th scope="row">日付</th>
				<td colspan="2"><%=tb.getDate()%></td>
			</tr>


			<%
			}
			%>


		</tbody>
	</table>



	<br />








	<!-- アコーディオンの開始 -->
	<div class="col-sm-12 offset-sm-12">
		<div class="accordion" id="accordionExample">
			<!-- アコーディオンのアイテム1 -->
			<div class="accordion-item">

				<h2 class="accordion-header text-center" id="headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">
						<span style="font-size: 24px;">変更はこちらから！</span>
					</button>
				</h2>







				<div id="collapseOne" class="accordion-collapse collapse "
					aria-labelledby="headingOne">



					<div class="accordion-body">







						<form action="/Training/TrainingServlet" method="post">




							<%
			for (int i = 0; i < tdto.size(); i++) { 
				TrainingBean tb = tdto.get(i);
			%>






							<!-- チェストプレスのフォーム -->
							<div class="row">
								<div class="col-sm-2">
									<label class="col-form-label" for="chestpress"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">チェストプレス</label>
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="chestpressweight" name="chestpressweight"
										placeholder="kg:数字3桁まで"
										value="<%= tb != null ? tb.getChestpressweight() : "" %>">	<!-- 三項条件演算子を利用 -->
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="chestpresscount" name="chestpresscount"
										placeholder="回:数字3桁まで"
										value="<%= tb != null ? tb.getChestpresscount() : "" %>">
								</div>
							</div>


							<!-- ラットプルダウンのフォーム -->
							<div class="row mt-3">
								<div class="col-sm-2">
									<label class="col-form-label" for="latpulldown"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">ラットプルダウン</label>
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="latpulldownweight" name="latpulldownweight"
										value="<%= tb != null ? tb.getLatpulldownweight() : "" %>">
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="latpulldowncount" name="latpulldowncount"
										value="<%= tb != null ? tb.getLatpulldowncount() : "" %>">
								</div>
							</div>
							<!-- バイセプスカールのフォーム -->
							<div class="row mt-3">
								<div class="col-sm-2">
									<label class="col-form-label" for="bicepscurl"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">バイセプスカール</label>
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="bicepscurlweight" name="bicepscurlweight"
										value="<%= tb != null ? tb.getBicepscurlweight() : "" %>">
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="bicepscurlcount" name="bicepscurlcount"
										value="<%= tb != null ? tb.getBicepscurlcount() : "" %>">
								</div>
							</div>
							<!-- ショルダープレスのフォーム -->
							<div class="row mt-3">
								<div class="col-sm-2">
									<label class="col-form-label" for="shoulderpress"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">ショルダープレス</label>
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="shoulderpressweight" name="shoulderpressweight"
										value="<%= tb != null ? tb.getShoulderpressweight() : "" %>">
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="shoulderpresscount" name="shoulderpresscount"
										value="<%= tb != null ? tb.getShoulderpresscount() : "" %>">
								</div>
							</div>
							<!-- アブドミナルのフォーム -->
							<div class="row mt-3">
								<div class="col-sm-2">
									<label class="col-form-label" for="abdominal"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">アブドミナル</label>
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="abdominalweight" name="abdominalweight"
										value="<%= tb != null ? tb.getAbdominalweight() : "" %>">
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="abdominalcount" name="abdominalcount"
										value="<%= tb != null ? tb.getAbdominalcount() : "" %>">
								</div>
							</div>
							<!-- レッグプレスのフォーム -->
							<div class="row mt-3">
								<div class="col-sm-2">
									<label class="col-form-label" for="legpress"
										style="color: black; background-color: rgba(255, 215, 0, 0.85);">レッグプレス</label>
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="legpressweight" name="legpressweight"
										value="<%= tb != null ? tb.getLegpressweight() : "" %>">
								</div>
								<div class="col-sm-2">
									<input type="text" pattern="^[0-9]{1,3}$" class="form-control"
										id="legpresscount" name="legpresscount"
										value="<%= tb != null ? tb.getLegpresscount() : "" %>">
								</div>
							</div>



							<!-- ボタンのフォーム -->
							<div class="row mt-5">
								<div class="col-sm-2">
									<input type="submit" name="btn" value="修正"
										onclick="showModifyAlert()"
										style="width: 300px; height: 60px; background-color: #3498db; color: #ffffff; margin: 10px;" />
								</div>





								<div class="col-sm-2　offset-sm-1">
									<input type="submit" name="btn" value="削除"
										onclick="showDeleteAlert()"
										style="width: 300px; height: 60px; background-color: #3498db; color: #ffffff; margin: 10px;" />
								</div>
							</div>



							<%
			}
			%>





						</form>


















					</div>







				</div>
			</div>

		</div>
	</div>
	<!-- アコーディオンの終了 -->




















	<!-- ボタンのコンテナ -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4">
				<button class="nav-link btn btn-danger btn-block"
					onclick="location.href='/Training/Training.jsp'"
					style="width: 100%;">
					Home <i class="bi bi-house"></i>
				</button>
			</div>




			<div class="col-sm-3 col-xs-3">
				<form action="/Training/TrainingServlet" method="post">


					<button class="nav-link btn btn-danger btn-block" type="submit"
						name="btn" value="グラフ" style="width: 100%;">
						グラフ<i class="bi bi-bar-chart-line-fill"></i>
					</button>
				</form>
			</div>







			<div class="col-sm-4">
				<button class="nav-link btn btn-success btn-block"
					onclick="location.href='/Training/TrainingServlet'"
					style="width: 100%;">
					カレンダー <i class="bi bi-calendar"></i>
				</button>
			</div>
		</div>
	</div>










	<!-- JavaScriptの読み込み -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
　</script>




	<script>
	    // 修正ボタンがクリックされたときの処理
	    function showModifyAlert() {
	        window.alert("修正完了しました。");
	    }
    </script>



	<script>
	    // 削除ボタンがクリックされたときの処理
	    function showDeleteAlert() {
	        window.alert("削除しました。");
	    }
    </script>














</body>
</html>
