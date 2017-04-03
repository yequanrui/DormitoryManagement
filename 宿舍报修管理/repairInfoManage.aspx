<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repairInfoManage.aspx.cs"
    Inherits="repairInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>���ᱨ�����</title>
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
                <font>���ᱨ�����</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="Btn_Auditing" runat="server" Text="�鿴������˵���Ϣ" OnClick="Btn_Auditing_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="1" Width="170px" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Audited" runat="server" Text="�鿴����˵���Ϣ" OnClick="Btn_Audited_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="2" Width="160px" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="��ʾ����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="950px" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="repairId" HeaderText="��ˮ��" SortExpression="repairId">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentNo" HeaderText="��Ԣ��" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="roomNo" HeaderText="�����" SortExpression="roomNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="������" SortExpression="studentName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="repairTime" HeaderText="����ʱ��" SortExpression="repairTime"
                            DataFormatString="{0:yyyy��MM��dd�� HH:mm:ss}">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="140px" />
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
                        <asp:HyperLinkField DataNavigateUrlFields="repairId" DataNavigateUrlFormatString="repairInfoAudit.aspx?repairId={0}"
                            HeaderText="����" Text="���">
                            <ControlStyle CssClass="btn"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:HyperLinkField>
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
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
