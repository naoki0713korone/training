import java.awt.BasicStroke;
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
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;

import bean.TrainingBean;
import bean.TrainingDTO;

@WebServlet("/Line")
public class Line extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Line() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 String currentMonth = Integer.toString(LocalDate.now().getMonthValue());
         String Tuki = currentMonth + "月";
    	
    	
        response.setContentType("image/jpeg");

        // 文字化け防止用
        ChartFactory.setChartTheme(StandardChartTheme.createLegacyTheme());


        // セッションスコープ呼出
        HttpSession session = request.getSession();
        // セッションスコープの値取り出し
        TrainingDTO tdto = (TrainingDTO) session.getAttribute("tdto");
        // L2インスタンス生成
        DefaultCategoryDataset L2 = new DefaultCategoryDataset();
        
        for (int i = 0; i < tdto.size(); i++) {
            TrainingBean td = tdto.get(i);

            //Y軸の情報はint型で仮引数を設定しているため型変換を行う。
            int chestpresscount = Integer.parseInt(td.getChestpresscount());
            int latpulldowncount = Integer.parseInt(td.getLatpulldowncount());
            int bicepscurlcount = Integer.parseInt(td.getBicepscurlcount());
            int shoulderpresscount = Integer.parseInt(td.getShoulderpresscount());
            int abdominalcount = Integer.parseInt(td.getAbdominalcount());
            int legpresscount = Integer.parseInt(td.getLegpresscount());
            String date = td.getDate();

            // データセットの作成
            L2.addValue(chestpresscount, "チェストプレス", date);
            L2.addValue(latpulldowncount, "ラットプルダウン", date);
            L2.addValue(bicepscurlcount, "バイセプスカール", date);
            L2.addValue(shoulderpresscount, "ショルダープレス", date);
            L2.addValue(abdominalcount, "アブドミナル", date);
            L2.addValue(legpresscount, "レッグプレス", date);
        }
        
        // JFreeChartオブジェクトの生成
        JFreeChart chart = ChartFactory.createLineChart(Tuki, "日付", "回数", L2,
                PlotOrientation.VERTICAL, true, true, false);

        // プロットの取得
        CategoryPlot plot = chart.getCategoryPlot();

        // レンダラーの取得
        LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();

        // 線の太さを設定
        renderer.setSeriesStroke(0, new BasicStroke(3.0f)); // チェストプレスの線の太さ
        renderer.setSeriesStroke(1, new BasicStroke(3.0f)); // ラットプルダウンの線の太さ
        renderer.setSeriesStroke(2, new BasicStroke(3.0f)); // バイセプスカールの線の太さ
        renderer.setSeriesStroke(3, new BasicStroke(3.0f)); // ショルダープレスの線の太さ
        renderer.setSeriesStroke(4, new BasicStroke(3.0f)); // アブドミナルの線の太さ
        renderer.setSeriesStroke(5, new BasicStroke(3.0f)); // レッグプレスの線の太さ

        // responseに出力
        try {
            OutputStream os = new BufferedOutputStream(response.getOutputStream());
            ChartUtilities.writeChartAsJPEG(os, chart, 1295, 600);
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
