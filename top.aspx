<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>学生公寓信息管理系统top</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="refresh" content="60" />
    <link href="css/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body id="admin_top_body">
    <form id="form1" runat="server">
    <div class="admin_top_content">
        <div class="admin_top_logo">
            <img src="images/logo.png" width="262" height="64" border="0"></div>
        <div class="admin_top_text">
            操作员：<%=Session["adminUserName"]%>(<%=Session["adminUserRole"]%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            登录时间：<%=Session["loginTime"]%></div>
        <div class="admin_top_btn">
            <asp:ImageButton ID="Btn_Logout" runat="server" ImageUrl="images/out.png" OnClick="Btn_Logout_Click" />
        </div>
    </form>
</body>
</html>
