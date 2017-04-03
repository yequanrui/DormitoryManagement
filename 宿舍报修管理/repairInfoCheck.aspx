<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repairInfoCheck.aspx.cs"
    Inherits="repairInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>���޽���鿴</title>
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
                <font>���޽���鿴</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                <!--startprint-->
                ��ʼ���ڣ�<asp:TextBox ID="beginDate" runat="server" CssClass="asp" placeholder="�����뿪ʼ����"
                    TabIndex="1"></asp:TextBox>&nbsp; �������ڣ�<asp:TextBox ID="endDate" runat="server" CssClass="asp"
                        placeholder="�������������" TabIndex="2"></asp:TextBox>&nbsp;
                <asp:Button ID="Btn_Query" runat="server" Text="�鿴" OnClick="Btn_Query_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="��ʾ����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="900px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" ShowHeaderWhenEmpty="True">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="repairId" HeaderText="��ˮ��" SortExpression="repairId" />
                        <asp:BoundField DataField="apartmentNo" HeaderText="��Ԣ��" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="�����" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairTime" HeaderText="����ʱ��" SortExpression="repairTime"
                            DataFormatString="{0:yyyy��MM��dd�� HH:mm:ss}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairThing" HeaderText="������Ʒ" SortExpression="repairThing">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairQuantity" HeaderText="��������" SortExpression="repairQuantity">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairReason" HeaderText="����ԭ��" SortExpression="repairReason">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairAduit" HeaderText="�������" SortExpression="repairAduit">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairResult" HeaderText="���޽��" SortExpression="repairResult">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" NextPageText="��һҳ"
                        PreviousPageText="��һҳ" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <!--endprint-->
                <asp:Button ID="Btn_Export" runat="server" OnClick="Btn_Export_Click" Text="������Excel"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="5" />
                <input type="button" name="print" onclick="preview()" value="Ԥ������ӡ" style="font-size: medium"
                    class="btn btn-primary" tabindex="6" />
            </td>
        </tr>
    </table>
    <script>
        laydate.skin('danlan');
        var beginDate = {
            elem: '#beginDate',
            format: 'YYYY/MM/DD',
            max: '2099-12-31', //�������
            choose: function (datas) {
                endDate.min = datas; //��ʼ��ѡ�ú����ý����յ���С����
                endDate.start = datas //�������յĳ�ʼֵ�趨Ϊ��ʼ��
            }
        };
        var endDate = {
            elem: '#endDate',
            format: 'YYYY/MM/DD',
            max: '2099-12-31',
            choose: function (datas) {
                beginDate.max = datas; //������ѡ�ú����ÿ�ʼ�յ��������
            }
        };
        laydate(beginDate);
        laydate(endDate);
    </script>
    </form>
</body>
</html>
