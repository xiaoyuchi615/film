package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/RemoveServlet")
public class RemoveServlet extends HttpServlet {
//退出登录
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("login");
		String admin = request.getParameter("admin");
		String str ="";
		HttpSession session = request.getSession();
		if(login != null && !login.equals("")){
			session.removeAttribute("login");
			str = "/login.jsp";
		}
		if(admin != null && !admin.equals("")){
			session.removeAttribute("admin");
			str = "/admin/index.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(str);
		rd.forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
