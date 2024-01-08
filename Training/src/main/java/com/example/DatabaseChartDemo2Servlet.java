package com.example;
import java.awt.BasicStroke;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFrame;
import javax.swing.JScrollPane;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.DateTickUnit;
import org.jfree.chart.axis.DateTickUnitType;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.time.Day;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;

@WebServlet("/DatabaseChartDemo2Servlet")
public class DatabaseChartDemo2Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // データを生成
        TimeSeriesCollection dataset = createDatasetFromDatabase();

        // グラフを生成
        JFreeChart chart = createChart(dataset);

        // スクロール可能なパネルにグラフを追加
        ChartPanel chartPanel = new ChartPanel(chart);
        JScrollPane scrollPane = new JScrollPane(chartPanel); // JScrollPaneにChartPanelを設定

        // レイアウトの設定
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);

        // スクロールパネルをコンテンツとして設定
        JFrame frame = new JFrame("Database Chart Demo2");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(scrollPane);
        frame.setSize(1000, 600);
        frame.setVisible(true);
    }

    // データベースからデータを取得してデータセットを作成するメソッド
    private TimeSeriesCollection createDatasetFromDatabase() {
        TimeSeriesCollection dataset = new TimeSeriesCollection();

        try {
            // データベースへの接続
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/academy", "academy", "kunren");

            // クエリの実行
            String sql = "SELECT date, latpulldowncount, chestpresscount, bicepscurlcount, shoulderpresscount, abdominalcount, legpresscount FROM training";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            // データセットにデータを追加
            TimeSeries series = new TimeSeries("Lat Pulldown Count");
            TimeSeries series2 = new TimeSeries("Chest Press Count");
            TimeSeries series3 = new TimeSeries("Biceps Curl Count");
            TimeSeries series4 = new TimeSeries("Shoulder Press Count");
            TimeSeries series5 = new TimeSeries("Abdominal Count");
            TimeSeries series6 = new TimeSeries("Leg Press Count");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            while (rs.next()) {
                String dateStr = rs.getString("date");
                Double latpulldowncount = rs.getDouble("latpulldowncount");
                Double chestpresscount = rs.getDouble("chestpresscount");
                Double bicepscurlcount = rs.getDouble("bicepscurlcount");
                Double shoulderpresscount = rs.getDouble("shoulderpresscount");
                Double abdominalcount = rs.getDouble("abdominalcount");
                Double legpresscount = rs.getDouble("legpresscount");
                Date date = dateFormat.parse(dateStr);

                // 同じ日付のデータが存在しない場合にのみ追加
                boolean dateExists = false;
                for (int i = 0; i < series.getItemCount(); i++) {
                    Day existingDay = (Day) series.getDataItem(i).getPeriod();
                    if (existingDay.equals(new Day(date))) {
                        dateExists = true;
                        break;
                    }
                }

                if (!dateExists) {
                    series.add(new Day(date), latpulldowncount);
                    series2.add(new Day(date), chestpresscount);
                    series3.add(new Day(date), bicepscurlcount);
                    series4.add(new Day(date), shoulderpresscount);
                    series5.add(new Day(date), abdominalcount);
                    series6.add(new Day(date), legpresscount);
                }
            }

            // データセットに追加
            dataset.addSeries(series);
            dataset.addSeries(series2);
            dataset.addSeries(series3);
            dataset.addSeries(series4);
            dataset.addSeries(series5);
            dataset.addSeries(series6);

            // リソースのクローズ
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return dataset;
    }

    // グラフを作成するメソッド
    private JFreeChart createChart(TimeSeriesCollection dataset) {
        JFreeChart chart = ChartFactory.createTimeSeriesChart(
                "Workout Results",
                "日付",
                "回数",
                dataset,
                true,  // 凡例を表示
                true,
                false);

        XYPlot plot = (XYPlot) chart.getPlot();
        plot.setDomainPannable(true);
        plot.setRangePannable(true);

        DateAxis xAxis = (DateAxis) plot.getDomainAxis();
        xAxis.setTickUnit(new DateTickUnit(DateTickUnitType.DAY, 7)); // 1週間ごとに目盛りを表示
        xAxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd")); // 日付のフォーマットを指定

        NumberAxis yAxis = (NumberAxis) plot.getRangeAxis();
        yAxis.setAutoRangeIncludesZero(false);

        XYLineAndShapeRenderer renderer = (XYLineAndShapeRenderer) plot.getRenderer();
        renderer.setBaseShapesVisible(true);

        // 線の太さを設定（ここでは2.0に設定）
        for (int i = 0; i < dataset.getSeriesCount(); i++) {
            renderer.setSeriesStroke(i, new BasicStroke(2.0f));
        }

        return chart;
    }
}
