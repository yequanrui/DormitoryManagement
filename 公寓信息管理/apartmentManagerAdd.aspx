<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentManagerAdd.aspx.cs"
    Inherits="apartmentManagerAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>�޹���Ϣ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" action="" method="post" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartmentmanager_add.png" width="50px" border="0" hspace="2"
                    align="absmiddle">
                <font>�޹���Ϣ��� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ������
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="ManagerName" runat="server" Width="150px" CssClass="asp" placeholder="���������Ա����"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="ManagerName" ErrorMessage="��������Ϊ��"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �Ա�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="ManagerSex" runat="server" CssClass="asp" TabIndex="2">
                    <asp:ListItem>��</asp:ListItem>
                    <asp:ListItem>Ů</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������ò��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="ManagerState" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem>��Ա</asp:ListItem>
                    <asp:ListItem>��Ա</asp:ListItem>
                    <asp:ListItem>Ⱥ��</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �ֻ����룺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="ManagerTelephone" runat="server" Width="150px" CssClass="asp"
                    placeholder="���������Ա�ֻ���" TabIndex="4"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ManagerTelephone"
                    ErrorMessage="�ֻ���ʽ����ȷ!" ValidationExpression="^1[3|5|7|8|]\d{9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ע��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="ManagerMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="���" TabIndex="6"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="ȡ��" TabIndex="7"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
