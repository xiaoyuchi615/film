<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    function login11() {
        var reg = "^[0-9a-zA-Z]+([0-9a-zA-Z])+$";
        var regu = "^[0-9a-zA-Z]+$";
        var re = new RegExp(reg);
        if (document.form1.name.value == "") {
            alert("�������û���!");
            document.form1.name.focus();
            return false;
        }
        if (!re.test(document.form1.name.value)) {
            alert("�û�����������ĸ������");
            return false;
        }
        if (document.form1.pwd.value == "") {
            alert("����������!");
            document.form1.pwd.focus();
            return false;
        }
        if (!re.test(document.form1.pwd.value)) {
            alert("�����������ĸ������!");
            document.form1.pwd.focus();
            return false;
        }
    }
</script>
<%
    String error = (String) request.getAttribute("error");
    if (error != null && error.equals("1")) {
%>
<script>alert('�û������������!')</script>
<%
    }
%>
<%
    String ok = (String) request.getAttribute("ok");
    if (ok != null && ok.equals("1")) {
%>
<script>alert('ע��ɹ�!')</script>
<%
    }
%>
<body background="img/bg.jpg">
<div align="center">
    <table border="0" width="1000" cellspacing="0" cellpadding="0" id="table1">
        <tr>
            <td>
                <jsp:include flush="true" page="/top.jsp"/>
            </td>
        </tr>
        <tr>
            <td height="300">
                <form action="servlet/UserLoginServlet" method="post" name="form1" onsubmit="return login11()">
                    <br>
                    <div align="center">
                        <table width="60%" id="table2" cellspacing="0" cellpadding="5">
                            <tr>
                                <td colspan="2" align="center" height="35"
                                    style="font-family: ����_GB2312; font-size: 20px; ">
                                    �û���¼
                                </td>
                            </tr>
                            <tr>
                                <td height="25" align="right" width="50%">�� �� ����</td>
                                <td height="25">��<input style="background-color:transparent" class="input6" name="name"
                                                        type="text"></td>
                            </tr>
                            <tr>
                                <td height="25" align="right" width="50%">��&nbsp;&nbsp;&nbsp;
                                    �룺
                                </td>
                                <td height="25">��<input style="background-color:transparent" class="input6" name="pwd"
                                                        type="password"></td>
                            </tr>
                            <tr>
                                <td height="35" align="center" colspan="2">
                                    <input style="background-color:transparent" type="submit" value="��¼"
                                           style="color: #000080;"></td>
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