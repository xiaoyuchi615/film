<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	
	<link rel="stylesheet" type="text/css" href="img/lucfron.css">
	
  </head>
  
  <body topmargin="0" leftmargin="0" rightmargin="0">
  
  <div align="center" >
  
  <table border="0" width="1000" cellspacing="0" cellpadding="0" id="table1" bgcolor="#dcdcdc"  >
	<tr>
		<td height="85" width="250"><img border="0" src="img/logo.jpg" width="400" height="100"></td>
		<td ><img border="0" src="img/AD.gif" width="850" height="100"></td>
	</tr>
	<tr>
		<td colspan="2" height="38"  align="center">
		<table border="0" width="80%" cellspacing="0" cellpadding="0" id="table2" >
			<tr>
				<td align="center"><a class="linktop" href="index.jsp">Ӱ����ҳ</a></td>
				<td align="center"><a class="linktop" href="new.jsp">����Ӱ��</a></td>
				<td align="center"><a class="linktop" href="type.jsp">ȫ�����</a></td>
				<td align="center"><a class="linktop" href="search.jsp">����ӰƬ</a></td>
				<td align="center"><a class="linktop" href="reg.jsp">ע���Ա</a></td>
				<td align="center"><a class="linktop" href="login.jsp">��¼��Ա</a></td>
				<td align="center"><a class="linktop" href="user_pwd.jsp">�޸�����</a></td>
				<td align="center"><a class="linktop" href="admin/index.jsp">����Ա��½</a></td>
				<td align="center"><a class="linktop" href="servlet/RemoveServlet?login=1">ע���˳�</a></td>

			</tr>
		</table>
		</td>
	</tr>
	</table>
  
  </div>
  </body>

</html>