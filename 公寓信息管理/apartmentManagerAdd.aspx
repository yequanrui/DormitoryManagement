<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentManagerAdd.aspx.cs"
    Inherits="apartmentManagerAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>宿管信息添加</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" action="" method="post" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartmentmanager_add.png" width="50px" border="0" hspace="2"
                    align="absmiddle">
                <font>宿管信息添加 </font><font size="+1">(带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                姓名：
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="ManagerName" runat="server" Width="150px" CssClass="asp" placeholder="请输入管理员姓名"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="ManagerName" ErrorMessage="姓名不能为空"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                性别：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="ManagerSex" runat="server" CssClass="asp" TabIndex="2">
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
                &nbsp;<asp:DropDownList ID="ManagerState" runat="server" CssClass="asp" TabIndex="3">
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
                    placeholder="请输入管理员手机号" TabIndex="4"></asp:TextBox>&nbsp;
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
                    Width="300px" CssClass="asp" TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="添加" TabIndex="6"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="取消" TabIndex="7"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
