
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.LoginDTO;
import bean.UserBean;

public class LoginDAO {
	private final String URL = "jdbc:postgresql://localhost/academy"; //DBへの接続情報の定義
	private final String USER = "academy";
	private final String PASS = "kunren";
	private Connection con = null;

	
	public void connect() {	//コネクトメソッド定義DBとの接続のため使用
		try {	//例外処理のため

			con = DriverManager.getConnection(URL, USER, PASS);	//引数はstringで宣言されている。
		} catch (Exception e) {
			e.printStackTrace(); // エラーメッセージメソッド
		}
	}

	//DBへ全件検索をかけるためのselectメソッド
	public LoginDTO select(String SQL) {
		Statement stmt = null;	//Statement SQLにデータベースに送信するためのインターフェース
		ResultSet rs = null;	//dbからの結果を表すためのインターフェース。その結果をresultsetとして返す。
		LoginDTO ldto = new LoginDTO();		//LoginDTOのインスタンス生成

		String sql = SQL;	// --------------小文字のsqlを表現したい

		try {
			connect();	//コネクトメソッド実行
			stmt = con.createStatement();	//SQLステートメントをdbに送信するためのstatementオブジェクトを生成
			rs = stmt.executeQuery(sql);
			while (rs.next()) { //rsの情報を一つずつ取出。
				UserBean ub = new UserBean();	//UserBeanのインスタンス化

				ub.setId(rs.getString("id"));	//rsの情報をubに格納
				ub.setName(rs.getString("name"));
				ub.setPass(rs.getString("pass"));
				ub.setHeight(rs.getDouble("height"));
				ub.setWeight(rs.getDouble("weight"));
				ub.setBmi(rs.getDouble("bmi"));
				ub.setBodyType(rs.getString("bodyType"));
				ldto.add(ub);	//ubの情報をldtoに追加
			}
		} catch (Exception e) {	//例外処理
			e.printStackTrace();
		} finally {		//例外の有無にかかわらず必ず行いたい処理を書く
			try {
				if (rs != null)	//rsはnullではなかったらクローズ
					rs.close();
				if (stmt != null)	//stmtがnullではなかったらクローズ
					stmt.close(); //rsとstmlをクローズ
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		disconnect(); //コネクションをクローズ
		return ldto; //selectメソッドに返す
	}

	public int insert(String name, String pass, Double height, Double weight, Double bmi, String bodyType) {	//インサートメソッド定義

		String sql = "insert into profile(name, pass,height, weight, bmi, bodyType) values ('" + name + "', " + pass + "," + height
				+ "," + weight + "," + bmi + ",'" + bodyType + "')";	//受け取った値を格納

		return executeSql(sql);	//sql
	}
	
	
	
	
	
	
	
	public int update(String name, String pass, Double height, Double weight, Double bmi, String bodyType, String id) {	

		String sql =  "UPDATE profile SET name = '" + name + "', pass = '" + pass +"', height = " + height + ", weight = " + weight + ", bmi = " + bmi + ", bodyType = '" + bodyType + "' WHERE id = '" + id + "'";

		return executeSql(sql);	//sql
	
	}
	
	
	// delete文
	public int delete(String id) {
		String sql = "DELETE FROM profile WHERE id = " + id + "";
		return executeSql(sql);

	}
	
	//10.08追加分

	
	
	
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

	public void disconnect() {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
