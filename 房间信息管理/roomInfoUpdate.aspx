<%@ Page Language="C#" AutoEventWireup="true" CodeFile="roomInfoUpdate.aspx.cs" Inherits="roomInfoUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>房间信息修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/room_update.png" width="50px" border="0" hspace="2" align="absmiddle">房间编号为<asp:Literal
                    ID="roomNo" runat="server"></asp:Literal>的房间信息修改<font size="+1"> (带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                所在公寓：
            </td>
            <td>
                <br />
                &nbsp;<asp:Literal ID="apartmentNo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                房间类型：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomType" runat="server" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                房间月租：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomPrice" runat="server" Width="80px" CssClass="asp" TabIndex="2"></asp:TextBox>元&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="roomPrice"
                    ErrorMessage="价格不能为空！"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="roomPrice"
                    ErrorMessage="请输入正确的价格！" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                总的床位数：
            </td>
            <td>
                &nbsp;<asp:Literal ID="numberOfBed" runat="server"></asp:Literal>个
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                剩余床位数：
            </td>
            <td>
                &nbsp;<asp:Literal ID="leftNumberOfBed" runat="server"></asp:Literal>个
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                寝室电话：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomTelephone" runat="server" Width="120px" CssClass="asp"
                    TabIndex="3"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="roomTelephone"
                    ErrorMessage="电话格式不正确!" ValidationExpression="^[0-9]{3,4}-[0-9]{7,8}" Width="180px"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                附加信息:
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="更新" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Back" runat="server" Text="返回" OnClick="Btn_Back_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
