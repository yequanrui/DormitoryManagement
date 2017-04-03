<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moneyInfoManage.aspx.cs"
    Inherits="moneyInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>缴费信息维护</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/print.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/money_manage.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>缴费信息维护</font>
            </th>
        </tr>
        <tr align="center">
            <td colspan="7">
                <br />
                学号：<asp:TextBox ID="StudentNumber" runat="server" Width="120px" CssClass="asp" TabIndex="1"></asp:TextBox>
                &nbsp;姓名：<asp:TextBox ID="StudentName" runat="server" Width="80px" CssClass="asp"
                    TabIndex="2"></asp:TextBox>
                &nbsp;缴费类型
                <asp:DropDownList ID="GiveMoneyType" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                    <asp:ListItem>住宿费</asp:ListItem>
                    <asp:ListItem>水电费</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                <asp:Button ID="Btn_Query" runat="server" Text="查询" OnClick="Btn_Query_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />
                &nbsp;&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" /><br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="moneyInfoDataSource" DataKeyNames="moneyId" OnRowDataBound="GridView1_RowDataBound"
                    Width="800px" ForeColor="#333333" GridLines="None">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                            <ItemTemplate>
                                <asp:CheckBox ID="checkBox" runat="server" /></ItemTemplate>
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="moneyId" HeaderText="流水号" SortExpression="moneyId" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentNumber" HeaderText="学号" SortExpression="studentNumber"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="姓名" SortExpression="studentName"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="giveMoneyType" HeaderText="交费类型" SortExpression="giveMoneyType"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="giveMoney" HeaderText="交费金额" SortExpression="giveMoney"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="交费时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:Literal ID="giveMoneyTime" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="moneyId" DataNavigateUrlFormatString="moneyInfoUpdate.aspx?moneyId={0}"
                            HeaderText="详情" Text="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                            ControlStyle-CssClass="btn">
                            <ControlStyle CssClass="btn"></ControlStyle>
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
                    Text=" 全选" TabIndex="6" />&nbsp;&nbsp;
                <asp:Button ID="Btn_Del" runat="server" OnClick="Btn_Del_Click" Text="删除" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="moneyInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [moneyId], [studentNumber], [giveMoneyType], [giveMoneyYear], [giveMoneyMonth], [giveMoneyDay], [giveMoney], [studentName] FROM [moneyInfoView]">
    </asp:SqlDataSource>
    <br />
    </form>
</body>
</html>
