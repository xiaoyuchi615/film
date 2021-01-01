package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class PageFilter implements Filter {
    private String loginPage="login.jsp";

    //需要定义系统页面访问中可放行的连接
    private List<String> list = new ArrayList<String>();
    public void init(FilterConfig arg0) throws ServletException {
        list.add("/index.jsp");
        list.add("/login.jsp");
        list.add("/reg.jsp");
        list.add("/admin/index.jsp");     //定义不被拦截的页面
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //1、获取页面中的访问的路径连接
        String path = request.getServletPath();
        if(list!=null && list.contains(path)){
            //如果页面中获取的访问连接于定义的可放行的连接一致，则放行
            chain.doFilter(request, response);
            return;
        }
        //2、从session(globle_user)对象中获取当前登录的用户
        HttpSession session=((HttpServletRequest) request).getSession();
        //获取请求资源路径
        String requestPath=((HttpServletRequest) request).getServletPath();
        if(session.getAttribute("login")!=null){
            //如果从session中获取的用户对象不为空，则放行
            chain.doFilter(request, response);
            return;
        }
        //如果不满足条件1和2，则不能放行，回到系统的登录页面
        response.sendRedirect(request.getContextPath()+"/");
    }

    public void destroy() {

    }
}


