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
 <script language="JavaScript">
		function check11(id)
			{
				form1.action="servlet/VoteServlet?id="+id;
				form1.submit();
			}
			function check22(id)
			{
				var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";        
              	var regu = "^[0-9a-zA-Z]+$"; 
             	var re = new RegExp(reg); 
             	var str = document.form1.content.toString;
				if (document.form1.title.value == "" ) 
				{
					alert("请输入标题!");
					document.form1.title.focus();
					return false;
				}
				if (document.form1.content.value == ""  )  
				{
					alert("请输入内容!");
					document.form1.content.focus();
					return false;
				}
				else
				{
					form1.action="servlet/CritiqueServlet?id="+id;
					form1.submit();
				}
			}
function openwin(pagename)
{
	window.open (pagename,'go', 'height=400, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no')
}
</script>
 <jsp:include flush="true" page="/client_session.jsp"/>
 <%
String ok = request.getParameter("ok");
if(ok != null && ok.equals("1")){
%><script>alert('投票成功!')</script><%
}
 %>
  <%
String error = request.getParameter("error");
if(error != null && error.equals("1")){
%><script>alert('评论不能超过200字!')</script><%
}
 %> 
  <body>
  
  <div align="center">
	<table border="0" width="1000" cellspacing="0" cellpadding="0" id="table1" >
		<tr>
			<td><jsp:include flush="true" page="/top.jsp" /></td>
		</tr>
		<tr>
			<td>
			<jsp:include flush="true" page="/servlet/ListServlet" />
			<%
			ArrayList film = (ArrayList)request.getAttribute("film");
			ArrayList critique = (ArrayList)request.getAttribute("critique");
			ArrayList users = (ArrayList)request.getAttribute("users");
			String id = request.getParameter("id");
			ArrayList alRow = null;
			for(int i =0;i < film.size();i++){
				alRow = (ArrayList)film.get(i);
				if(alRow.get(0).equals(id)){
					break;
				}
			}
			 %>
			<form action="servlet/RegServlet" method="post" name="form1" onsubmit="return login11()">
			<br>
				<div align="center">
				<table  width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td rowspan="5" align="center" width="50%">
						<a href="<%=alRow.get(7) %>" title="点击查看放大图" target="_blank"><img src="<%=alRow.get(7) %>" border="0" width="250" height="350"/></a></td>
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
					<tr>
						<td>&nbsp;演员：<%=alRow.get(5) %></td>
					</tr>
					<tr>
						<td colspan="2" valign="top"><br>&nbsp;影片介绍：<br><%=alRow.get(6) %></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<%--<a onclick="openwin('<%=basePath %>play.jsp?id=<%=alRow.get(0) %>')" href="javascript:void(0);"><img border="0" src="img/bofang.gif" width="67" height="67"></a>--%>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" height="35">投票：<input type="radio" value="1" checked name="vote">很好&nbsp;&nbsp; 
						<input type="radio" name="vote" value="2">一般&nbsp;&nbsp; 
						<input type="radio" name="vote" value="3">很差&nbsp;&nbsp; 
						<input type="button" value="我要投票" onclick="check11(<%=alRow.get(0) %>)"><br><br>
						很好：<%=alRow.get(9) %>票&nbsp;&nbsp;一般：<%=alRow.get(10) %>票&nbsp;&nbsp;很差：<%=alRow.get(11) %>票<br><br>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<%
						for(int i = 0;i < critique.size();i++){
							ArrayList critiqueRow = (ArrayList)critique.get(i);
							if(!critiqueRow.get(1).equals(alRow.get(0))){
								continue;
							}
						 %>
						<table border="1" width="100%" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
							<tr>
								<td colspan="3" height="10"></td>
							</tr>
							<tr>
								<td height="20" width="6%">&nbsp;用户：<br></td>
								<td height="20" width="63%" >&nbsp; 
								<%
								for(int j = 0;j < users.size();j++){
									ArrayList usersRow = (ArrayList)users.get(j);
									if(usersRow.get(0).equals(critiqueRow.get(2))){
										%><%=usersRow.get(3) %><%
										break;
									}
								}
								 %>
								</td>
								<td height="20" width="30%" >&nbsp;时间：<%=critiqueRow.get(5).toString().substring(0,16) %></td>
							</tr>
							<tr>
								<td height="20" width="6%" >&nbsp;标题：</td>
								<td height="20" width="93%" colspan="2" ><%=critiqueRow.get(3) %></td>
							</tr>
							<tr>
								<td height="20" width="6%" >&nbsp;内容：</td>
								<td height="20" width="93%" colspan="2" ><%=critiqueRow.get(4) %></td>
							</tr>
							<tr>
								<td colspan="3" height="10"></td>
							</tr>
							</table>
							<%} %>
						<table border="1" width="100%" cellspacing="0" cellpadding="0"  id="table2" style="border-collapse: collapse">
							<tr>
								<td colspan="2" height="25">&nbsp;<%=alRow.get(1) %>评论</td>
							</tr>
							<tr>
								<td height="25" align="center">标题：</td>
								<td height="25">
								<input type="text" name="title" size="91"></td>
							</tr>
							<tr>
								<td align="center">内容：</td>
								<td><textarea rows="5" name="content" cols="89" placeholder="评论不得超过200字"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="center" height="25">
								<input type="button" value="发表评论" onclick="check22(<%=alRow.get(0) %>)"></td>
							</tr>
						</table>
						</td>
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