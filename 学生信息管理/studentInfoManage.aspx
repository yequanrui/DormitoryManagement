<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfoManage.aspx.cs"
    Inherits="studentInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ѧ����Ϣά��</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/student_manage.png" width="50px" border="0" hspace="2" align="absmiddle" />
                <font>ѧ����Ϣά��</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                &nbsp;ѧ�ţ�<asp:TextBox ID="StudentNumber" runat="server" Width="120px" CssClass="asp"
                    TabIndex="1"></asp:TextBox>
                &nbsp;������<asp:TextBox ID="StudentName" runat="server" Width="65px" CssClass="asp"
                    TabIndex="2"></asp:TextBox>
                &nbsp;����רҵ��<asp:DropDownList ID="StudentSpec" runat="server" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
                &nbsp;&nbsp;<asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="��ѯ"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="4" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="��ʾ����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" /><br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" Width="900px" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ѡ��">
                            <ItemTemplate>
                                <asp:CheckBox ID="checkBox" runat="server" /></ItemTemplate>
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="studentNumber" HeaderText="ѧ��" SortExpression="studentNumber">
                            <ControlStyle Width="150px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="����" SortExpression="studentName">
                            <ControlStyle Width="100px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentSex" HeaderText="�Ա�" SortExpression="studentSex">
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentState" HeaderText="������ò" SortExpression="studentState">
                            <ControlStyle Width="60px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentSpec" HeaderText="רҵ" SortExpression="studentSpec">
                            <ControlStyle Width="120px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentBirthday" HeaderText="����" SortExpression="studentBirthday"
                            DataFormatString="{0:yyyy��MM��dd��}">
                            <ControlStyle Width="50px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentTelephone" HeaderText="�ֻ���" SortExpression="studentTelephone">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="studentNumber" DataNavigateUrlFormatString="studentInfoUpdate.aspx?studentNumber={0}"
                            HeaderText="����" Text="�༭">
                            <ControlStyle Width="30px" CssClass="btn" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:HyperLinkField>
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
                <asp:CheckBox ID="check_ALL" runat="server" Text=" ȫѡ" OnCheckedChanged="check_ALL_CheckedChanged"
                    AutoPostBack="True" TabIndex="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Del" runat="server" Text="ɾ��" OnClick="Btn_Del_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
