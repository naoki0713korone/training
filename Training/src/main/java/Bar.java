//JFreeChart(Javaプログラミング言語用のオープンソースのグラフ描画ライブラリ)

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import bean.TrainingBean;
import bean.TrainingDTO;

@WebServlet("/Bar")
public class Bar extends HttpServlet {
	static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg");	//ここで応答コンテンツがjpegであると設定。
		//月の値を取得
		String currentMonth = Integer.toString(LocalDate.now().getMonthValue());
		String Tuki = currentMonth + "月";

		//文字化け防止用（この表記をすることで凡例部分の文字化けを防げる）、
		ChartFactory.setChartTheme(StandardChartTheme.createLegacyTheme());
		//セッションスコープ呼出
		HttpSession session = request.getSession();
		//セッションスコープの値取り出し
		TrainingDTO tdto = (TrainingDTO) session.getAttribute("tdto");
		//d2インスタンス生成
		DefaultCategoryDataset d2 = new DefaultCategoryDataset();
		//tdtoの値を取り出しtbに格納
		for (int i = 0; i < tdto.size(); i++) {
			TrainingBean tb = tdto.get(i);
			
			//addValueの第一引数がint型指定なので型変換を行っています。
			int chestpressweight = Integer.parseInt(tb.getChestpressweight());
			//			int chestpresscount = Integer.parseInt(tb.getChestpresscount());
			int latpulldownweight = Integer.parseInt(tb.getLatpulldownweight());
			//			int latpulldowncount = Integer.parseInt(tb.getLatpulldowncount());
			int bicepscurlweight = Integer.parseInt(tb.getBicepscurlweight());
			//			int bicepscurlcount = Integer.parseInt(tb.getBicepscurlcount());
			int shoulderpressweight = Integer.parseInt(tb.getShoulderpressweight());
			//			int shoulderpresscount = Integer.parseInt(tb.getShoulderpresscount());
			int abdominalweight = Integer.parseInt(tb.getAbdominalweight());
			//			int abdominalcount = Integer.parseInt(tb.getAbdominalcount());
			int legpressweight = Integer.parseInt(tb.getLegpressweight());
			//			int legpresscount = Integer.parseInt(tb.getLegpresscount());
			String date = tb.getDate();

			// データセットの作成
			//(1.Y軸、2.カテゴリーの識別、3.X軸を表現)
			d2.addValue(chestpressweight, "チェストプレス", date);
			d2.addValue(latpulldownweight, "ラットプルダウン", date);
			d2.addValue(bicepscurlweight, "バイセプスカール", date);
			d2.addValue(shoulderpressweight, "ショルダープレス", date);
			d2.addValue(abdominalweight, "アブドミナル", date);
			d2.addValue(legpressweight, "レッグプレス", date);
		}
		/*JFreeChartオブジェクトの生成(.createBarChartの
		 * 第一引数がタイトル,以降、ｘ軸(String型)、ｙ軸、データセット、オリエンテーション（表示方向）、凡例（下の表示）
		ツールチップ,データポイントを押下するとurlをリダイレクトするように設定。*/
		JFreeChart chart = ChartFactory.createBarChart(Tuki, "日付", "回数", d2,
				PlotOrientation.VERTICAL, true, false, false);

		//responseに出力
		try {	//jpeg方式でクライアントに送信するための部分
			/*httpレスポンスオブジェクトからOutputStreamを取得、データ送信に使用*/
			OutputStream os = new BufferedOutputStream(response.getOutputStream());

			/*OutputStreamをバッファリング(一時的なデータの保持)。データの送信を効率的に使用できるようにする*/
			ChartUtilities.writeChartAsJPEG(os, chart, 1295, 600);					//グラフの書き出しを行う。
			//os(データを書き出す為の出力ストリーム)chart(書き出すグラフのオブジェクト)三つめが幅、４つめが高さ
			os.close();	//ストリームのクローズ
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}