<%@ Page Language="C#" AutoEventWireup="true" CodeFile="outInfoCheck.aspx.cs" Inherits="outInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>迁出信息查看</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/live_out_check.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>迁出信息查看</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                学号：<asp:TextBox ID="StudentNumber" runat="server" Width="120px" CssClass="asp" placeholder="请输入学生学号"
                    TabIndex="1"></asp:TextBox>
                &nbsp;姓名：<asp:TextBox ID="StudentName" runat="server" Width="80px" placeholder="学生姓名"
                    CssClass="asp" TabIndex="2"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_Query" runat="server" Text="查看" OnClick="Btn_Query_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="3" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333" GridLines="None"
                    Font-Size="Medium" Width="600px" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField HeaderText="流水号" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="studentNumber" HeaderText="学号" SortExpression="studentNumber">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="姓名" SortExpression="studentName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="outTime" HeaderText="迁出时间" SortExpression="outTime" DataFormatString="{0:yyyy年MM月dd日}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="outReason" HeaderText="迁出原因" SortExpression="outReason">
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
        </tr>
    </table>
    </form>
</body>
</html>
