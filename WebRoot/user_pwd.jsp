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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<script language="JavaScript">
		function login11()
			{
				var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";        
              	var regu = "^[0-9a-zA-Z]+$"; 
             	var re = new RegExp(reg); 
				
				if (document.form2.oldpwd.value == ""  )  
				{
					alert("�����������!");
					document.form2.oldpwd.focus();
					return false;
				}
				if (document.form2.newpwd.value == ""  )  
				{
					alert("������������!");
					document.form2.newpwd.focus();
					return false;
				}
				if (document.form2.cnewpwd.value == ""  )  
				{
					alert("�������ظ�������!");
					document.form2.cnewpwd.focus();
					return false;
				}
				if (document.form2.cnewpwd.value !== document.form2.newpwd.value  )  
				{
					alert("�������벻һ��!");
					document.form2.cnewpwd.focus();
					return false;
				}
			}
</script>
<jsp:include flush="true" page="/client_session.jsp"/>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('���������!')</script><%
}
 %>
 <%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('�޸ĳɹ�!')</script><%
}
 %>  
  <body>
  
  <div align="center">
	<table border="0" width="1000" cellspacing="0" cellpadding="0" id="table1" >
		<tr>
			<td><jsp:include flush="true" page="/top.jsp" /></td>
		</tr>
		<tr>
			<td height="450" align="center">
			<form name="form1" action="servlet/UserPwdServlet" method="post" onSubmit="return check11()">
  <table border="1" width="60%" id="table2" cellspacing="0" cellpadding="0"  >
					<tr>
						<td colspan="2" align="center" height="35" style="font-family: ����_GB2312; font-size: 20px; ">
						�޸�����</td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">��&nbsp; ��&nbsp; 
						�룺</td>
						<td height="25">��<input class="input6" name="oldpwd" type="password"></td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">��&nbsp; ��&nbsp; 
						�룺</td>
						<td height="25">��<input class="input6" name="newpwd" type="password"></td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">�ظ������룺</td>
						<td height="25">��<input class="input6" name="cnewpwd" type="password"></td>
					</tr>
					<tr>
						<td height="35" align="center" colspan="2">
						<input type="submit" value="�޸�" style="color: #000080;"></td>
					</tr>
				</table>
		</form>
			</td>
		</tr>
		</table>
	</div>
  
  </body>
</html>