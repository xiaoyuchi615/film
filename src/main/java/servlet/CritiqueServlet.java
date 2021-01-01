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

@WebServlet(urlPatterns = "/CritiqueServlet")
public class CritiqueServlet extends HttpServlet {
//评论
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String id = vd.getUnicode(request.getParameter("id"));
		String title = vd.getUnicode(request.getParameter("title"));
		String content = vd.getUnicode(request.getParameter("content"));
		HttpSession session = request.getSession();
		ArrayList login = (ArrayList)session.getAttribute("login");
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		String sql = "insert into critique(film,users,title,content) values('"+id+"','"+login.get(0)+"','"+title+"','"+content+"')";
		int flag = ib.insertANDupdateANDdel(sql);
		if(flag == -1){
			request.setAttribute("error", "1");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/filminfo.jsp");
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
