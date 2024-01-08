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

@WebServlet("/BarEvent")
public class BarEvent extends HttpServlet {
	static final long serialVersionUID = 1L;
	private DefaultCategoryDataset dataset = new DefaultCategoryDataset();

	public BarEvent() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg");

		String currentMonth = Integer.toString(LocalDate.now().getMonthValue());
		String Tuki = currentMonth + "月";

		//文字化け防止用
		ChartFactory.setChartTheme(StandardChartTheme.createLegacyTheme());

		//入力値（btn）を取得,jspから受け取った情報を取得
		String btn = request.getParameter("btn"); //チェストプレスと入っている

		//セッションスコープ呼出
		HttpSession session = request.getSession();

		dataset.clear();
		//セッションスコープの値取り出し
		TrainingDTO tdto = (TrainingDTO) session.getAttribute("tdto");
		//d2インスタンス生成
		DefaultCategoryDataset d2 = new DefaultCategoryDataset();
		for (int i = 0; i < tdto.size(); i++) {
			TrainingBean tb = tdto.get(i);

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

			// データセットの作成、押下された種目を表示する為の条件式
			if (btn.equals("チェストプレス")) {
				d2.addValue(chestpressweight, "チェストプレス", date);
			} else if (btn.equals("ラットプルダウン")) {
				d2.addValue(latpulldownweight, "ラットプルダウン", date);
			} else if (btn.equals("バイセプスカール")) {
				d2.addValue(bicepscurlweight, "バイセプスカール", date);
			} else if (btn.equals("ショルダープレス")) {
				d2.addValue(shoulderpressweight, "ショルダープレス", date);
			} else if (btn.equals("アブドミナル")) {
				d2.addValue(abdominalweight, "アブドミナル", date);
			} else if (btn.equals("レッグプレス")) {
				d2.addValue(legpressweight, "レッグプレス", date);
			} else {

			}
		}

		//JFreeChartオブジェクトの生成
		JFreeChart chart = ChartFactory.createBarChart(Tuki, "日付", "回数", d2,
				PlotOrientation.VERTICAL, true, true, false);
		//responseに出力
		try {
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			ChartUtilities.writeChartAsJPEG(os, chart, 1290, 600);
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
