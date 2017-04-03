<%@ Page Language="C#" AutoEventWireup="true" CodeFile="illegalInfoSolve.aspx.cs"
    Inherits="illegalInfoSolve" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Υ����Ϣ����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/illegal_audit.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>Υ����Ϣ���� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ��Ԣ�ţ�
            </td>
            <td>
                <br />
                &nbsp;<asp:Literal ID="apartmentNo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ţ�
            </td>
            <td>
                &nbsp;<asp:Literal ID="roomNo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Υ��ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="illegalTime" runat="server" CssClass="asp" Width="220px" TabIndex="1"
                    ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Υ��ԭ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="illegalReason" runat="server" Height="50px" TextMode="MultiLine"
                    CssClass="asp" Width="300px" TabIndex="2" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Υ�洦��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="illegalSolve" runat="server" Height="50px" TextMode="MultiLine"
                    CssClass="asp" placeholder="������Υ�洦��" Width="300px" TabIndex="3"></asp:TextBox><font
                        color="red">&nbsp;*</font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Υ��۷֣�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="illegalScore" runat="server" CssClass="asp" placeholder="Υ��۷�"
                    Width="65px" TabIndex="4"></asp:TextBox>��<font color="red">&nbsp;*</font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Solve" runat="server" OnClick="Btn_Solve_Click" Text="����"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Back" runat="server" OnClick="Btn_Back_Click" Text="����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" />
                <br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
