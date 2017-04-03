<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Password.aspx.cs" Inherits="Password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>登录密码更改</title>
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form name="form1" method="post" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/set_password.png" width="40px" border="0" hspace="2" align="absmiddle">
                <font>用户密码更改</font>
            </th>
        </tr>
        <tr>
            <td>
                <table align="center" class="tablemenu">
                    <tr>
                        <td width="36%" align="right">
                            <br />
                            请输入新密码：
                        </td>
                        <td>
                            <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" Font-Size="Medium"
                                TabIndex="1"></asp:TextBox>&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewPassword"
                                ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="36%" align="right">
                            请确认新密码：
                        </td>
                        <td>
                            <asp:TextBox ID="NewPassAgain" runat="server" TextMode="Password" Font-Size="Medium"></asp:TextBox>&nbsp;
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPassword"
                                ControlToValidate="NewPassAgain" ErrorMessage="两次密码不一致！"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            &nbsp;<asp:Button ID="Btn_ChangePassword" runat="server" OnClick="Btn_ChangePassword_Click"
                                Text="修改密码" Font-Size="Medium" CssClass="btn btn-primary" TabIndex="3" />
                            <br />
                            <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
