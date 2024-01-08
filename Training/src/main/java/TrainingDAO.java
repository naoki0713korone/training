
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import bean.TrainingBean;
import bean.TrainingDTO;

public class TrainingDAO {
	private final String URL = "jdbc:postgresql://localhost/academy"; //DBへの接続情報の定義
	private final String USER = "academy";
	private final String PASS = "kunren";
	private Connection con = null;

	public String getCurrentDateTime() {	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");	//simpleDateFormatクラスで日付のフォーマット設定
		return dateFormat.format(new Date());		//newDateで最新日付を取得する
	}
	String currentDate = getCurrentDateTime(); // 現在の日時を取得

	public void connect() { //DBへ接続するためのconnect()メソッド
		try {
			// ①DBに接続
			con = DriverManager.getConnection(URL, USER, PASS);
		} catch (Exception e) {
			e.printStackTrace(); // エラーメッセージ
		}
	}

	//DBへ全件検索をかけるためのselectメソッド
	public TrainingDTO select(String SQL) {
		Statement stmt = null;
		ResultSet rs = null;
		TrainingDTO tdto = new TrainingDTO();

		String sql = SQL;

		try {
			connect();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) { //rsの情報を一つずつ取出。
				TrainingBean tb = new TrainingBean(); //sb2を作成。その後のDTOのaddメソッド呼出、ArrayListに追加していく

				tb.setChestpressweight(rs.getString("chestpressweight"));
				tb.setChestpresscount(rs.getString("chestpresscount"));
				tb.setLatpulldownweight(rs.getString("latpulldownweight"));
				tb.setLatpulldowncount(rs.getString("latpulldowncount"));
				tb.setBicepscurlweight(rs.getString("bicepscurlweight"));
				tb.setBicepscurlcount(rs.getString("bicepscurlcount"));
				tb.setShoulderpressweight(rs.getString("shoulderpressweight"));
				tb.setShoulderpresscount(rs.getString("shoulderpresscount"));
				tb.setAbdominalweight(rs.getString("abdominalweight"));
				tb.setAbdominalcount(rs.getString("abdominalcount"));
				tb.setLegpressweight(rs.getString("legpressweight"));
				tb.setLegpresscount(rs.getString("legpresscount"));
				tb.setDate(rs.getString("date"));
				tb.setId(rs.getString("id"));
				tdto.add(tb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close(); //rsとstmlをクローズ
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		disconnect(); //コネクションをクローズ
		return tdto; //ApplicationDTOのオブジェクトを呼出元に返す
	}

	public int insert(String chestpressweight, String chestpresscount, String latpulldownweight,
			String latpulldowncount, String bicepscurlweight, String bicepscurlcount, String shoulderpressweight,
			String shoulderpresscount, String abdominalweight, String abdominalcount, String legpressweight,
			String legpresscount, String date, String id) {

		//0925  INSERT INTO academy.trainingからtrainingへ変更
		String sql = "INSERT INTO training (chestpressweight, chestpresscount, latpulldownweight, latpulldowncount, "
				+
				"bicepscurlweight, bicepscurlcount, shoulderpressweight, shoulderpresscount, " +
				"abdominalweight, abdominalcount, legpressweight, legpresscount, date,id) " +
				"VALUES (" + chestpressweight + ", " + chestpresscount + ", " + latpulldownweight + ", " +
				latpulldowncount + ", " + bicepscurlweight + ", " + bicepscurlcount + ", " + shoulderpressweight + ", "
				+
				shoulderpresscount + ", " + abdominalweight + ", " + abdominalcount + ", " + legpressweight + ", " +
				legpresscount + ", '" + date + "', " + id + ")";

		return executeSql(sql); // 上記の情報をexecuteSqlに返す
	}

	public int update(String chestpressweight, String chestpresscount, String latpulldownweight,
			String latpulldowncount, String bicepscurlweight, String bicepscurlcount, String shoulderpressweight,
			String shoulderpresscount, String abdominalweight, String abdominalcount, String legpressweight,
			String legpresscount, String id, String date) {

		//	    String currentDate = getCurrentDateTime(); // 現在の日時を取得

		String sql = "UPDATE training SET " +
				"chestpressweight = '" + chestpressweight + "', " +
				"chestpresscount = '" + chestpresscount + "', " +
				"latpulldownweight = '" + latpulldownweight + "', " +
				"latpulldowncount = '" + latpulldowncount + "', " +
				"bicepscurlweight = '" + bicepscurlweight + "', " +
				"bicepscurlcount = '" + bicepscurlcount + "', " +
				"shoulderpressweight = '" + shoulderpressweight + "', " +
				"shoulderpresscount = '" + shoulderpresscount + "', " +
				"abdominalweight = '" + abdominalweight + "', " +
				"abdominalcount = '" + abdominalcount + "', " +
				"legpressweight = '" + legpressweight + "', " +
				"legpresscount = '" + legpresscount + "', " +
				"id = '" + id + "', " +
				"date = '" + currentDate + "' " + // 現在の日時をセット
				"WHERE date = '" + currentDate + "'" +
				"and id = '" + id + "'";

		return executeSql(sql);
	}

	public int calendarUpdate(String chestpressweight, String chestpresscount, String latpulldownweight,
			String latpulldowncount, String bicepscurlweight, String bicepscurlcount, String shoulderpressweight,
			String shoulderpresscount, String abdominalweight, String abdominalcount, String legpressweight,
			String legpresscount, String id, String date) {

		String sql = "UPDATE training SET " +
				"chestpressweight = '" + chestpressweight + "', " +
				"chestpresscount = '" + chestpresscount + "', " +
				"latpulldownweight = '" + latpulldownweight + "', " +
				"latpulldowncount = '" + latpulldowncount + "', " +
				"bicepscurlweight = '" + bicepscurlweight + "', " +
				"bicepscurlcount = '" + bicepscurlcount + "', " +
				"shoulderpressweight = '" + shoulderpressweight + "', " +
				"shoulderpresscount = '" + shoulderpresscount + "', " +
				"abdominalweight = '" + abdominalweight + "', " +
				"abdominalcount = '" + abdominalcount + "', " +
				"legpressweight = '" + legpressweight + "', " +
				"legpresscount = '" + legpresscount + "', " +
				"id = '" + id + "', " +
				"date = '" + date + "' " + // 現在の日時をセット
				"WHERE date = '" + date + "'" +
				"and id = '" + id + "'";

		return executeSql(sql);
	}

	// delete文
	public int delete(String date, String id) {
		String sql = "DELETE FROM training WHERE date = '" + currentDate + "' and id = " + id + "";
		return executeSql(sql);

	}

	public int calendarDelete(String date, String id) {
		String sql = "DELETE FROM training WHERE date = '" + date + "' and id = " + id + "";
		return executeSql(sql);

	}



	public int executeSql(String sql) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0; //resultをDBの更新件数が格納される変数
		try {
			connect();
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql); //更新系のSQL文を実行するためexecuteUpdateに変わっている。戻り値が更新件数、resultに格納される
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		disconnect();
		return result;
	}


	// カウント結果を取得するためのメソッドをtdaoクラスに追加
	public int getCount(String SQL) {
		Statement stmt = null;
		ResultSet rs = null;

		String sql = SQL;
		int count = 0;

		try {
			connect();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) { //rsの情報を一つずつ取出。
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close(); //rsとstmlをクローズ
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		disconnect(); //コネクションをクローズ
		return count; //オブジェクトを呼出元に返す
	}

	public int getGrossWeight(String SQL) {
		Statement stmt = null;
		ResultSet rs = null;

		String sql = SQL;
		int grossWeight = 0;

		try {
			connect();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) { //rsの情報を一つずつ取出。
				grossWeight = rs.getInt("grossWeight");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close(); //rsとstmlをクローズ
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		disconnect(); //コネクションをクローズ
		return grossWeight; 
	}


	public void disconnect() {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
