<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liveInfoAdd.aspx.cs" Inherits="liveInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>入住信息添加</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/live_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>入住信息添加 </font><font size="+1">(带*号的为必填项)</font>
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
                    TabIndex="1"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="StudentNumber" ErrorMessage="学号不能为空！"></asp:RequiredFieldValidator>
                </font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                所在公寓：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="apartmentNo" runat="server" DataSourceID="apartmentInfoDataSource"
                    DataTextField="apartmentNo" DataValueField="apartmentNo" AutoPostBack="True"
                    CssClass="asp" TabIndex="2">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                房间号：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomNo" runat="server" AutoPostBack="True" DataSourceID="roomNoDataSource"
                    DataTextField="roomNo" DataValueField="roomNo" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                入住时间：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="LiveinYear" runat="server" CssClass="asp" TabIndex="4">
                </asp:DropDownList>
                年 &nbsp;<asp:DropDownList ID="LiveinMonth" runat="server" CssClass="asp" TabIndex="5">
                </asp:DropDownList>
                月 &nbsp;<asp:DropDownList ID="LiveinDay" runat="server" CssClass="asp" TabIndex="6">
                </asp:DropDownList>
                日
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                备注：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="LiveMemo" runat="server" Height="50px" TextMode="MultiLine"
                    CssClass="asp" Width="300px" TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="添加" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="8" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="取消" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="9" />
                <br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
        <asp:SqlDataSource ID="apartmentInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [apartmentNo] FROM [apartmentInfo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="roomNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [roomNo] FROM [roomInfo] WHERE ([apartmentNo] = @apartmentNo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="apartmentNo" Name="apartmentNo" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </table>
    </form>
    <br>
</body>
</html>
