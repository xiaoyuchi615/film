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
            if (document.form1.filepath.value == "") {
                alert("影片图片不能为空!");
                document.form1.filepath.focus();
                return false;
            }
            if (!(fileext == '.jpg') && !(fileext == '.gif')) {
                alert("对不起，图片格式不对,必须为jpg或gif格式!");
                form1.filepath.focus();
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
<script>alert('片名重复!')</script>
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
                    ArrayList types = (ArrayList) request.getAttribute("types");
                %>
                <form name="form1" action="${appPath}/FilmAddServlet" method="post" onSubmit="return check11()"
                      enctype="multipart/form-data">
                    <table border="1" width="100%" cellspacing="1" bgcolor="#E8E8E8" style="border-collapse: collapse"
                           bordercolor="#C0C0C0">
                        <tr>
                            <td height="30" colspan="2" align="center">添加影片</td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片名称：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="name" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片类型：</td>
                            <td height="30" width="52%">&nbsp;<select size="1" name="types">
                                <%
                                    for (int i = 0; i < types.size(); i++) {
                                        ArrayList alRow = (ArrayList) types.get(i);
                                %>
                                <option value="<%=alRow.get(1) %>"><%=alRow.get(1) %>
                                </option>
                                <%} %>
                            </select></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片票房：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="ticket" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片导演：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="director"
                                                                     size="20"></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片演员：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="player" size="20">
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片简介：</td>
                            <td height="30" width="52%">&nbsp;<textarea rows="12" name="intro" cols="43"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">影片图片：</td>
                            <td height="30" width="52%">&nbsp;<input type="file" name="filepath" size="39"></td>
                        </tr>
                        <tr>
                            <td height="30" align="right" width="48%">播放路径(影片文件名)：</td>
                            <td height="30" width="52%">&nbsp;<input class="input7" type="text" name="playurl"
                                                                     size="20"></td>
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