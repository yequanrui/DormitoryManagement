<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录</title>
    <link href="css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="css/extrastyle.css" rel="stylesheet" type="text/css" />
</head>
<body id="login_body">
    <form id="Form1" method="post" name="loginForm" runat="server">
    <div class="login_main">
        <img src="images/login_logo.png" class="login_logo">
        <div>
            <div class="login_left">
                <img class="login_pic" src="images/login_pic.png">
            </div>
            <div class="login_right">
                <table width="100%">
                    <tr>
                        <td class="login_right_txt">
                            <img height="30" src="images/userrole.png" />
                            <span>权&nbsp;&nbsp;&nbsp;限：</span>
                        </td>
                        <td class="login_right_box">
                            &nbsp;<asp:DropDownList ID="Userrole" runat="server" Width="100px" Font-Size="Medium"
                                Font-Names="微软雅黑">
                                <asp:ListItem>管理员</asp:ListItem>
                                <asp:ListItem>宿管</asp:ListItem>
                                <asp:ListItem>学生</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_right_txt">
                            <img height="30" src="images/user.png" />
                            <span>用户名：</span>
                        </td>
                        <td class="login_right_box">
                            &nbsp;<asp:TextBox ID="UserName" runat="server" TabIndex="1" Font-Size="Medium" Font-Names="微软雅黑"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                ErrorMessage="用户名不能为空！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_right_txt">
                            <img height="30" src="images/password.png" />
                            <span>密&nbsp;&nbsp;&nbsp;码：</span>
                        </td>
                        <td class="login_right_box">
                            &nbsp;<asp:TextBox ID="Password" runat="server" TextMode="Password" TabIndex="2"
                                Font-Size="Medium" Font-Names="微软雅黑"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                                ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 81px">
                        </td>
                        <td align="left">
                            &nbsp;<asp:Label ID="ErrMessage" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 81px">
                        </td>
                        <td height="35" align="left">
                            &nbsp;<asp:Button ID="Btn_Login" runat="server" Text="登录" OnClick="Btn_Login_Click" CssClass="btn btn-primary"
                                TabIndex="3" Font-Size="Medium" />&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Btn_Reset" runat="server" Text="重置" OnClick="Btn_Reset_Click" CssClass="btn btn-primary"
                                TabIndex="4" Font-Size="Medium" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="login_bottom" align="center">
            <span>&copy; 2011-2015 <a href="http://www.gzcc.cn/" target="_blank" style="color: #ABCAD3">
                枫叶软件有限公司</a>&nbsp;版权所有&nbsp;&nbsp;联系电话：0755-36182947</span>
        </div>
    </div>
    </form>
</body>
</html>
