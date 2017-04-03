<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appraisalInfoCheck.aspx.cs"
    Inherits="appraisalInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>评比结果查看</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/print.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/appraisal_check.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>评比结果查看</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                公寓号：<asp:DropDownList ID="apartmentNo" runat="server" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
                &nbsp;学年：<asp:DropDownList ID="appraisalYear" runat="server" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
                &nbsp;学期：<asp:DropDownList ID="appraisalTerm" runat="server" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
                &nbsp;
                <asp:Button ID="Btn_Query" runat="server" Text="查看" OnClick="Btn_Query_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
                <!--startprint-->
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="900px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="apartmentNo" HeaderText="公寓号" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="房间号" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="appraisalYear" HeaderText="学年" SortExpression="appraisalYear">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="appraisalTerm" HeaderText="学期" SortExpression="appraisalTerm">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="appraisalScore" HeaderText="评分" SortExpression="appraisalScore">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="appraisalGrade" HeaderText="排名" SortExpression="appraisalGrade">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="appraisalAward" HeaderText="称号" SortExpression="appraisalAward">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="apartmentNo,appraisalGrade" DataNavigateUrlFormatString="appraisalAwardsPrint.aspx?apartmentNo={0}&appraisalGrade={1}"
                            HeaderText="操作" Text="打印奖状">
                            <ControlStyle CssClass="btn" Font-Size="Medium" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                <!--endprint-->
                <asp:Button ID="Btn_Export" runat="server" OnClick="Btn_Export_Click" Text="导出到Excel"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="6" />&nbsp;
                <input type="button" name="print" onclick="preview()" value="预览并打印" style="font-size: medium"
                    class="btn btn-primary" tabindex="7" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
