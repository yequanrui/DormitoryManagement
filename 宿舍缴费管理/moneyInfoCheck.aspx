<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moneyInfoCheck.aspx.cs" Inherits="moneyInfoCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ƿ����Ϣ�鿴</title>
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
                <font>Ƿ����Ϣ�鿴</font>
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
                        <asp:BoundField DataField="studentNumber" HeaderText="ѧ��" SortExpression="studentNumber"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="����" SortExpression="studentName"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CollegeName" HeaderText="����ѧԺ" SortExpression="CollegeName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SpecialFieldName" HeaderText="רҵ" SortExpression="SpecialFieldName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LiveInTime" HeaderText="��סʱ��" SortExpression="LiveInTime"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"></asp:BoundField>
                        <asp:BoundField DataField="ShouldGiveMoney" HeaderText="Ӧ��ס�޷���" SortExpression="ShouldGiveMoney">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RealGiveMoney" HeaderText="ʵ��ס�޷���" SortExpression="RealGiveMoney"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" NextPageText="��һҳ"
                        PreviousPageText="��һҳ" />
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
                ѧ�ţ�
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="StudentNumber" runat="server" Width="150px" CssClass="asp"
                    placeholder="������ѧ��" TabIndex="1"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="StudentNumber" ErrorMessage="ѧ�Ų���Ϊ�գ�"></asp:RequiredFieldValidator>
                </font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
            </td>
            <td>
                &nbsp;<asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="��ѯ"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="2" />
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Ӧ��ס�޷��ã�
            </td>
            <td>
                &nbsp;<asp:Label ID="shouldGiveMoney" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ʵ�ʽ���ס�޷��ã�
            </td>
            <td>
                &nbsp;<asp:Label ID="realGiveMoney" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �������ס�޷��ã�
            </td>
            <td>
                &nbsp;<asp:Label ID="alsoGiveMoney" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
