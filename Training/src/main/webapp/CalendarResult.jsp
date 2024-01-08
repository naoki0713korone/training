<%@page contentType="text/html;charset=utf-8"%>
<%@page import="bean.*"%>

<%
TrainingDTO tdto = (TrainingDTO) session.getAttribute("tdto");
TrainingBean tb = null; // TrainingBeanの初期化

// cdtoから1件のデータを取り出す
if (tdto != null && tdto.size() > 0) {
    tb = tdto.get(0); 
}
%>

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
		<h1 class="text-center">
		</h1>


    <table class="table table-hover table-bordered table-striped">
        <thead>
            <tr class="table-dark">
                <th scope="col">TrainingMenu</th>
                <th scope="col">kg</th>
                <th scope="col">count</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">チェストプレス</th>
                <td><%= tb != null ? tb.getChestpressweight() : 0 %></td>
                <td><%= tb != null ? tb.getChestpresscount() : 0 %></td>
            </tr>
            <!-- ラットプルダウン -->
            <tr>
                <th scope="row">ラットプルダウン</th>
                <td><%= tb != null ? tb.getLatpulldownweight() : 0 %></td>
                <td><%= tb != null ? tb.getLatpulldowncount() : 0 %></td>
            </tr>
            <!-- バイセプスカール -->
            <tr>
                <th scope="row">バイセプスカール</th>
                <td><%= tb != null ? tb.getBicepscurlweight() : 0 %></td>
                <td><%= tb != null ? tb.getBicepscurlcount() : 0 %></td>
            </tr>
            <!-- ショルダープレス -->
            <tr>
                <th scope="row">ショルダープレス</th>
                <td><%= tb != null ? tb.getShoulderpressweight() : 0 %></td>
                <td><%= tb != null ? tb.getShoulderpresscount() : 0 %></td>
            </tr>
            <!-- アブドミナル -->
            <tr>
                <th scope="row">アブドミナル</th>
                <td><%= tb != null ? tb.getAbdominalweight() : 0 %></td>
                <td><%= tb != null ? tb.getAbdominalcount() : 0 %></td>
            </tr>
            <!-- レッグプレス -->
            <tr>
                <th scope="row">レッグプレス</th>
                <td><%= tb != null ? tb.getLegpressweight() : 0 %></td>
                <td><%= tb != null ? tb.getLegpresscount() : 0 %></td>
            </tr>
            <!-- 日付 -->
            <tr>
                <th scope="row">日付</th>
                <td colspan="2"><%= tb != null ? tb.getDate() : "" %></td>
            </tr>
        </tbody>
    </table>

    	    <!-- アコーディオンの開始 -->
    <div class="col-sm-12 offset-sm-12">
        <div class="accordion" id="accordionExample">
            <!-- アコーディオンのアイテム1 -->
            <div class="accordion-item">

               <h2 class="accordion-header " id="headingOne">
				    <button class="accordion-button text-center" type="button" data-bs-toggle="collapse" 
				        data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        <span style="font-size: 24px;">変更はこちらから！</span>
				    </button>
             </h2>
                
                
                <div id="collapseOne" class="accordion-collapse collapse " aria-labelledby="headingOne">
                
                    <div class="accordion-body">
                    
                    
     <form action="/Training/TrainingServlet" method="post">
        <!-- チェストプレスのフォーム -->
        <div class="row">
            <div class="col-sm-2">
                <label class="col-form-label" for="chestpress"
                        style="color: black; background-color: rgba(255, 215, 0, 0.85);">チェストプレス</label>
            </div>
            <div class="col-sm-2">
                <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
                        id="chestpressweight" name="chestpressweight" placeholder="kg:数字3桁まで"
                        value="<%= tb != null ? tb.getChestpressweight() : 0 %>">
            </div>
            <div class="col-sm-2">
                <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
                        id="chestpresscount" name="chestpresscount" placeholder="回:数字3桁まで"
                        value="<%= tb != null ? tb.getChestpresscount() : 0 %>">
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
		                value="<%= tb != null ? tb.getLatpulldownweight() : 0 %>"> <!-- 三項条件演算子を利用 -->
		    </div>
		    <div class="col-sm-2">
		        <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
		                id="latpulldowncount" name="latpulldowncount"
		                value="<%= tb != null ? tb.getLatpulldowncount() : 0 %>">
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
		                value="<%= tb != null ? tb.getBicepscurlweight() : 0 %>">
		    </div>
		    <div class="col-sm-2">
		        <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
		                id="bicepscurlcount" name="bicepscurlcount"
		                value="<%= tb != null ? tb.getBicepscurlcount() : 0 %>">
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
		                value="<%= tb != null ? tb.getShoulderpressweight() : 0 %>">
		    </div>
		    <div class="col-sm-2">
		        <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
		                id="shoulderpresscount" name="shoulderpresscount"
		                value="<%= tb != null ? tb.getShoulderpresscount() : 0 %>">
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
		                value="<%= tb != null ? tb.getAbdominalweight() : 0 %>">
		    </div>
		    <div class="col-sm-2">
		        <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
		                id="abdominalcount" name="abdominalcount"
		                value="<%= tb != null ? tb.getAbdominalcount() : 0 %>">
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
		                value="<%= tb != null ? tb.getLegpressweight() : 0 %>">
		    </div>
		    <div class="col-sm-2">
		        <input type="text" pattern="^[0-9]{1,3}$" class="form-control"
		                id="legpresscount" name="legpresscount"
		                value="<%= tb != null ? tb.getLegpresscount() : 0 %>">
		    </div>
		</div>
		
		
		<!-- 日付のフォーム -->
		<div class="row mt-3">
		    <div class="col-sm-2">
		        <label class="col-form-label" for="date"
		                style="color: black; background-color: rgba(255, 215, 0, 0.85);">日付</label>
		    </div>

		    <div class="col-sm-2">
		        <input type="text"  class="form-control"
		                id="date" name="date"
		                value="<%= tb != null ? tb.getDate() : "" %>"
		                readonly>  <!-- 読み取り専用 -->
		    </div>
		</div>
		
		
    

    <!-- ボタンのフォーム -->
    <div class="row mt-5">
        <div class="col-sm-2">
           
            
            
            
            
            <button type="submit" name="btn"value="カレンダー修正"  onclick="showModifyAlert()"
			        style="width: 300px; height: 60px; background-color: #3498db; color: #ffffff; margin: 10px;">
			    修正
			</button>
			            
        </div>
        
                  <div class="col-sm-2 offset-sm-1">
          
            <button type="submit" name="btn"value="カレンダー削除"  onclick="showDeleteAlert()"
			        style="width: 300px; height: 60px; background-color: #3498db; color: #ffffff; margin: 10px;">
			    削除
			</button>
			            
        </div>
        
        
    </div>
    
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
            <div class="col-sm-4 col-xs-3"">
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
    
    
        <!-- JavaScriptの読み込み -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
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
