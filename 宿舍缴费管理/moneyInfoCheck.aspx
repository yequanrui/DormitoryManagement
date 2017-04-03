<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moneyInfoCheck.aspx.cs" Inherits="moneyInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>欠费信息查看</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/money_check.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>欠费信息查看</font>
            </th>
        </tr>
        <%--<tr align="center">
            <td colspan="7">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="800px" ForeColor="#333333"
                    GridLines="None">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="studentNumber" HeaderText="学号" SortExpression="studentNumber"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="姓名" SortExpression="studentName"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CollegeName" HeaderText="所在学院" SortExpression="CollegeName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SpecialFieldName" HeaderText="专业" SortExpression="SpecialFieldName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LiveInTime" HeaderText="入住时间" SortExpression="LiveInTime"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"></asp:BoundField>
                        <asp:BoundField DataField="ShouldGiveMoney" HeaderText="应缴住宿费用" SortExpression="ShouldGiveMoney">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RealGiveMoney" HeaderText="实交住宿费用" SortExpression="RealGiveMoney"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
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
        </tr>--%>
        <tr>
            <td width="36%" align="right">
                <br />
                学号：
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="StudentNumber" runat="server" Width="150px" CssClass="asp"
                    placeholder="请输入学号" TabIndex="1"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="StudentNumber" ErrorMessage="学号不能为空！"></asp:RequiredFieldValidator>
                </font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
            </td>
            <td>
                &nbsp;<asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="查询"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="2" />
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                应缴住宿费用：
            </td>
            <td>
                &nbsp;<asp:Label ID="shouldGiveMoney" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                实际缴纳住宿费用：
            </td>
            <td>
                &nbsp;<asp:Label ID="realGiveMoney" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                还需缴纳住宿费用：
            </td>
            <td>
                &nbsp;<asp:Label ID="alsoGiveMoney" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
