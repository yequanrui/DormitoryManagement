<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentInfoAdd.aspx.cs"
    Inherits="apartmentInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��Ԣ��Ϣ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartment_add.png" width="40px" border="0" hspace="2" align="absmiddle">
                <font>��Ԣ��Ϣ��� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ��Ԣ�ţ�
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="apartmentNo" runat="server" Width="100px" CssClass="asp" placeholder="�����빫Ԣ��"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="apartmentNo" ErrorMessage="��Ԣ�Ų���Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��Ԣ���ͣ�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="apartmentType" runat="server" CssClass="asp" TabIndex="2">
                    <asp:ListItem>������Ԣ</asp:ListItem>
                    <asp:ListItem>Ů����Ԣ</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����Ա������
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="managerName" runat="server" CssClass="asp" TabIndex="3"
                    DataSourceID="managerNameDataSource" DataTextField="managerName" DataValueField="managerName">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��Ԣ�绰��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="apartmentTelephone" runat="server" Width="150px" CssClass="asp"
                    placeholder="�����빫Ԣ�绰" TabIndex="4"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="apartmentTelephone"
                    ErrorMessage="�绰��ʽ����ȷ!" ValidationExpression="^(\d{3,4}-)?(\d{7,8})"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ע��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="apartmentMemo" runat="server" TextMode="MultiLine" Height="50px"
                    Width="300px" CssClass="asp" TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal><br />
                <asp:Button ID="Btn_Add" runat="server" Text="���" OnClick="Btn_Add_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="ȡ��" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />
            </td>
        </tr>
        <asp:SqlDataSource ID="managerNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [managerName] FROM [apartmentmanagerInfo]"></asp:SqlDataSource>
    </table>
    <br />
    </form>
</body>
</html>
