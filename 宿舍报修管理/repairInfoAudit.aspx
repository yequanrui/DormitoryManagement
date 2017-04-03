<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repairInfoAudit.aspx.cs"
    Inherits="repairInfoAudit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>������Ϣ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/illegal_solve.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>������Ϣ��� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
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
                �����ˣ�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentName" runat="server" Width="120px" CssClass="asp" placeholder="����������"
                    TabIndex="1" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �ֻ����룺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentTelephone" runat="server" Width="150px" CssClass="asp"
                    placeholder="������ѧ���ֻ���" TabIndex="2" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����绰��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomTelephone" runat="server" CssClass="asp" placeholder="�����뷿��绰"
                    TabIndex="3" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairTime" runat="server" CssClass="asp" TabIndex="4" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������Ʒ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairThing" runat="server" CssClass="asp" TabIndex="5" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����������
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairQuantity" runat="server" CssClass="asp" TabIndex="6"
                    ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ԭ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairReason" runat="server" Height="50px" TextMode="MultiLine"
                    CssClass="asp" Width="300px" TabIndex="7" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������ˣ�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairAduit" runat="server" CssClass="asp" placeholder="�����뱨�����"
                    TabIndex="8"></asp:TextBox><font color="red">&nbsp;*</font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ���޽����
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairResult" runat="server" Height="50px" TextMode="MultiLine"
                    CssClass="asp" placeholder="�����뱨�޽��" Width="300px" TabIndex="9"></asp:TextBox>
                <font color="red">&nbsp;*</font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Audit" runat="server" OnClick="Btn_Audit_Click" Text="���"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="10" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Back" runat="server" OnClick="Btn_Back_Click" Text="����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="11" />
                <br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
