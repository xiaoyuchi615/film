<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="../app.jsp" %>
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
        function check11() {
            var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";
            var regu = "^[0-9a-zA-Z]+$";
            var re = new RegExp(reg);
            if (document.form1.name.value == "") {
                alert("请输入用户名!");
                document.form1.name.focus();
                return false;
            }
            if (document.form1.pwd.value == "") {
                alert("请输入密码!");
                document.form1.pwd.focus();
                return false;
            }
            if (document.form1.cpwd.value == "") {
                alert("请输入重复密码!");
                document.form1.cpwd.focus();
                return false;
            }
            if (document.form1.cpwd.value != document.form1.pwd.value) {
                alert("两次密码不一致!");
                document.form1.cpwd.focus();
                return false;
            }
            if (!re.test(document.form1.name.value)) {
                alert("用户名必须是字母或数字");
                document.form1.name.focus();
                return false;
            }
            if (!re.test(document.form1.pwd.value)) {
                alert("密码必须是字母或数字");
                document.form1.pwd.focus();
                return false;
            }
        }
    </script>
</head>
<jsp:include flush="true" page="/admin/admin_session.jsp"/>
<%
    String error = (String) request.getAttribute("error");
    if (error != null && error.equals("1")) {
%>
<script>alert('该影片还有评论，不能删除，如要删除，先删除该影片评论，在删除该影片!')</script>
<%
    }
%>
<%
    String ok = (String) request.getAttribute("ok");
    if (ok != null && ok.equals("1")) {
%>
<script>alert('添加成功!')</script>
<%
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
                <jsp:include flush="true" page="/admin/top.jsp"/>
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
                <jsp:include flush="true" page="/servlet/ListServlet"/>
                <%
                    ArrayList film = (ArrayList) request.getAttribute("film");
                    if (request.getAttribute("films") != null) {
                        film = (ArrayList) request.getAttribute("films");
                    }
                    ArrayList types = (ArrayList) request.getAttribute("types");
                %>
                <form name="form1" action="${appPath}/AdminSearchServlet" method="post" onSubmit="">
                    <table border="1" width="100%" cellspacing="1" bgcolor="#E8E8E8" style="border-collapse: collapse"
                           bordercolor="#C0C0C0">
                        <tr>
                            <td height="30" colspan="6" align="center">
                                <table  id="table1" style="border-collapse: collapse">
                                    <tr>
                                        <td>按影片名称查询：</td>
                                        <td><input type="text" name="name" size="17"></td>
                                        <td><input type="submit" value="查询"></td>
                                    </tr>
                                    <tr>
                                        <td>按影片类型查询：</td>
                                        <td><select size="1" name="types">
                                            <option value="">请选择影片类型</option>
                                            <%
                                                for (int i = 0; i < types.size(); i++) {
                                                    ArrayList alRow = (ArrayList) types.get(i);
                                            %>
                                            <option value="<%=alRow.get(1) %>"><%=alRow.get(1) %>
                                            </option>
                                            <%} %>
                                        </select></td>
                                        <td><input type="submit" value="查询"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" colspan="6" align="center"><a href="admin/film_add.jsp">添加新影片</a></td>
                        </tr>
                        <tr>
                            <td height="30" colspan="6" align="center">影片信息列表</td>
                        </tr>
                        <tr>
                            <td height="25" align="center">名称</td>
                            <td height="25" align="center">类型</td>
                            <td height="25" align="center">票房</td>
                            <td height="25" align="center">导演</td>
                            <td height="25" align="center">演员</td>
                            <td height="25" align="center">　</td>
                        </tr>
                        <%
                            for (int i = 0; i < film.size(); i++) {
                                ArrayList alRow = (ArrayList) film.get(i);
                        %>
                        <tr>
                            <td height="25" align="center">
                                <a href="admin/film_show.jsp?id=<%=alRow.get(0) %>" title="点击查看详细信息"><%=alRow.get(1) %>
                                </a></td>
                            <td height="25" align="center">
                                <%=alRow.get(2) %>
                            </td>
                            <td height="25" align="center">
                                <%=alRow.get(3) %>
                            </td>
                            <td height="25" align="center">
                                <%=alRow.get(4) %>
                            </td>
                            <td height="25" align="center">
                                <%=alRow.get(5) %>
                            </td>
                            <td height="25" align="center">
                                <a href="admin/film_rework.jsp?id=<%=alRow.get(0) %>">修改</a>
                                <a href="${appPath}/DelServlet?film=<%=alRow.get(0) %>">删除</a></td>
                        </tr>
                        <%} %>
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