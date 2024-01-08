<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="bean.CalendarBean"%>
<%
CalendarBean cb=(CalendarBean)request.getAttribute("cb");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title><%=cb.getGengou() %>年<%=cb.getMonth() %>月カレンダー</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">

<!--変更点　BootstrapのアイコンのCDN これでアイコンが使用可能になる -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	
	
	
	
<link rel="stylesheet"  href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
  <link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
  <link rel="stylesheet"  href="css/Calendar.css"> 
	
	

<!-- Custom Styles -->

</head>
<body>

	<div class="container mt-5 calendar-container ">
		<h1 class="text-center"><%=cb.getGengou() %>年<%=cb.getMonth() %>月のカレンダー
		</h1>
		<p class="text-center">
			<a href="?year=<%=cb.getYear()%>&month=<%=cb.getMonth()-1%>"
				class="btn btn-primary me-2">前月</a> <a
				href="?year=<%=cb.getYear()%>&month=<%=cb.getMonth()+1%>"
				class="btn btn-primary">翌月</a>
		</p>
		
		<table class="table table-bordered mt-3">
			<thead>
				<tr class="table-primary">
					<th scope="col">日</th>
					<th scope="col">月</th>
					<th scope="col">火</th>
					<th scope="col">水</th>
					<th scope="col">木</th>
					<th scope="col">金</th>
					<th scope="col">土</th>
				</tr>
			</thead>
			<tbody>
				<%for(String[] row: cb.getData()){ %>
				<tr>
					<%for(String col:row) {%>
					<%if (col.startsWith("*")){ %>
					<td class="today"><%=col.substring(1)%></td>
					<%}else{ %>
					<!-- <td><%=col %></td> -->
					<!-- 日付にリンクを貼る -->
					<!--  <td><a href="../../Training.html?date=<%=col %>"><%=col %></a></td> -->
					<td>
						<form action="/Training/TrainingServlet" method="post">
							<input type="hidden" name="year" value="<%=cb.getYear()%>">
							<input type="hidden" name="month" value="<%=cb.getMonth()%>">
							<input type="hidden" name="day" value="<%=col%>">
							<button type="submit" class="btn btn-link" name="btn"
								value="クリックした日付"><%=col%></button>
						</form>
					</td>
					<%
					}
					%>
					<%
					}
					%>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="container-fluid  "col-xs-3">
			<div class="row">

				<div class="col-sm-4">
					<button class="nav-link btn btn-danger btn-block"
						onclick="location.href='/Training/Training.jsp'"
						style="width: 100%;">
						Home <i class="bi bi-house"></i>
					</button>
				</div>
				<div class="col-sm-4">
					<button class="nav-link btn btn-warning btn-block"
						onclick="location.href='/Training/JFreeChart.jsp'"
						style="width: 100%;">
						グラフ <i class="bi bi-bar-chart"></i>
					</button>
				</div>
				<div class="col-sm-4 col-xs-3">
					<form action="/Training/TrainingServlet" method="post">


						<button class="nav-link btn btn-info btn-block" type="submit"
							name="btn" value="本日の結果" style="width: 100%;">
							本日の結果<i class="bi bi-universal-access-circle"></i>
						</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- end calendar-container -->
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
