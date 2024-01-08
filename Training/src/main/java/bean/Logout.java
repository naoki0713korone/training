package bean;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {	//HttpServletの継承
	private static final long serialVersionUID = 1L;	//javaのシリアルバージョンUIDを取得する

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		//セッションスコープを破棄
		HttpSession session = request.getSession();	//session宣言
		session.invalidate();	//sessionの破棄
		
		
		//アプリケーションスコープからインスタンスを削除
		ServletContext application = this.getServletContext();
		application.removeAttribute("ub");
		application.removeAttribute("count");

		//ログアウト画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("logout.jsp");
		dispatcher.forward(request, response);
	}
}
