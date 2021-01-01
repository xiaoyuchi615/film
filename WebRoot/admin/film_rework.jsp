<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
            var fileext = form1.filepath.value.substring(form1.filepath.value.length - 4, form1.filepath.value.length);
            fileext = fileext.toLowerCase();
            if (document.form1.name.value == "") {
                alert("请输入影片名称!");
                document.form1.name.focus();
                return false;
            }
            if (document.form1.ticket.value == "") {
                alert("请输入影片票房!");
                document.form1.ticket.focus();
                return false;
            }
            if (document.form1.director.value == "") {
                alert("请输入影片导演!");
                document.form1.director.focus();
                return false;
            }
            if (document.form1.player.value == "") {
                alert("请输入影片演员!");
                document.form1.player.focus();
                return false;
            }
            if (document.form1.intro.value == "") {
                alert("请输入影片简介!");
                document.form1.intro.focus();
                return false;
            }
        }
    </script>
</head>
<jsp:include flush="true" page="/admin/admin_session.jsp"/>
<%
    String error = request.getParameter("error");
    if (error != null && error.equals("1")) {
%>
<script>alert('片名重复!')</script>
<%
    }
%>
<%
    String ok = request.getParameter("ok");
    if (ok != null && ok.equals("1")) {
%>
<script>alert('修改成功!')</script>
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
                    ArrayList types = (ArrayList) request.getAttribute("types");
                    ArrayList film = (ArrayList) request.getAttribute("film");
                    String id = request.getParameter("id");
                    ArrayList alRow = null;
                    for (int i = 0; i < film.size(); i++) {
                        alRow = (ArrayList) film.get(i);
                        if (alRow.get(0).equals(id)) {
                            break;
                        }
                    }
                %>
                <form name="form1" action="servlet/FilmReworkServlet?id=<%=id%>" method="post"
                      onSubmit="return check11()">
                    <table border="1" width="100%" cellspacing="1" bgcolor="#E8E8E8" style="border-collapse: collapse"
                           bordercolor="#C0C0C0">
                        <tr>
                            <td height="30" colspan="2" align="center">修改影片信息</td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片名称：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="name" size="20"
                                                                     value="<%=alRow.get(1) %>"></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片类型：</td>
                            <td height="30" width="52%">&nbsp;<select size="1" name="types">
                                <%
                                    for (int i = 0; i < types.size(); i++) {
                                        ArrayList typesRow = (ArrayList) types.get(i);
                                        if (typesRow.get(1).equals(alRow.get(2))) {
                                %>
                                <option value="<%=typesRow.get(1) %>" selected><%=typesRow.get(1) %>
                                </option>
                                <%
                                } else {
                                %>
                                <option value="<%=typesRow.get(1) %>"><%=typesRow.get(1) %>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片票房：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="ticket" size="20"
                                                                     value="<%=alRow.get(3) %>"></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片导演：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="director"
                                                                     size="20" value="<%=alRow.get(4) %>"></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片演员：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="player" size="20"
                                                                     value="<%=alRow.get(5) %>"></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片简介：</td>
                            <td height="30" width="52%">&nbsp;<textarea rows="12" name="intro"
                                                                        cols="43"><%=alRow.get(6) %></textarea></td>
                        </tr>
                        <tr>
                            <td height="30" colspan="2" align="center">
                                <input type="submit" value="修改"></td>
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