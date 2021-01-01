<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
<%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('登录成功!')</script><%
}
%>  
  <body>
  
  <div align="center">
	<table border="0" width="1000" cellspacing="0" cellpadding="0" id="table1" >
		<tr>
			<td colspan="2"><jsp:include flush="true" page="/top.jsp" /></td>
		</tr>
		<tr>
			<td>
				<img border="0" src="img/3.jpg" width="650" height="200">
			</td>
			<td>
				<img border="0" src="img/4.jpg" width="600" height="200">
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<jsp:include flush="true" page="/servlet/ListServlet" />
		<tr id="div1">
			<td colspan="2">
			<%
				  ArrayList film = (ArrayList)request.getAttribute("newfilm");
                  int tem = 0;
				  int x = 0;
				  if(film.size()%4 == 0){
				  	tem = film.size()/4;
				  }else{
				  	tem = film.size()/4+1;
				  }
				  for(int n = 1;n <= tem;n++){ 
					 %>
					<table cellspacing="0" cellpadding="3" width="100%" border="0">
                      <tr>
                        <%
                for(int i = n*4-4;i < film.size();i++){
                      ArrayList alRow = (ArrayList)film.get(i);
                  %>
                        <td align="middle" width="590">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td rowspan="4" align="center" valign="middle">
                              <a href="filminfo.jsp?id=<%=alRow.get(0) %>"><img src="<%=alRow.get(7) %>" border="0" width="120" height="160"/></a></td>
                              <td>&nbsp;片名：<%=alRow.get(1) %></td>
                            </tr>
                            <tr>
                              <td>&nbsp;类型：<%=alRow.get(2) %></td>
                            </tr>
                            <tr>
                              <td>&nbsp;票房：<%=alRow.get(3) %></td>
                            </tr>
                            <tr>
                              <td>&nbsp;导演：<%=alRow.get(4) %></td>
                            </tr>
                          </table><br></td>
                        <%
                        	x++;
						 	if(x == 4){
						 	x = 0;
						 	break;
						 	}
                        }
                        %>
                      </tr>
                    </table>
                    <%} %>
			</td>
		</tr>
		</table>
	</div>
  
  </body>
</html>
