<%@ Page Language="C#" AutoEventWireup="true" CodeFile="roomInfoUpdate.aspx.cs" Inherits="roomInfoUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>������Ϣ�޸�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/room_update.png" width="50px" border="0" hspace="2" align="absmiddle">������Ϊ<asp:Literal
                    ID="roomNo" runat="server"></asp:Literal>�ķ�����Ϣ�޸�<font size="+1"> (��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ���ڹ�Ԣ��
            </td>
            <td>
                <br />
                &nbsp;<asp:Literal ID="apartmentNo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �������ͣ�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomType" runat="server" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �������⣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomPrice" runat="server" Width="80px" CssClass="asp" TabIndex="2"></asp:TextBox>Ԫ&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="roomPrice"
                    ErrorMessage="�۸���Ϊ�գ�"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="roomPrice"
                    ErrorMessage="��������ȷ�ļ۸�" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �ܵĴ�λ����
            </td>
            <td>
                &nbsp;<asp:Literal ID="numberOfBed" runat="server"></asp:Literal>��
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ʣ�ലλ����
            </td>
            <td>
                &nbsp;<asp:Literal ID="leftNumberOfBed" runat="server"></asp:Literal>��
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ���ҵ绰��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomTelephone" runat="server" Width="120px" CssClass="asp"
                    TabIndex="3"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="roomTelephone"
                    ErrorMessage="�绰��ʽ����ȷ!" ValidationExpression="^[0-9]{3,4}-[0-9]{7,8}" Width="180px"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������Ϣ:
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Back" runat="server" Text="����" OnClick="Btn_Back_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
