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

import dao.InsertUpdateDelDao;
import util.Validate;

@WebServlet(urlPatterns = "/PwdNameUserServlet")
public class PwdNameUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String oldpwd = vd.getUnicode(request.getParameter("oldpwd"));
		String newpwd = vd.getUnicode(request.getParameter("newpwd"));
		String oldname = vd.getUnicode(request.getParameter("oldname"));
		String newname = vd.getUnicode(request.getParameter("newname"));
		String name = vd.getUnicode(request.getParameter("name"));
		String pwd = vd.getUnicode(request.getParameter("pwd"));
		String xpwd = vd.getUnicode(request.getParameter("xpwd"));
		String xname = vd.getUnicode(request.getParameter("xname"));
		String xuser = vd.getUnicode(request.getParameter("xuser"));
		String sql = "";
		String str ="";
		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		HttpSession session = request.getSession();
		ArrayList admin = (ArrayList)session.getAttribute("admin");
		String id = "";
		if(admin != null && !admin.equals("")){
			id = (String)admin.get(0);
		}

		if(xpwd != null && xpwd.equals("1")){
			sql = "update admin set pwd='"+newpwd+"' where id="+id;
			str = "/admin/modifypwd.jsp";
			if(!oldpwd.equals(admin.get(2))){
				request.setAttribute("error", "1");
			}else{
				ib.insertANDupdateANDdel(sql);
				request.setAttribute("ok", "1");
				admin.set(2, newpwd);
			}
		}
		if(xname != null && xname.equals("1")){
			sql = "update admin set name='"+newname+"' where id="+id;
			str = "/admin/modifyname.jsp";
			if(!oldname.equals(admin.get(1))){
				request.setAttribute("error", "1");
			}else{
				ib.insertANDupdateANDdel(sql);
				request.setAttribute("ok", "1");
				admin.set(1, newname);
			}
		}
		if(xuser != null && xuser.equals("1")){
			str = "/admin/adduser.jsp";
			sql = "insert into admin(name,pwd) values('"+name+"','"+pwd+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("error", "1");
			}else{
				request.setAttribute("ok", "1");
			}
		}
		RequestDispatcher rd=request.getRequestDispatcher(str);
		rd.forward(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
