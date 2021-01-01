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

<script language="JavaScript">
		function check11()
			{
				var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";        
              	var regu = "^[0-9a-zA-Z]+$"; 
             	var re = new RegExp(reg); 	
				if (document.form1.oldname.value == "" ) 
				{
					alert("请输入原用户名!");
					document.form1.oldname.focus();
					return false;
				}
				if (document.form1.newname.value == ""  )  
				{
					alert("请输入新用户名!");
					document.form1.newname.focus();
					return false;
				}
				if (document.form1.cnewname.value == ""  )  
				{
					alert("请输入重复新用户名!");
					document.form1.cnewname.focus();
					return false;
				}
				if (document.form1.cnewname.value != document.form1.newname.value  )  
				{
					alert("两次用户名不一致!");
					document.form1.cnewname.focus();
					return false;
				}				
				if (!re.test(document.form1.oldname.value))
              	{ 
                     alert("用户名必须是字母或数字");
                     document.form1.oldname.focus();
                     return false;
             	}
             					
				if (!re.test(document.form1.newname.value))
              	{ 
                     alert("用户名必须是字母或数字");
                     document.form1.newname.focus();
                     return false;
             	}
			}
</script>
  </head>
  <jsp:include flush="true" page="/admin/admin_session.jsp"/>
  
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('原用户名错误!')</script><%
}
 %>
 <%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('修改成功!')</script><%
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
			<form name="form1" action="${appPath}/PwdNameUserServlet?xname=1" method="post" onSubmit="return check11()">
  <table border="0" width="100%" align="center" background="${appPath}/img/MainBg.gif" height="494">
		<tr>
			<td valign="top" bgcolor="#E8E8E8">
			<table id="table2" style="width: 100%;  margin: 0; padding: 0" cellSpacing="1" cellPadding="0">
				<tbody style="margin: 0; padding: 0">
					<tr class="ry">
						<td class="pl" width="384" align="right">
						<span style="color: #874604">原 用 户 名：</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0" width="407" align="left">
						<input class="input6" type="text" name="oldname" size="20"></td>
					</tr>
					<tr class="rb">
						<td class="pl" width="384" align="right">
						<span style="color: #874604">新 用 户 名：</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0" width="407" align="left">
						<input class="input6" type="text" name="newname" size="20"></td>
					</tr>
					<tr class="ry">
						<td class="pl" width="384" align="right">
						<span style="color: #874604">重复新用户名：</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0" width="407" align="left">
						<input class="input6" type="text" name="cnewname" size="20"></td>
					</tr>
					<tr><td colspan="2" align="center"><input type="submit" value="修改"/></td></tr>
					</table>
			</td>
			
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