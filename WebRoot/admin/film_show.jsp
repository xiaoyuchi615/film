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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${appPath}/img/lucfron.css">

<script language="JavaScript">
		function check11()
			{
				var fileext=form1.filepath.value.substring(form1.filepath.value.length-4,form1.filepath.value.length);
             	fileext=fileext.toLowerCase(); 
				if (document.form1.name.value == "" ) 
				{
					alert("������ӰƬ����!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.ticket.value == ""  )  
				{
					alert("������ӰƬƱ��!");
					document.form1.ticket.focus();
					return false;
				}
				if (document.form1.director.value == ""  )  
				{
					alert("������ӰƬ����!");
					document.form1.director.focus();
					return false;
				}
				if (document.form1.player.value == ""  )  
				{
					alert("������ӰƬ��Ա!");
					document.form1.player.focus();
					return false;
				}
				if (document.form1.intro.value == ""  )  
				{
					alert("������ӰƬ���!");
					document.form1.intro.focus();
					return false;
				}
				if (document.form1.filepath.value == "" ) 
				{
					alert("ӰƬͼƬ����Ϊ��!");
					document.form1.filepath.focus();
					return false;
				}
				if(!(fileext=='.jpg') && !(fileext=='.gif')) 
				{
					alert("�Բ���ͼƬ��ʽ����,����Ϊjpg��gif��ʽ!"); 
					form1.filepath.focus(); 
					return false; 
				}
			}
</script>	
  </head>
  <jsp:include flush="true" page="/admin/admin_session.jsp"/>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('�û������ظ�!')</script><%
}
 %>
 <%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('��ӳɹ�!')</script><%
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
					<td width="103" bgcolor="#d7d7d7">��</td>
					<td background="${appPath}/img/bl2bg.gif" width="9">��</td>
				</tr>
			</table>
			</td>
			<td align="center" width="800" height="500" valign="top">
			<jsp:include flush="true" page="/servlet/ListServlet" />
			<%
			ArrayList film = (ArrayList)request.getAttribute("film");
			String id = request.getParameter("id");
			ArrayList alRow = null;
			for(int i = 0;i < film.size();i++){
				alRow = (ArrayList)film.get(i);
				if(alRow.get(0).equals(id)){
					break;
				}
			}
			 %>
			<form name="form1" action="${appPath}/FilmAddServlet" method="post" onSubmit="return check11()" enctype="multipart/form-data">
			<table border="1" width="100%" cellspacing="1" bgcolor="#E8E8E8" style="border-collapse: collapse" bordercolor="#C0C0C0">
				<tr>
					<td height="30" colspan="2" align="center">ӰƬ��ϸ��Ϣ</td>
				</tr>
				<tr>
					<td height="30" align="center" width="100%" colspan="2">
					<img src="<%=alRow.get(7) %>" border="0" width="100" height="120"/>
					</td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">ӰƬ���ƣ�</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(1) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">ӰƬ���ͣ�</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(2) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">ӰƬƱ����</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(3) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">ӰƬ���ݣ�</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(4) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">ӰƬ��Ա��</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(5) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">ӰƬ��飺</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(6) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">����·����</td>
					<td height="30" width="52%">&nbsp;<%=alRow.get(8) %></td>
				</tr>
				<tr>
					<td height="30" align="right" width="48%">����Ʊ����</td>
					<td height="30" width="52%">&nbsp;��<%=alRow.get(9) %>Ʊ&nbsp;&nbsp;��<%=alRow.get(10) %>Ʊ&nbsp;&nbsp;��<%=alRow.get(11) %>Ʊ</td>
				</tr>
			</table>
			</form>
			</td>
			<td align="center">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
				<tr>
					<td background="${appPath}/img/br2bg.gif" width="9">��</td>
					<td width="103" bgcolor="#d7d7d7">��</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>