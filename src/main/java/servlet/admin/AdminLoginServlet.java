package servlet.admin;

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

@WebServlet(urlPatterns = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String name = vd.getUnicode(request.getParameter("name"));
		String pwd = vd.getUnicode(request.getParameter("pwd"));
		String str = "";
		
		SelectDao sb = new SelectDao();
		String sql = "select * from admin where name='"+name+"' and pwd='"+pwd+"'";
		String[] args = {"id","name","pwd"};
		ArrayList admin = sb.select(args, sql);
		
		if(admin != null && admin.size() != 0){
			str = "/admin/modifypwd.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
		}else{
			str = "/admin/index.jsp";
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
