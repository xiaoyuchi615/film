<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../app.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${appPath}/img/lucfron.css">
	

  </head>
  <jsp:include flush="true" page="/admin/admin_session.jsp"/>
  
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('最后一个用户不能删除!')</script><%
}
%>
  <body topmargin="0">
	<div align="center">
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
				<tr>
					<td background="${appPath}/img/tlbg.gif" width="103"></td>
					<td background="${appPath}/img/tl2bg.gif" width="9"></td>
				</tr>
				<tr height="1">
					<td width="103"></td>
					<td background="${appPath}/img/ml2bg.gif" width="9"></td>
				</tr>
				<tr height="14">
					<td width="103" bgcolor="#d7d7d7"></td>
					<td background="${appPath}/img/bl2bg.gif" width="9"></td>
				</tr>
			</table>
			</td>
			<td align="center" width="800" height="100">
			<jsp:include flush="true" page="/admin/top.jsp" />
			</td>
			<td align="center">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
				<tr>
					<td background="${appPath}/img/tr2bg.gif" width="9"></td>
					<td background="${appPath}/img/tlbg.gif" width="103"></td>
				</tr>
				<tr height="1">
					<td background="${appPath}/img/mr2bg.gif" width="9"></td>
					<td width="103"></td>
				</tr>
				<tr height="14">
					<td background="${appPath}/img/br2bg.gif" width="9"></td>
					<td width="103" bgcolor="#d7d7d7"></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td align="center">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
				<tr>
					<td width="103" bgcolor="#d7d7d7">　</td>
					<td background="${appPath}/img/bl2bg.gif" width="9">　</td>
				</tr>
			</table>
			</td>
			<td align="center" width="800" height="500" valign="top" bgcolor="#E8E8E8">
			<jsp:include flush="true" page="/servlet/ListServlet"/>
			<table border="0" width="100%" id="table1" ><tbody style="margin: 0; padding: 0">
				<tr>
					<td align="center">管理员ID</td>
					<td align="center">用户名</td>
					<td align="center">密码</td>
					<td align="center">　</td>
				</tr>
				<%
				ArrayList books = (ArrayList)request.getAttribute("admin");
				for(int i = 0;i < books.size();i++){
					ArrayList alRow = (ArrayList)books.get(i);
				 %>
				<tr>
					<td align="center" height="20"><%=alRow.get(0) %></td>
					<td align="center" height="20"><%=alRow.get(1) %></td>
					<td align="center" height="20"><%=alRow.get(2) %></td>
					<td align="center" height="20"><a class="linkbody" href="${appPath}/DelServlet?adminid=<%=alRow.get(0) %>">删除</a></td>
				</tr>
				<%} %>
			</table>
			</td>
			<td align="center">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
				<tr>
					<td background="${appPath}/img/br2bg.gif" width="9">　</td>
					<td width="103" bgcolor="#d7d7d7">　</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>