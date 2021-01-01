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

import dao.InsertUpdateDelDao;
import util.Validate;

@WebServlet(urlPatterns = "/UserPwdServlet")
public class UserPwdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String oldpwd = vd.getUnicode(request.getParameter("oldpwd"));
		String newpwd = vd.getUnicode(request.getParameter("newpwd"));
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		HttpSession session = request.getSession();
		ArrayList login = (ArrayList)session.getAttribute("login");
		if(!login.get(2).equals(oldpwd)){
			request.setAttribute("error", "1");
		}else{
			String sql = "update users set pwd='"+newpwd+"' where id='"+login.get(0)+"'";
			ib.insertANDupdateANDdel(sql);
			login.set(2, newpwd);
			request.setAttribute("ok", "1");
		}
		RequestDispatcher rd=request.getRequestDispatcher("/user_pwd.jsp");
        rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
