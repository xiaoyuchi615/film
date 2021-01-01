package servlet;

import java.io.IOException;
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

@WebServlet(urlPatterns = "/DelServlet")
public class DelServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Validate vd = new Validate();
		String adminid = vd.getUnicode(request.getParameter("adminid"));
		String types = vd.getUnicode(request.getParameter("types"));
		String film = vd.getUnicode(request.getParameter("film"));
		String critique = vd.getUnicode(request.getParameter("critique"));
		String users = vd.getUnicode(request.getParameter("users"));

		InsertUpdateDelDao ib = new InsertUpdateDelDao();
		SelectDao sb = new SelectDao();

		String sql = "";
		String str = "";

		if(adminid != null && !adminid.equals("")){
			str = "/admin/adminuserlist.jsp";
			sql = "select * from admin";
			String[] args = {"id","name","pwd"};
			ArrayList al = sb.select(sql, args);
			if(al.size() == 1){
				request.setAttribute("error", "1");
			}else{
				sql = "delete from admin where id="+adminid;
				ib.insertANDupdateANDdel(sql);
			}
		}

		if(types != null && !types.equals("")){
			str = "/admin/types_list.jsp";
			sql = "select types from film where types="+"types";
			String[] args = {"types"};
			ArrayList al = sb.select(sql, args);
			if(al == null || al.size() == 0){
				sql = "delete from types where name="+"types";
				ib.insertANDupdateANDdel(sql);
			}else{
				request.setAttribute("error", "1");
			}
		}

		if(film != null && !film.equals("")){
			str = "/admin/film_list.jsp";
			sql = "select film from critique where film="+film;
			String[] args = {"film"};
			ArrayList al = sb.select(sql, args);
			if(al != null && al.size() != 0){
				request.setAttribute("error", "1");
			}else{
				sql = "delete from film where id="+film;
				ib.insertANDupdateANDdel(sql);
			}
		}

		if(critique != null && !critique.equals("")){
			str = "/admin/critique.jsp";
			sql = "delete from critique where id="+critique;
			ib.insertANDupdateANDdel(sql);
		}

		if(users != null && !users.equals("")){
			str = "/admin/users_list.jsp";
			sql = "select users from critique where users="+users;
			String[] args = {"users"};
			ArrayList al = sb.select(sql, args);
			if(al != null && al.size() != 0){
				request.setAttribute("error", "1");
			}else{
				sql = "delete from users where id="+users;
				ib.insertANDupdateANDdel(sql);
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher(str);
		rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
