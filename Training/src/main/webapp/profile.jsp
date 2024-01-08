<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*"%>
<%@ page import="java.text.DecimalFormat" %> 
<!-- 小数点を使うためデシマルフォーマットをインポート -->

<jsp:useBean id="grossWeight" scope="session" class="java.lang.String" />

<%UserBean ub = (UserBean) application.getAttribute("ub");%>

<%-- カンマを含む数値フォーマットを定義 --%>
<%! DecimalFormat decimalFormat = new DecimalFormat("#,###"); %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">

    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!-- CSSファイルの読み込み -->
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!-- タイトル設定 -->
    <title>プロフィール情報</title>
</head>
<body>
    <div class="container bg-light">
        <div style="background-color: rgba(255, 255, 255, 0.1); background-image: url('picture/bgImage.jpg'); background-size: cover;">

            <div style="max-width: 22%; margin: 0 auto; padding: 7px; margin-bottom: 7px; border: 5px double #333333; border-radius: 10px; background-color: #ffff99;">
                <h1>プロフィール</h1>
            </div>

            <!-- プロフィール情報表示 -->
            <div class="row">
                <div class="col-sm-6">
                    <table class="table">
                        <tr>
                            <td>名前:<%=ub.getName()%></td>
                            <td>身長:<%=ub.getHeight()%></td>
                            <td>体重:<%=ub.getWeight()%></td>
                            <td>BMI :<%=ub.getBmi()%></td>
                            <td>体系:<%=ub.getBodyType()%></td>
                        </tr>
                    </table>
                </div>

                <!-- アコーディオン -->
                <div class="col-sm-3">
                    <div class="accordion" id="accordionExample">
                        <!-- アコーディオンのアイテム1 -->
                        <div class="accordion-item">
                            <h3 class="accordion-header " id="headingOne">
                                <button class="accordion-button text-center" type="button"
                                        data-bs-toggle="collapse" data-bs-target="#collapseOne"
                                        aria-expanded="true" aria-controls="collapseOne">
                                    <span style="font-size: 12px;">プロフィール変更</span>
                                </button>
                            </h3>
                            <div id="collapseOne" class="accordion-collapse collapse "
                                aria-labelledby="headingOne">
                                <div class="accordion-body">
                                    <!-- プロフィール変更フォーム -->
                                    <form action="TrainingServlet" method="post">
                                        
                                        名前:<input type="text" pattern=".{1,10}" placeholder="ユーザー名" name="name" required><br> 
                                        
                                        パスワード:<input type="password" pattern="[0-9].{1,4}" placeholder="パスワード" name="pass" required ><br> 
                                        身長(cm):<input type="text" pattern=".{1,5}" placeholder="例:170.0" name="height" required><br>
                                        体重(kg):<input type="text" pattern=".{1,5}" placeholder="例:60.0" name="weight" required><br>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <button class="btn btn-secondary" type="submit" name="btn" value="プロフィール変更">
                                            <span>変更<i class="bi bi-arrow-right-square-fill"></i></span>
                                        </button>
                                        
                                        
                                       
                                        
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- アコーディオン終了 -->
                
                
                <div class="col-sm-1 offset-sm-2">
                 <button class="btn btn-secondary" type="submit" name="btn" value="プロフィール削除" 
                                         onclick="showDeleteAlert()">
                                            <span>削除<i class="bi bi-arrow-right-square-fill"></i></span>
                  </button>
                </div>
                
                
                
            </div><!-- プロフィール情報表示終わり -->

            <div class="col-sm-12">
               <!--  DecimalFormatを使用してgrossWeightの値をフォーマットして、3桁ごとにカンマを追加。 -->
                    <p><%=ub.getName()%>さんの合計負荷量は <font size="+3"><%= decimalFormat.format(Integer.parseInt(grossWeight)) %>kg</font> です</p>
                </div>





<!-- 
                <div class="col-sm-2">
                    <img id="image" src="picture/iconProfile.png" alt="画像" width="20" height="20">
                    <div id="message" style="display: none;"></div>
                </div>   -->  
                
                
                
               <!--  <script>
                    const image = document.getElementById("image");
                    const message = document.getElementById("message");
                    const trainingMenu = [ "チェストプレス", "ラットプルダウン", "ショルダープレス",
                        "バイセプスカール", "アブドミナル", "レッグプレス" ];

                    // 画像クリック時の処理
                    image.addEventListener("click", () => {
                        // メニューからランダムに一つ選ぶ
                        const randomIndex = Math.floor(Math.random() * trainingMenu.length);
                        const recommendedMenu = trainingMenu[randomIndex];

                        // メッセージを表示
                        message.textContent = `今日のおススメのトレーニングは${recommendedMenu}です`;
                        message.style.display = "block";

                        // 画像を上下に動かすアニメーション
                        image.style.transform = "translateY(20px)"; // 20px上に動かす例

                        // 2秒後にメッセージを非表示にし、画像の位置を元に戻す
                        setTimeout(() => {
                            message.style.display = "none";
                            image.style.transform = "translateY(0)";
                        }, 2000); // 2000ミリ秒（2秒）後に実行
                    });
                </script>
 -->
 
 
 
                <br><br><br><br><br><br>

                <!--    ボタンの列-->
                <div class="row mt-5">
                    <div class="col-sm-2">
                        <a class="btn button-025" href="Main.jsp">
                            <span>Topへ戻る<i class="bi bi-arrow-right-square-fill"></i></span>
                        </a>
                    </div>
                    
                    
                    
                    
                    
                    		<div class="col-sm-3 offset-sm-7">
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
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </div><!--    ボタンの列-->
            </div>
        </div>

        <!-- Bootstrap JavaScriptの読み込み -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

        <!-- JavaScriptの読み込み -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            
            
            
            
            
<script>
	// 削除ボタンがクリックされたときの処理
	function showDeleteAlert() {

	
			window.alert("削除しました。");
				
			}
		</script>
	}
</script>
            
            
            
            
            
            
            
            
    </div>
</body>
</html>
