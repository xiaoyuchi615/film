package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InsertUpdateDelDao;
import dao.SelectDao;
import util.Validate;

@WebServlet(urlPatterns = "/RegServlet")
public class RegServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String name = vd.getUnicode(request.getParameter("name"));
		String pwd = vd.getUnicode(request.getParameter("pwd"));
		String petname = vd.getUnicode(request.getParameter("petname"));
		String sex = vd.getUnicode(request.getParameter("sex"));
		//String str = "";
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		SelectDao sb = new SelectDao();

		PrintWriter writer = response.getWriter();

		String sql1 = "select name from users where name='"+name+"'";
		String[] args = {"name"};
		ArrayList al = sb.select(args, sql1);

		if(al!=null && al.size()!=0){
			writer.write("Error");
		}else{
			String sql = "insert into users(name,pwd,petname,sex) values('"+name+"','"+pwd+"','"+petname+"','"+sex+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				writer.write("Error");
			}else{
				writer.write("ok");
			}
		}
		writer.flush();
		writer.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
