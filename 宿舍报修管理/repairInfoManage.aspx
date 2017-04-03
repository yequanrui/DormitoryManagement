<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repairInfoManage.aspx.cs"
    Inherits="repairInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>宿舍报修审核</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/illegal_manage.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>宿舍报修审核</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="Btn_Auditing" runat="server" Text="查看正在审核的信息" OnClick="Btn_Auditing_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="1" Width="170px" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Audited" runat="server" Text="查看已审核的信息" OnClick="Btn_Audited_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="2" Width="160px" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="950px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="repairId" HeaderText="流水号" SortExpression="repairId">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentNo" HeaderText="公寓号" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="房间号" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="报修人" SortExpression="studentName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairTime" HeaderText="报修时间" SortExpression="repairTime"
                            DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="140px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairThing" HeaderText="报修物品" SortExpression="repairThing">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairQuantity" HeaderText="报修数量" SortExpression="repairQuantity">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairReason" HeaderText="报修原因" SortExpression="repairReason">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairAduit" HeaderText="报修审核" SortExpression="repairAduit">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairResult" HeaderText="报修结果" SortExpression="repairResult">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="repairId" DataNavigateUrlFormatString="repairInfoAudit.aspx?repairId={0}"
                            HeaderText="操作" Text="审核">
                            <ControlStyle CssClass="btn"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NumericFirstLast" NextPageText="下一页"
                        PreviousPageText="上一页" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
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
