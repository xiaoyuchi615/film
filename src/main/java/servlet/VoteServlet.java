package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InsertUpdateDelDao;
import util.Validate;

@WebServlet(urlPatterns = "/VoteServlet")
public class VoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String id = vd.getUnicode(request.getParameter("id"));
		String vote = vd.getUnicode(request.getParameter("vote"));
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		String sql = "";
		if(vote.equals("1")){
			sql = "update film set good=good+1 where id="+id;
		}
		if(vote.equals("2")){
			sql = "update film set midst=midst+1 where id="+id;
		}
		if(vote.equals("3")){
			sql = "update film set verybad=verybad+1 where id="+id;
		}
		ib.insertANDupdateANDdel(sql);
		response.sendRedirect("../filminfo.jsp?ok=1&id="+id);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
