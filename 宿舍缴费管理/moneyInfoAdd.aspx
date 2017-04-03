<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moneyInfoAdd.aspx.cs" Inherits="moneyInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>缴费信息添加</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server" method="post" name="form1">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/money_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>缴费信息添加 </font><font size="+1">(带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                学号：
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="StudentNumber" runat="server" CssClass="asp" placeholder="请输入学生学号"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="StudentNumber" ErrorMessage="学号不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                费用类型：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="GiveMoneyType" runat="server" CssClass="asp" TabIndex="2">
                    <asp:ListItem>住宿费</asp:ListItem>
                    <asp:ListItem>水电费</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                缴纳日期：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="GiveMoneyYear" runat="server" Width="80px" CssClass="asp"
                    TabIndex="3">
                </asp:DropDownList>
                年&nbsp;<asp:DropDownList ID="GiveMoneyMonth" runat="server" Width="50px" CssClass="asp"
                    TabIndex="4">
                </asp:DropDownList>
                月&nbsp;<asp:DropDownList ID="GiveMoneyDay" runat="server" Width="50px" CssClass="asp"
                    TabIndex="5">
                </asp:DropDownList>
                日
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                缴纳金额：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="GiveMoney" runat="server" Width="80px" CssClass="asp" placeholder="请输入金额"
                    TabIndex="6"></asp:TextBox>元<font color="red">&nbsp;*<asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ControlToValidate="GiveMoney" ErrorMessage="金额不能为空！"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="金额格式不正确！"
                            ControlToValidate="GiveMoney" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator></font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="添加" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click"
                    Text="取消" Font-Size="Medium" CssClass="btn btn-primary" TabIndex="8" /><br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
