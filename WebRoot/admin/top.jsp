<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../app.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <base href="<%=basePath%>">
    
    <title>Ӱ����Ϣƽ̨</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="${appPath}/img/lucfron.css">
		
  </head>
  <body topmargin="0" bgcolor="#EAEAEA">
  <div align="center">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%" id="table1">
				<tr>
					<td align="center">					
					<table border="0" width="798" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="100%" id="table3">
						<tr>
							<td align="center" style="font-family: ��Բ; font-size: 45px; color: #000080; font-style: italic; font-weight: bold; letter-spacing: 20pt">
							Ӱ����Ϣƽ̨</td>
						</tr>
					</table>					
					</td>
				</tr>
				<tr>
					<td height="30" align="center" background="${appPath}/img/ahjj_03.jpg">
						<a class="linkbody" href="admin/critique.jsp">���۹���</a>&nbsp;
						<a class="linkbody" href="admin/types_list.jsp">ӰƬ���͹���</a>&nbsp;
						<a class="linkbody" href="admin/film_list.jsp">ӰƬ����</a>&nbsp;
						<a class="linkbody" href="admin/users_list.jsp">ע���û�����</a>&nbsp;
						<a class="linkbody" href="admin/modifypwd.jsp">�޸Ĺ���Ա����</a>&nbsp;
						<a class="linkbody" href="admin/modifyname.jsp">�޸Ĺ���Ա�û���</a>&nbsp;
						<a class="linkbody" href="admin/adduser.jsp">���ϵͳ����Ա</a>&nbsp;
						<a class="linkbody" href="admin/adminuserlist.jsp">ɾ��ϵͳ����Ա</a>&nbsp;
						<a class="linkbody" href="${appPath}/RemoveServlet?admin=1">ע���˳�</a>
					</td>
				</tr>
			</table>
	</div>
  </body>
</html>