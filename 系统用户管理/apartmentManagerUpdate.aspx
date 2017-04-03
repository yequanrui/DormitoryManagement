<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentManagerUpdate.aspx.cs"
    Inherits="apartmentManagerUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>�޹���Ϣ����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartmentmanager_update.png" width="50px" border="0" hspace="2"
                    align="absmiddle">��Ԣ����ԱΪ<asp:Literal ID="ManagerName" runat="server"></asp:Literal>���޹���Ϣ�޸�
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                �Ա�
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="ManagerSex" runat="server" CssClass="asp" TabIndex="3">
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
                &nbsp;<asp:DropDownList ID="ManagerState" runat="server" CssClass="asp" TabIndex="4">
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
                    TabIndex="7"></asp:TextBox>&nbsp;
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
                    Width="300px" CssClass="asp" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
