<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentInfoUpdate.aspx.cs"
    Inherits="apartmentInfoUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��Ԣ��Ϣ����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartment_update.png" width="50px" border="0" hspace="2" align="absmiddle">��Ԣ���Ϊ<asp:Literal
                    ID="apartmentNo" runat="server"></asp:Literal>�Ĺ�Ԣ��Ϣ�޸�
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ��Ԣ���ͣ�
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="apartmentType" runat="server" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����Ա������
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="managerName" runat="server" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��Ԣ�绰��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="apartmentTelephone" runat="server" Width="150px" CssClass="asp"
                    TabIndex="3"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="apartmentTelephone"
                    ErrorMessage="�绰��ʽ����ȷ!" ValidationExpression="^(\d{3,4}-)?(\d{7,8})"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ע:
            </td>
            <td>
                &nbsp;<asp:TextBox ID="apartmentMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_Back" runat="server" Text="����"
                    OnClick="Btn_Back_Click" Font-Size="Medium" CssClass="btn btn-primary" TabIndex="6" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
