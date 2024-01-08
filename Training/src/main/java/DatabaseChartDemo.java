import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.SwingUtilities;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

public class DatabaseChartDemo extends JFrame {
    public DatabaseChartDemo() {
        super("Database Chart Demo");

        // データを生成
        DefaultCategoryDataset dataset = createDatasetFromDatabase();

        // グラフを生成
        JFreeChart chart = ChartFactory.createLineChart(
            "Workout Results", "Date", "Weight", dataset, PlotOrientation.VERTICAL, true, false, false);

        // スクロール可能なパネルにグラフを追加
        ChartPanel chartPanel = new ChartPanel(chart);

        // スクロールバーの設定（必要に応じて）
        JScrollPane scrollPane = new JScrollPane(chartPanel);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);

        getContentPane().add(scrollPane);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 600);
    }

    private DefaultCategoryDataset createDatasetFromDatabase() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        // データベースからデータを取得し、データセットに追加
        try {
            // データベースへの接続
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/academy", "academy", "kunren");
            
            // クエリの実行
            String sql = "SELECT date,latpulldowncount FROM training";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            // データセットにデータを追加
            while (rs.next()) {
                String date = rs.getString("date");
                double latpulldowncount = rs.getDouble("latpulldowncount");
                //dataset.addValue(weight, "Weight", date);
                
                dataset.addValue(latpulldowncount, "Weight", date);
            }
            
            // リソースのクローズ
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dataset;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            DatabaseChartDemo demo = new DatabaseChartDemo();
            demo.setVisible(true);
        });
    }
}
