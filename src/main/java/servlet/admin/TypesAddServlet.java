package servlet.admin;

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

@WebServlet(urlPatterns = "/TypesAddServlet")
public class TypesAddServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String name = vd.getUnicode(request.getParameter("name"));
		String str = "";
		String sql = "insert into types(name) values('"+name+"')";
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		int flag = ib.insertANDupdateANDdel(sql);
		if(flag == -1){
			str = "/admin/types_add.jsp";
			request.setAttribute("error", "1");
		}else{
			str = "/admin/types_list.jsp";
			request.setAttribute("ok", "1");
		}
		RequestDispatcher rd=request.getRequestDispatcher(str);
		rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
}
