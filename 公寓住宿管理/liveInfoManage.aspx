<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liveInfoManage.aspx.cs" Inherits="liveInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>入住信息维护</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/live_manage.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>入住信息维护</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                学号：<asp:TextBox ID="StudentNumber" runat="server" Width="120px" CssClass="asp" placeholder="请输入学生学号"
                    TabIndex="1"></asp:TextBox>
                &nbsp; 姓名：<asp:TextBox ID="StudentName" runat="server" Width="80px" CssClass="asp"
                    placeholder="学生姓名" TabIndex="2"></asp:TextBox>
                &nbsp; 所在公寓：<asp:DropDownList ID="apartmentNo" runat="server" CssClass="asp" TabIndex="3"
                    AutoPostBack="True">
                </asp:DropDownList>
                &nbsp;房间号：<asp:DropDownList ID="roomNo" runat="server" AutoPostBack="True" CssClass="asp"
                    TabIndex="4" DataSourceID="roomNoSource" DataTextField="roomNo" DataValueField="roomNo">
                </asp:DropDownList>
                &nbsp;
                <asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="查询" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" Width="60px" />&nbsp;&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" Width="90px" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="900px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="studentNumber" HeaderText="学号" SortExpression="studentNumber">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="姓名" SortExpression="studentName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentNo" HeaderText="所在公寓" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="房间编号" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="入住时间">
                            <ItemTemplate>
                                <asp:Literal ID="liveInTime" runat="server"></asp:Literal>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="outTime" HeaderText="迁出时间" SortExpression="outTime" DataFormatString="{0:yyyy年MM月dd日}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="studentNumber" DataNavigateUrlFormatString="liveInfoUpdate.aspx?studentNumber={0}"
                            HeaderText="操" Text="转房" ControlStyle-CssClass="btn" ItemStyle-Width="60px">
                            <ControlStyle CssClass="btn"></ControlStyle>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="60px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="studentNumber" DataNavigateUrlFormatString="outInfoAdd.aspx?studentNumber={0}"
                            HeaderText="作" Text="迁出" ControlStyle-CssClass="btn" ItemStyle-Width="60px">
                            <ControlStyle CssClass="btn"></ControlStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="60px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
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
            </td>
        </tr>
        <asp:SqlDataSource ID="roomNoSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [roomNo] FROM [roomInfo] WHERE ([apartmentNo] = @apartmentNo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="apartmentNo" Name="apartmentNo" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </table>
    </form>
</body>
</html>
