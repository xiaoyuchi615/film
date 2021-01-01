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
    
    <title>影视信息平台-管理员登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${appPath}/img/lucfron.css">
	<script language="JavaScript" src="${appPath}/img/RongHuaKey.js"></script>
	  <script language="JavaScript">
		function login11()
			{
				var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";        
              	var regu = "^[0-9a-zA-Z]+$"; 
             	var re = new RegExp(reg); 
				if (document.form1.name.value == "" ) 
				{
					alert("请输入管理员名!");
					document.form1.name.focus();
					return false;
				}
				if (!re.test(document.form1.name.value))
              	{ 
                       alert("管理员名必须是字母或数字");
                       return false;
             	}
				if (document.form1.pwd.value == ""  )  
				{
					alert("请输入密码!");
					document.form1.pwd.focus();
					return false;
				}
				if (!re.test(document.form1.pwd.value)) 
				{
					alert("密码必须是字母或数字!");
					document.form1.pwd.focus();
					return false;
				}
			}
</script>
  </head>
<%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('管理员名或密码错误!')</script><%
}
%> 
  <body  topmargin="0" leftmargin="0" rightmargin="0"  background="img/bg.jpg"  >

  <form action="${appPath}/AdminLoginServlet" name="form1" method="post" onsubmit="return login11()">
  <table border="0" width="100%" height="70%" cellspacing="0" cellpadding="0" >
		<tr>
			<td align="center" >
			<table  border="0" width="499" cellspacing="0" cellpadding="0" style="border-style: solid; border-width: 0px">
			
			<tr>
				<td height="2"  align="center">
				<table  border="0" width="481" cellspacing="0" cellpadding="0" height="100%" id="table1">
					<tr>
						<td height="10">　</td>
					</tr>
					<tr>
						<td height="56" align="center" class="hightext">欢迎登录</td>
					</tr>
					<tr>
						<td height="106">
						<table border="0" width="100%" id="table2" height="70px">
							<tr>
								<td ><h3>&nbsp; 管理员名：</h3></td>
								<td><h3>&nbsp; 密&nbsp; 码：　</h3></td>
							</tr>
							<tr>
								<td>&nbsp;<input style="background-color:transparent" class="input6" type="text" name="name" id="userid" size="12px"></td>
								<td>&nbsp;<input style="background-color:transparent" class="input6" type="password" size="12px"  name="pwd" ></td>
								<td rowspan="2" width="80"><input type="image" name="imageField" src="img/denglu.png" style="width:80px; height:25px;" align="right"/></td>
							</tr>
						</table>

						</td>
					<tr >
						<td width="100px" align="right"><a href="index.jsp" style="">返回用户界面</a></td>
					</tr>
					</tr>
					<tr>
						<td>　</td>
					</tr>
					<tr>
						<td>　</td>
					</tr>
				</table>
				</td>
			</tr>
			</table>
			</td>
		</tr>
		</table>

		</form>
  </body>
</html>