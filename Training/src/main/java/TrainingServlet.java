
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CalendarBean;
import bean.CalendarLogic;
import bean.HealthCheckLogic;
import bean.LoginDTO;
import bean.TrainingDTO;
import bean.UserBean;





@WebServlet("/TrainingServlet")
public class TrainingServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		req.setCharacterEncoding("utf-8"); //受けとった値をutf-8で読む

		ServletContext application = this.getServletContext(); //アプリケーションスコープの宣言
		String btn = req.getParameter("btn"); //btnの値を取得
		TrainingDAO tdao = new TrainingDAO(); //DAOオブジェクト生成
		HttpSession session = req.getSession(); //セッションスコープの宣言

		//受け取った値のnullチェックを行う
		String chestpressweight = req.getParameter("chestpressweight");
		if (chestpressweight == null || chestpressweight.equals("")) {
			chestpressweight = "0";
		}

		String chestpresscount = req.getParameter("chestpresscount");
		if (chestpresscount == null || chestpresscount.equals("")) {
			chestpresscount = "0";
		}

		String latpulldownweight = req.getParameter("latpulldownweight");
		if (latpulldownweight == null || latpulldownweight.equals("")) {
			latpulldownweight = "0";
		}

		String latpulldowncount = req.getParameter("latpulldowncount");
		if (latpulldowncount == null || latpulldowncount.equals("")) {
			latpulldowncount = "0";
		}

		String bicepscurlweight = req.getParameter("bicepscurlweight");
		if (bicepscurlweight == null || bicepscurlweight.equals("")) {
			bicepscurlweight = "0";
		}

		String bicepscurlcount = req.getParameter("bicepscurlcount");
		if (bicepscurlcount == null || bicepscurlcount.equals("")) {
			bicepscurlcount = "0";
		}

		String shoulderpressweight = req.getParameter("shoulderpressweight");
		if (shoulderpressweight == null || shoulderpressweight.equals("")) {
			shoulderpressweight = "0";
		}

		String shoulderpresscount = req.getParameter("shoulderpresscount");
		if (shoulderpresscount == null || shoulderpresscount.equals("")) {
			shoulderpresscount = "0";
		}

		String abdominalweight = req.getParameter("abdominalweight");
		if (abdominalweight == null || abdominalweight.equals("")) {
			abdominalweight = "0";
		}

		String abdominalcount = req.getParameter("abdominalcount");
		if (abdominalcount == null || abdominalcount.equals("")) {
			abdominalcount = "0";
		}

		String legpressweight = req.getParameter("legpressweight");
		if (legpressweight == null || legpressweight.equals("")) {
			legpressweight = "0";
		}

		String legpresscount = req.getParameter("legpresscount");
		if (legpresscount == null || legpresscount.equals("")) {
			legpresscount = "0";
		}

		String date = req.getParameter("date");

		String id = req.getParameter("id");
		if (id == null || id.equals("")) {
			id = "0";
		}

		if (btn.equals("入力結果")) { //HTMLで押されたボタンが追加かならば

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			//DAOオブジェクトのインサートメソッド呼び出し。ここでDBに対し、insert intoが実行
			tdao.insert(chestpressweight, chestpresscount, latpulldownweight, latpulldowncount,
					bicepscurlweight,
					bicepscurlcount, shoulderpressweight, shoulderpresscount, abdominalweight, abdominalcount,
					legpressweight, legpresscount, date, id);

			//登録した値(日付とIDが合致するものを呼出)
			TrainingDTO tdto = tdao.select("select * from training\n"
					+ "  join profile on training.id = profile.id\n"
					+ "  where date = '" + date + "'\n"
					+ "   and training.id = " + id + "");

			//リクエストスコープに格納
			req.setAttribute("tdto", tdto);
			//JSPにフォワード
			RequestDispatcher rd = req.getRequestDispatcher("/TrainingResult.jsp");
			rd.forward(req, res);
		}

		if (btn.equals("修正")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			tdao.update(chestpressweight, chestpresscount, latpulldownweight, latpulldowncount,
					bicepscurlweight,
					bicepscurlcount, shoulderpressweight, shoulderpresscount, abdominalweight, abdominalcount,
					legpressweight, legpresscount, id, date);

			//本日の日付とIDが合致するモノの値を取得
			TrainingDTO tdto = tdao.select("select * from training\n"
					+ "  join profile on training.id = profile.id\n"
					+ "  where date = (SELECT CURRENT_DATE)"
					+ "   and training.id = " + id + "");

			req.setAttribute("tdto", tdto);
			//JSPにフォワード
			RequestDispatcher rd = req.getRequestDispatcher("/TrainingResult.jsp");
			rd.forward(req, res);
		}

		if (btn.equals("削除")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得
			//今日の日付とIDが合致するモノのみを対象
			tdao.delete(date, id);
			res.sendRedirect("/Training/Training.jsp");
		}

		if (btn.equals("本日の結果")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			//本日の日付とidが合致するものもみを表現
			TrainingDTO tdto = tdao.select("select * from training\n"
					+ "  join profile on training.id = profile.id\n"
					+ "  where date = (SELECT CURRENT_DATE)"
					+ "   and training.id = " + id + "");

			req.setAttribute("tdto", tdto);
			//JSPにフォワード
			RequestDispatcher rd = req.getRequestDispatcher("/TrainingResult.jsp");
			rd.forward(req, res);

		}

		if (btn.equals("グラフ")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			//今日の日付より七日前で、かつIDが合致するもののみを取得。
			TrainingDTO tdto = tdao
					.select("select * from training WHERE date >= CURRENT_DATE - INTERVAL '7 days' and id = " + id
							+ " ORDER BY date;");

			session.setAttribute("tdto", tdto);
			//勉強のためリダイレクト
			res.sendRedirect("/Training/JFreeChart.jsp");

		}

		if (btn.equals("カレンダー")) {

			res.sendRedirect("http://localhost:8080/Training/TrainingServlet");
		}

		if (btn.equals("クリックした日付")) {

			//カレンダーの押された日に値を取得
			String yearParam = req.getParameter("year");
			String monthParam = req.getParameter("month");
			String dateParam = req.getParameter("day");

			//年月日をdatevalueに(yyyy-mm-dd)の形で取得
			String dateValue = yearParam + "-" + monthParam + "-" + dateParam;

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			//クリックされた日付とidが合致するものを取得
			TrainingDTO tdto = tdao
					.select("select * from training where date = '" + dateValue + "' and id = " + id + "");

			session.setAttribute("tdto", tdto);
			res.sendRedirect("/Training/CalendarResult.jsp");

		}

		if (btn.equals("カレンダー修正")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			//DAOオブジェクトのインサートメソッド呼び出し。ここでDBに対し、insert intoが実行
			tdao.calendarUpdate(chestpressweight, chestpresscount, latpulldownweight, latpulldowncount,
					bicepscurlweight,
					bicepscurlcount, shoulderpressweight, shoulderpresscount, abdominalweight, abdominalcount,
					legpressweight, legpresscount, id, date);

			//			TrainingDTO tdto = new TrainingDTO();

			//日付とidが合致するものを取得
			TrainingDTO tdto = tdao.select("select * from training where date = '" + date + "' and id = " + id + "");

			session.setAttribute("tdto", tdto);

			res.sendRedirect("/Training/CalendarResult.jsp");

		}

		if (btn.equals("カレンダー削除")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得
			//日付とidが合致するものを取得
			tdao.calendarDelete(date, id);

			res.sendRedirect("/Training/Training.jsp");

		}

		if (btn.equals("ログイン")) {

			LoginDAO ldao = new LoginDAO();

			String userName = req.getParameter("name"); //入力された値
			String passWord = req.getParameter("pass"); //入力された値

			//profileの名前とパスワードの入力された値が一致するデータを取り出す
			LoginDTO ldto = ldao.select("select * from profile where name= '" + userName + "' and pass = " + passWord + "");
			//ldtoがnullでなく、ldtoの要素数が0より大きい場合は、
			if (ldto != null && ldto.size() > 0) {
				UserBean ub = ldto.get(0);

				//記入された名前とパスワードがdb内の名前やパスワードと合致するならアプリケーションスコープに格納
				if (userName.equals(ub.getName()) && passWord.equals(ub.getPass())) {

					application.setAttribute("ub", ub);

					ub = (UserBean) application.getAttribute("ub");
					id = ub.getId();

					//grossWeightメソッドを使用してトレーニングの総重量を表現している
					String grossWeight = Integer.toString(tdao.getGrossWeight(
							"select (sum(chestpressweight *chestpresscount)+sum(latpulldownweight*latpulldowncount)+\n"
									+ "sum(bicepscurlweight*bicepscurlcount)+sum(shoulderpressweight*shoulderpresscount)+\n"
									+ "sum(abdominalweight*abdominalcount)+sum(legpressweight*legpresscount)) as grossWeight\n"
									+ "from training where id = " + id + ""));

					session.setAttribute("grossWeight", grossWeight);

					//カウントを使用しidの合致する人の登録回数を表示
					String count = Integer
							.toString(tdao.getCount("SELECT COUNT(date) FROM training WHERE id = " + id + ""));

					application.setAttribute("count", count);
				}
				//JSPにフォワード
				RequestDispatcher rd = req.getRequestDispatcher("/Main.jsp");
				rd.forward(req, res);

			} else { //名前かつパスワードが合致しなければ元の画面に返す
				res.sendRedirect("/Training/index.jsp");
			}
		}

		if (btn.equals("ログイン登録")) {

			LoginDAO ldao = new LoginDAO(); //インスタンス化

			String name = req.getParameter("name");
			if (name == null || name.equals("")) {
				name = "ゲスト";
			}

			String pass = req.getParameter("pass");
			if (pass == null || pass.equals("")) {
				pass = "0000";

			}

			Double height = (Double.parseDouble(req.getParameter("height")));
			Double weight = (Double.parseDouble(req.getParameter("weight")));

			UserBean ub = new UserBean();

			ub.setName(name); //ubに値を格納
			ub.setPass(pass);
			ub.setHeight(height);
			ub.setWeight(weight);

			//健康診断を実行し結果を設定
			HealthCheckLogic healthCheckLogic = new HealthCheckLogic(); //インスタンス化
			healthCheckLogic.execute(ub);

			double bmi = ub.getBmi(); //インサートするためbmiに格納
			String bodyType = ub.getBodyType();

			ldao.insert(name, pass, height, weight, bmi, bodyType);

			req.setAttribute("ub", ub);

			//JSPにフォワード
			RequestDispatcher rd = req.getRequestDispatcher("/registerResult.jsp");
			rd.forward(req, res);

		}


		//10.08追加分




		if (btn.equals("プロフィール変更")) {



			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得

			LoginDAO ldao = new LoginDAO(); //インスタンス化

			

			String name = req.getParameter("name");
			if (name == null || name.equals("")) {
				name = "ゲスト";
			}

			String pass = req.getParameter("pass");
			if (pass == null || pass.equals("")) {
				pass = "0000";

			}

			Double height = (Double.parseDouble(req.getParameter("height")));
			Double weight = (Double.parseDouble(req.getParameter("weight")));



			ub.setName(name); //ubに値を格納
			ub.setPass(pass);
			ub.setHeight(height);
			ub.setWeight(weight);

			//健康診断を実行し結果を設定
			HealthCheckLogic healthCheckLogic = new HealthCheckLogic(); //インスタンス化
			healthCheckLogic.execute(ub);

			double bmi = ub.getBmi(); //インサートするためbmiに格納
			String bodyType = ub.getBodyType();
			

			ldao.update(name, pass, height, weight, bmi, bodyType, id);
			
			
			
			LoginDTO ldto = ldao.select("select * from profile where id = " + id + "");

			req.setAttribute("ldto", ldto);
			
			
			
			
			session.invalidate();
			
			application.removeAttribute("ub");
			application.removeAttribute("count");
			
			

			//JSPにフォワード
			RequestDispatcher rd = req.getRequestDispatcher("/ChangeResult.jsp");
			rd.forward(req, res);

		}
		
		
		if (btn.equals("プロフィール削除")) {

			UserBean ub = (UserBean) application.getAttribute("ub"); //アプリケーションスコープからインスタンスを取得
			id = ub.getId(); //idの値を取得
			LoginDAO ldao = new LoginDAO(); //インスタンス化
			//日付とidが合致するものを取得
			ldao.delete(id);
			
			
			
			
			session.invalidate();
			
			application.removeAttribute("ub");
			application.removeAttribute("count");

			res.sendRedirect("/Training/index.jsp");

		}


	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8"); //受け取った値の文字コードを取得

		//受け取った値を変数に入れる
		String s_year = request.getParameter("year");
		String s_month = request.getParameter("month");

		CalendarLogic logic = new CalendarLogic(); //logicインスタンス生成

		CalendarBean cb = null;

		if (s_year != null && s_month != null) { //変数の値が入っていれば条件式へ。

			int year = Integer.parseInt(s_year);
			int month = Integer.parseInt(s_month);

			//monthの値が0の場合は12を代入し、yearの値をデクリメント。
			if (month == 0) {
				month = 12;
				year--;
			}

			//monthの値が13の場合は月の値を1に設定し、yearの値をインクリメント
			if (month == 13) {
				month = 1;
				year++;
			}

			//年と月のクエリパラメーターが来ている場合にはその年月でカレンダーを生成する
			cb = logic.createMyCalendar(year, month);

		} else {
			//クエリパラメータが来ていないときは実行日時のカレンダーを生成する。
			cb = logic.createMyCalendar();
		}

		//リクエストスコープに格納
		request.setAttribute("cb", cb);

		//viewにフォワード
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/Calendar.jsp");
		rd.forward(request, response);
	}

}