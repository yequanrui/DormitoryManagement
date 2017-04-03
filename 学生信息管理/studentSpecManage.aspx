<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentSpecManage.aspx.cs"
    Inherits="studentSpecManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ѧ��רҵ����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/student_field.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>ѧ��רҵ����</font>
            </th>
        </tr>
        <tr align="center">
            <td>
                <br />
                ����ѧԺ(ϵ)��&nbsp;<asp:DropDownList ID="CollegeName" runat="server" CssClass="asp" TabIndex="1">
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>�����ϵ</asp:ListItem>
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>���ϵ</asp:ListItem>
                    <asp:ListItem>���ι���ϵ</asp:ListItem>
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>�������ϵ</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp; רҵ���ƣ�&nbsp;<asp:TextBox ID="specialFieldName" runat="server" Width="150px"
                    CssClass="asp" placeholder="������רҵ��" TabIndex="2"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="Btn_Add" runat="server" Text="���" OnClick="Btn_Add_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="collegespecInfoDataSource" OnRowDataBound="GridView1_RowDataBound"
                    Width="600px" ForeColor="#333333" GridLines="Vertical">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ѡ��">
                            <ItemTemplate>
                                <asp:CheckBox ID="checkBox" runat="server" /></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="specialFieldName" HeaderText="רҵ����" SortExpression="specialFieldName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="collegeName" HeaderText="����ѧԺ" SortExpression="collegeName">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" NextPageText="��һҳ"
                        PreviousPageText="��һҳ" PageButtonCount="10" Visible="True" />
                    <PagerStyle ForeColor="White" BackColor="#284775" Font-Underline="True" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:CheckBox ID="check_ALL" runat="server" AutoPostBack="True" OnCheckedChanged="check_ALL_CheckedChanged"
                    Text=" ȫѡ" TabIndex="4" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Del" runat="server" OnClick="Button1_Click" Text="ɾ��" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
            </td>
        </tr>
        <asp:SqlDataSource ID="collegespecInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [specialFieldName], [collegeName] FROM [collegespecInfo]">
        </asp:SqlDataSource>
    </table>
    </form>
</body>
</html>
