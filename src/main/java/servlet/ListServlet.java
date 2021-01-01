package servlet;

import java.io.IOException;
import java.util.ArrayList;
import dao.SelectDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/ListServlet")
public class ListServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SelectDao sb = new SelectDao();
		
		String sql1 = "select * from admin";
		String[] args1 = {"id","name","pwd"};
		ArrayList al1 = sb.select(sql1, args1);
		request.setAttribute("admin", al1);
		
		String sql2 = "select * from film";
		String[] args2 = {"id","name","types","ticket","director","player","intro","imgpath","playurl","good","midst","verybad"};
		ArrayList al2 = sb.select(sql2, args2);
		request.setAttribute("film", al2);
		
		String sql3 = "select * from types";
		String[] args3 = {"id","name"};
		ArrayList al3 = sb.select(sql3, args3);
		request.setAttribute("types", al3);
		
		String sql4 = "select * from users";
		String[] args4 = {"id","name","pwd","petname","sex"};
		ArrayList al4 = sb.select(sql4, args4);
		request.setAttribute("users", al4);
		
		String sql5 = "select * from critique";
		String[] args5 = {"id","film","users","title","content","times"};
		ArrayList al5 = sb.select(sql5, args5);
		request.setAttribute("critique", al5);
		
		String sql6 = "select top 20 * from film order by id desc";
		String[] args6 = {"id","name","types","ticket","director","player","intro","imgpath","playurl","good","midst","verybad"};
		ArrayList al6 = sb.select(sql6, args6);
		request.setAttribute("newfilm", al6);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}
