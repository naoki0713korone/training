<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.*"%>
<jsp:useBean id="count" scope="application" class="java.lang.String" />
<%
UserBean ub = (UserBean) application.getAttribute("ub");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>TrainingHome</title>
<meta name="description" content="トレーニング経歴を登録、分析できるアプリ">

<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
<link href="https://fonts.googleapis.com/css?family=Philosopher"
	rel="stylesheet">
<link rel="stylesheet" href="css/Main.css">
</head>
<body>
	<div id="home" class="big-bg">
		<header class="page-header wrapper">
			<nav>
				<ul class="main-nav">
					<li><div class="col-sm-3 col-xs-3">
							<form action="/Training/TrainingServlet" method="post">
								<button class="nav-link btn btn-warning btn-block" type="submit"
									name="btn" value="グラフ" style="width: 100%;">
									Graph<span class="br"><i
										class="bi bi-bar-chart-line-fill"></i>
								</button>
							</form>
						</div></li>

					<li><div class="col-sm-3 col-xs-3">
							<form action="/Training/TrainingServlet" method="post">
								<button class="nav-link btn btn-success btn-block" type="submit"
									name="btn" value="カレンダー" style="width: 100%;">
									Calendar<span class="br"><i class="bi bi-calendar"></i>
								</button>
							</form>
						</div></li>

					<li><div class="col-sm-3 col-xs-3">
							<form action="/Training/TrainingServlet" method="post">
								<button class="nav-link btn btn-info btn-block" type="submit"
									name="btn" value="本日の結果" style="width: 100%;">
									Result<span class="br"><i
										class="bi bi-universal-access-circle"></i>
								</button>
							</form>
						</div></li>

					<li><div class="col-sm-3 col-xs-3">
							<form action="/Training/Logout" method="get">
								<button class="nav-link btn btn-warning btn-block" type="submit"
									name="btn" value="ログアウト" style="width: 100%;">
									Logout<span class="br"><i
										class="bi bi-bar-chart-line-fill"></i>
								</button>
							</form>
						</div></li>
				</ul>
			</nav>

			<h1>
				<a href="profile.jsp"><img class="logo"
					src="picture/iconProfile.png" alt="profile"></a>
			</h1>


		</header>





		<div class="home-content wrapper">
			<h2 class="page-title">WEBアプリケーション実習</h2>
			<p>
				ようこそ
				<%=ub.getName()%>
				さん
			</p>

			<p>
				<font size="5"> あなたはトレーニング登録<%=count%>回行っています
				</font>
			</p>
			<a class="button" href="Training.jsp">トレーニング登録へ</a>
		</div>
	</div>
</body>
</html>
