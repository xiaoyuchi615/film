package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SelectDao;
import util.Validate;

@WebServlet(urlPatterns = "/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String name = vd.getUnicode(request.getParameter("name"));
		String pwd = vd.getUnicode(request.getParameter("pwd"));
		String str = "";
		
		SelectDao sb = new SelectDao();
		String sql = "select * from users where name='"+name+"' and pwd='"+pwd+"'";
		String[] args = {"id","name","pwd","petname","sex"};
		ArrayList login = sb.select(args, sql);
		
		if(login != null && login.size() != 0){
			//将登陆用户名保存到session中
			str = "/index.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			request.setAttribute("ok", "1");
		}else{
			str = "/login.jsp";
			request.setAttribute("error", "1");
		}

		RequestDispatcher rd=request.getRequestDispatcher(str);
		rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
