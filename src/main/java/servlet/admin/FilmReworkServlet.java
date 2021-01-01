package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InsertUpdateDelDao;
import util.Validate;

@WebServlet(urlPatterns = "/FilmReworkServlet")
public class FilmReworkServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String id = vd.getUnicode(request.getParameter("id"));
		String name = vd.getUnicode(request.getParameter("name"));
		String types = vd.getUnicode(request.getParameter("types"));
		String ticket = vd.getUnicode(request.getParameter("ticket"));
		String director = vd.getUnicode(request.getParameter("director"));
		String player = vd.getUnicode(request.getParameter("player"));
		String intro = vd.getUnicode(request.getParameter("intro"));
		String sql = "update film set name='"+name+"',types='"+types+"',ticket='"+ticket+"',director='"+director+"',player='"+player+"',intro='"+intro+"' where id="+id;
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		int flag = ib.insertANDupdateANDdel(sql);
		if(flag == -1){
			response.sendRedirect("../admin/film_rework.jsp?error=1&id="+id);
		}else{
			response.sendRedirect("../admin/film_rework.jsp?ok=1&id="+id);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
