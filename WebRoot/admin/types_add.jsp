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
				var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";        
              	var regu = "^[0-9a-zA-Z]+$"; 
             	var re = new RegExp(reg); 
				if (document.form1.name.value == "" ) 
				{
					alert("请输入类型名称!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.pwd.value == ""  )  
				{
					alert("请输入密码!");
					document.form1.pwd.focus();
					return false;
				}
				if (document.form1.cpwd.value == ""  )  
				{
					alert("请输入重复密码!");
					document.form1.cpwd.focus();
					return false;
				}
				if (document.form1.cpwd.value != document.form1.pwd.value  )  
				{
					alert("两次密码不一致!");
					document.form1.cpwd.focus();
					return false;
				}				
				if (!re.test(document.form1.name.value))
              	{ 
                     alert("用户名必须是字母或数字");
                     document.form1.name.focus();
                     return false;
             	}             					
				if (!re.test(document.form1.pwd.value))
              	{ 
                     alert("密码必须是字母或数字");
                     document.form1.pwd.focus();
                     return false;
             	}
			}
</script>	
  </head>
  <jsp:include flush="true" page="/admin/admin_session.jsp"/>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('类型名称重复!')</script><%
}
 %>
 <%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('添加成功!')</script><%
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
			<td align="center" width="800" height="500" valign="top">
			<form name="form1" action="${appPath}/TypesAddServlet" method="post" onSubmit="return check11()">
			<table border="1" width="100%" cellspacing="1" bgcolor="#E8E8E8" style="border-collapse: collapse" bordercolor="#C0C0C0">
		<tr>
			<td height="30" colspan="2" align="center">添加影片类型</td>
		</tr>
		<tr>
			<td height="30" align="right" width="48%">类型名称：</td>
			<td height="30" width="52%">&nbsp;<input class="input7" type="text" name="name" size="20"></td>
		</tr>
		<tr>
			<td height="30" colspan="2" align="center">
			<input type="submit" value="添加"></td>
		</tr>
	</table>
			</form>
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