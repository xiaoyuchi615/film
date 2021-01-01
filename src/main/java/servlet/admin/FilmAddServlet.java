package servlet.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.InsertUpdateDelDao;

import smartupload.SmartFile;
import smartupload.SmartUpload;
import smartupload.SmartUploadException;
import util.Validate;

@WebServlet(urlPatterns = "/FilmAddServlet")
public class FilmAddServlet extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public FilmAddServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
	{
		this.config = config;
	}

	final public ServletConfig getServletConfig()
	{
		return config;
	}
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = "";
		String types = "";
		String ticket = "";
		String director = "";
		String player = "";
		String intro = "";
		String playurl = "";
		String path = "";
		String str = "";

		SmartUpload mySmartUpload = new SmartUpload();//init
		mySmartUpload.initialize(config,request,response);
		try {
			mySmartUpload.upload();
			name = mySmartUpload.getRequest().getParameter("name").trim();
			types = mySmartUpload.getRequest().getParameter("types").trim();
			ticket = mySmartUpload.getRequest().getParameter("ticket").trim();
			director = mySmartUpload.getRequest().getParameter("director").trim();
			player = mySmartUpload.getRequest().getParameter("player").trim();
			intro = mySmartUpload.getRequest().getParameter("intro").trim();
			playurl = mySmartUpload.getRequest().getParameter("playurl").trim();

			int count = 0;
			SmartFile file = mySmartUpload.getFiles().getFile(0);
			String fileExt = file.getFileExt();
			path="/filmimg";
			String sql = "";

			InsertUpdateDelDao ib = new InsertUpdateDelDao();
			if(playurl != null && !playurl.equals("")){
				sql = "insert into film(name,types,ticket,director,player,intro,imgpath,playurl)" +
				" values('"+name+"','"+types+"','"+ticket+"','"+director+"','"+player+"','"+intro+"','"+path.substring(1)+"/"+file.getFileName()+"','avi/"+playurl+"')";
			}else{
				sql = "insert into film(name,types,ticket,director,player,intro,imgpath)" +
					" values('"+name+"','"+types+"','"+ticket+"','"+director+"','"+player+"','"+intro+"','"+path.substring(1)+"/"+file.getFileName()+"')";
			}
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/film_add.jsp";
				request.setAttribute("error", "1");
			}else{
				str = "/admin/film_list.jsp";
				request.setAttribute("ok", "1");
				//count = mySmartUpload.save(path);
			}
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}

		RequestDispatcher rd=request.getRequestDispatcher(str);
        rd.forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
