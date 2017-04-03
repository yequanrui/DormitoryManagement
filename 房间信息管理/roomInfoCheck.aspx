<%@ Page Language="C#" AutoEventWireup="true" CodeFile="roomInfoCheck.aspx.cs" Inherits="roomInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>房间空余查看</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/room_check.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>房间空余查看 </font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                公寓号：
                <asp:DropDownList ID="apartmentNo" runat="server" DataSourceID="apartmentNoDataSource"
                    DataTextField="apartmentNo" DataValueField="apartmentNo" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Full" runat="server" Text="查看已住满的房间" OnClick="Btn_Full_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="2" Width="160px" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Empty" runat="server" Text="查看未住满的房间" OnClick="Btn_Empty_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="3" Width="160px" />
                <br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    Width="600px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NumericFirstLast" NextPageText="下一页"
                        PreviousPageText="上一页" />
                    <PagerStyle ForeColor="White" BackColor="#284775" Font-Underline="True" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </td>
        </tr>
        <asp:SqlDataSource ID="apartmentNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [apartmentNo] FROM [apartmentInfo]"></asp:SqlDataSource>
    </table>
    </form>
</body>
</html>
