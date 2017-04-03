<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visitInfoCheck.aspx.cs" Inherits="visitInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>来访信息查看</title>
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
                <img src="../images/apartment_visit_check.png" width="50px" border="0" hspace="2"
                    align="absmiddle">
                <font>来访信息查看</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                开始日期：<asp:TextBox ID="beginDate" runat="server" CssClass="asp" placeholder="请输入开始日期"
                    TabIndex="1"></asp:TextBox>
                &nbsp; 结束日期：<asp:TextBox ID="endDate" runat="server" CssClass="asp" placeholder="请输入结束日期"
                    TabIndex="2"></asp:TextBox>&nbsp;
                <asp:Button ID="Btn_Query" runat="server" Text="查看" OnClick="Btn_Query_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />
                <!--startprint-->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333" GridLines="None"
                    Font-Size="Medium" Width="900px" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField HeaderText="流水号">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="interviewee" HeaderText="被访人" SortExpression="interviewee">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="interviewer" HeaderText="来访人" SortExpression="interviewer">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="relation" HeaderText="关系" SortExpression="relation">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentNo" HeaderText="公寓号" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="房间号" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="managerName" HeaderText="管理员" SortExpression="managerName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="beginTime" HeaderText="来访时间" SortExpression="beginTime"
                            DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="endTime" HeaderText="结束时间" SortExpression="endTime" DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="interviewMemo" HeaderText="备注" SortExpression="interviewMemo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                <!--endprint-->
                <asp:Button ID="Btn_Export" runat="server" OnClick="Btn_Export_Click" Text="导出到Excel"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="5" />&nbsp;
                <input type="button" name="print" onclick="preview()" value="预览并打印" style="font-size: medium"
                    class="btn btn-primary" tabindex="6" />
            </td>
        </tr>
    </table>
    </form>
    <script>
        laydate.skin('danlan');
        var beginDate = {
            elem: '#beginDate',
            format: 'YYYY/MM/DD',
            max: '2099-12-31', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                endDate.min = datas; //开始日选好后，重置结束日的最小日期
                endDate.start = datas //将结束日的初始值设定为开始日
            }
        };
        var endDate = {
            elem: '#endDate',
            format: 'YYYY/MM/DD',
            max: '2099-12-31',
            istime: true,
            istoday: false,
            choose: function (datas) {
                beginDate.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(beginDate);
        laydate(endDate);
    </script>
</body>
</html>
