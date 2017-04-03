<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repairInfoCheck.aspx.cs"
    Inherits="repairInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>报修结果查看</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../laydate/laydate.js" type="text/javascript"></script>
    <script src="../js/print.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/illegal_check.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>报修结果查看</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                <!--startprint-->
                开始日期：<asp:TextBox ID="beginDate" runat="server" CssClass="asp" placeholder="请输入开始日期"
                    TabIndex="1"></asp:TextBox>&nbsp; 结束日期：<asp:TextBox ID="endDate" runat="server" CssClass="asp"
                        placeholder="请输入结束日期" TabIndex="2"></asp:TextBox>&nbsp;
                <asp:Button ID="Btn_Query" runat="server" Text="查看" OnClick="Btn_Query_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="900px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" ShowHeaderWhenEmpty="True">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="repairId" HeaderText="流水号" SortExpression="repairId" />
                        <asp:BoundField DataField="apartmentNo" HeaderText="公寓号" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="房间号" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairTime" HeaderText="报修时间" SortExpression="repairTime"
                            DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                <!--endprint-->
                <asp:Button ID="Btn_Export" runat="server" OnClick="Btn_Export_Click" Text="导出到Excel"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="5" />
                <input type="button" name="print" onclick="preview()" value="预览并打印" style="font-size: medium"
                    class="btn btn-primary" tabindex="6" />
            </td>
        </tr>
    </table>
    <script>
        laydate.skin('danlan');
        var beginDate = {
            elem: '#beginDate',
            format: 'YYYY/MM/DD',
            max: '2099-12-31', //最大日期
            choose: function (datas) {
                endDate.min = datas; //开始日选好后，重置结束日的最小日期
                endDate.start = datas //将结束日的初始值设定为开始日
            }
        };
        var endDate = {
            elem: '#endDate',
            format: 'YYYY/MM/DD',
            max: '2099-12-31',
            choose: function (datas) {
                beginDate.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(beginDate);
        laydate(endDate);
    </script>
    </form>
</body>
</html>
