package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SelectDao;
import util.Validate;

@WebServlet(urlPatterns = "/SearchServlet")
public class SearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String name = vd.getUnicode(request.getParameter("name"));
		String ticket = vd.getUnicode(request.getParameter("ticket"));
		String types = vd.getUnicode(request.getParameter("types"));
		SelectDao sb = new SelectDao();
		String sql = "select * from film ";
		String[] args = {"id","name","types","ticket","director","player","intro","imgpath","playurl","good","midst","verybad"};
		if(name != null && !name.equals("")){
			sql += "where name like '%"+name+"%'";
		}
		if(ticket != null && !ticket.equals("")){
			sql += "where ticket like '%"+ticket+"%'";
		}
		if(types != null && !types.equals("")){
			sql += "where types='"+types+"'";
		}
		ArrayList al = sb.select(sql, args);
		request.setAttribute("films", al);
		RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
        rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}
