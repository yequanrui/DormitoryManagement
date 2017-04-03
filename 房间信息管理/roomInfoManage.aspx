<%@ Page Language="C#" AutoEventWireup="true" CodeFile="roomInfoManage.aspx.cs" Inherits="roomInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>房间信息维护</title>
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form method="post" id="form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/room_manage.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>房间信息维护</font>
            </th>
        </tr>
        <tr align="center">
            <td>
                <br />
                &nbsp;房间号：<asp:TextBox ID="RoomNo" runat="server" Width="100px" CssClass="asp" placeholder="请输入房间号"
                    TabIndex="1"></asp:TextBox>
                &nbsp;所在公寓：<asp:DropDownList ID="apartmentNo" runat="server" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
                &nbsp;房间类型：<asp:DropDownList ID="roomType" runat="server" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="查询"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="4" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" Width="100px" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="800px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                            <ItemTemplate>
                                <asp:CheckBox ID="checkBox" runat="server" /></ItemTemplate>
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="roomNo" HeaderText="房间编号" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentNo" HeaderText="所在公寓" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="roomType" HeaderText="房间类型" SortExpression="roomType">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="roomPrice" HeaderText="房间月租" SortExpression="roomPrice">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="leftNumberOfBed" HeaderText="剩余床位" SortExpression="leftNumberOfBed">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="roomNo" DataNavigateUrlFormatString="roomInfoUpdate.aspx?roomNo={0}"
                            HeaderText="详情" Text="编辑" ControlStyle-CssClass="btn">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NumericFirstLast" NextPageText="下一页"
                        PreviousPageText="上一页" />
                    <PagerStyle ForeColor="White" BackColor="#284775" Font-Underline="True" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:CheckBox ID="check_ALL" runat="server" AutoPostBack="True" OnCheckedChanged="check_ALL_CheckedChanged"
                    Text=" 全选" TabIndex="6" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Del" runat="server" OnClick="Button1_Click" Text="删除" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
