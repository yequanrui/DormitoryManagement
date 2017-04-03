<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentManagerUpdate.aspx.cs"
    Inherits="apartmentManagerUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>宿管信息更新</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartmentmanager_update.png" width="50px" border="0" hspace="2"
                    align="absmiddle">公寓管理员为<asp:Literal ID="ManagerName" runat="server"></asp:Literal>的宿管信息修改
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                性别：
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="ManagerSex" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                政治面貌：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="ManagerState" runat="server" CssClass="asp" TabIndex="4">
                    <asp:ListItem>团员</asp:ListItem>
                    <asp:ListItem>党员</asp:ListItem>
                    <asp:ListItem>群众</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                手机号码：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="ManagerTelephone" runat="server" Width="150px" CssClass="asp"
                    TabIndex="7"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ManagerTelephone"
                    ErrorMessage="手机格式不正确!" ValidationExpression="^1[3|5|7|8|]\d{9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                备注：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="ManagerMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="更新" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
