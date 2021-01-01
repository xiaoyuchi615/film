<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="../app.jsp" %>
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
<script>alert('用户名称重复!')</script>
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
                <form name="form1" action="${appPath}/PwdNameUserServlet?xuser=1" method="post"
                      onSubmit="return check11()">
                    <table border="0" align="center" background="${appPath}/img/MainBg.gif" height="494">
                        <tr>
                            <td valign="top" bgcolor="#E8E8E8">
                                <table id="table2"
                                       style="width: 100%;margin: 0; padding: 0"
                                       cellSpacing="1" cellPadding="0">
                                    <tbody style="margin: 0; padding: 0">
                                    <tr class="ry">
                                        <td class="pl" width="382" align="right">
                                            <span style="color: #874604">用 户 名：</span></td>
                                        <td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0"
                                            width="409" align="left">
                                            <input class="input6" type="text" name="name" size="20"></td>
                                    </tr>
                                    <tr class="rb">
                                        <td class="pl" width="382" align="right">
                                            <span style="color: #874604">密&nbsp;&nbsp;&nbsp; 码：</span></td>
                                        <td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0"
                                            width="409" align="left">
                                            <input class="input6" type="password" name="pwd" size="20"></td>
                                    </tr>
                                    <tr class="ry">
                                        <td class="pl" width="382" align="right">
                                            <span style="color: #874604">重复密码：</span></td>
                                        <td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0"
                                            width="409" align="left">
                                            <input class="input6" type="password" name="cpwd" size="20"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><input type="submit" value="添加"/></td>
                                    </tr>
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