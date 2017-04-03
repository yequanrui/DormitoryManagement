<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liveInfoUpdate.aspx.cs" Inherits="liveInfoUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>入住信息修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form action="" method="post" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/live_update.png" width="50px" border="0" hspace="2" align="absmiddle">学号为<asp:Literal
                    ID="StudentNumber" runat="server"></asp:Literal>的入住信息修改
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                所在公寓：
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="apartmentNo" runat="server" AutoPostBack="True" DataSourceID="apartmentNoDataSource"
                    DataTextField="apartmentNo" DataValueField="apartmentNo" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
                &nbsp;现在该生在<asp:Literal ID="Now_apartmentNo" runat="server"></asp:Literal>公寓
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                房间号：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomNo" runat="server" AutoPostBack="True" DataSourceID="roomNoDataSource"
                    DataTextField="roomNo" DataValueField="roomNo" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
                &nbsp;现在该生在<asp:Literal ID="Now_roomNo" runat="server"></asp:Literal>房间
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                入住时间：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="liveInYear" runat="server" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
                年&nbsp;<asp:DropDownList ID="LiveInMonth" runat="server" CssClass="asp" TabIndex="4">
                </asp:DropDownList>
                月&nbsp;<asp:DropDownList ID="LiveInDay" runat="server" CssClass="asp" TabIndex="5">
                </asp:DropDownList>
                日&nbsp;</tr>
        <tr>
            <td width="36%" align="right">
                备注：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="liveMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_ChangeRoom" runat="server" OnClick="Btn_ChangeRoom_Click" Text="调房"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="7" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_Back" runat="server" OnClick="Btn_Back_Click"
                    Text="返回" Font-Size="Medium" CssClass="btn btn-primary" TabIndex="8" />
            </td>
        </tr>
        <asp:SqlDataSource ID="apartmentNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
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
</body>
</html>
