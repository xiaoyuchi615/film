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
	  <script src="js/jquery-1.3.2.min.js" type="text/javascript" ></script>

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
				if (document.form1.name.value == "" )
				{
					alert("请输入用户名!");
					document.form1.name.focus();
					return false;
				}
				if (!re.test(document.form1.name.value))
              	{
                       alert("用户名必须是字母或数字");
                       return false;
             	}
				if (document.form1.pwd.value == "" )
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
				if (document.form1.repeatpwd.value == "" )
				{
					alert("请输入重复密码!");
					document.form1.repeatpwd.focus();
					return false;
				}
				if (document.form1.repeatpwd.value != document.form1.pwd.value)
				{
					alert("两次密码不一致!");
					document.form1.repeatpwd.focus();
					return false;
				}
				if (document.form1.petname.value == ""  )
				{
					alert("请输入昵称!");
					document.form1.petname.focus();
					return false;
				}

				$.ajax({
					type: 'get',
					url: 'RegServlet',
					data: {
						'name': $("#name").val(),
						'pwd':$("#pwd").val(),
						'repeatpwd':$("#repeatpwd").val(),
						'petname':$("#petname").val(),
						'sex':$("#sex1").val
					},
					dataType: "text",
					success: function (data) {
						if (data == "ok") {
							window.location.href = "login.jsp";
						} else {
							$("#name").val("已存在");
							$("#name").focus().select();
							window.location.href = "reg.jsp";
						}
					}
				});

			}
			function check22()
			{
				var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";
              	var regu = "^[0-9a-zA-Z]+$";
             	var re = new RegExp(reg);
				if (document.form1.name.value == "" )
				{
					alert("请输入用户名!");
					document.form1.name.focus();
					return false;
				}
				if (!re.test(document.form1.name.value))
              	{
                       alert("用户名必须是字母或数字");
                       return false;
             	}
             	else
             	{
             		form1.action="servlet/RegServlet?temp=1";
             		form1.submit();
             	}
			}
  </script>

  <body class="q q q q q q" background="img/bg.jpg">
  <div align="center">
	<table border="0" width="1000" cellspacing="0" cellpadding="0" id="table1" >
		<tr>
			<td><jsp:include flush="true" page="/top.jsp" /></td>
		</tr>
		<tr>
			<td height="450">
			<form  method="post" name="form1">
			<br>
				<div align="center">
				<table border="1" width="60%" id="table2" cellspacing="0" cellpadding="0" style="border-style: solid; border-width: 1px"  >
					<tr>
						<td colspan="2" align="center" height="35" style="font-family: 楷体_GB2312; font-size: 20px;" >
						用户注册</td>
					</tr>
					<%
					String name = (String)request.getAttribute("name");
					if(name == null){
						name = "";
					}
					 %>
					<tr>
						<td height="25" align="right" width="50%">用 户 名：</td>
						<td height="25"><input style="background-color:transparent" class="input6" name="name" id="name" type="text" value="<%=name %>">
						</td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">密&nbsp;&nbsp;&nbsp;码：</td>
						<td height="25">　<input style="background-color:transparent" class="input6" name="pwd" id="pwd" type="password"></td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">重复密码：</td>
						<td height="25">　<input style="background-color:transparent" class="input6" name="repeatpwd" id="repeatpwd" type="password"></td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">昵&nbsp;&nbsp;&nbsp;称：</td>
						<td height="25">　<input style="background-color:transparent" class="input6" name="petname" id="petname" type="text"></td>
					</tr>
					<tr>
						<td height="25" align="right" width="50%">性&nbsp;&nbsp;&nbsp;别：</td>
						<td height="25">
						&nbsp;&nbsp;&nbsp;&nbsp;<input style="background-color:transparent" type="radio" name="sex" id="sex1" checked value="男">男&nbsp;&nbsp;&nbsp;&nbsp;
							<input style="background-color:transparent" type="radio" name="sex" id="sex2" value="女">女</td>
					</tr>
					<tr>
						<td height="35" align="center" colspan="2">
						<input style="background-color:transparent"  onclick="login11()" type="button" value="注册" ></td>
					</tr>
				</table>
				</div>
				</form>
			</td>
		</tr>
		</table>
	</div>

  </body>
</html>
