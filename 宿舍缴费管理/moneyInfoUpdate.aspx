<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moneyInfoUpdate.aspx.cs"
    Inherits="moneyInfoUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>�ɷ���Ϣ�޸�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form action="" method="post" id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/money_update.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>�ɷ���Ϣ�޸�</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ѧ�ţ�
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="StudentNumber" runat="server" Width="150px" CssClass="asp"
                    TabIndex="1"></asp:TextBox>
                <font color="red">&nbsp;*
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ѧ�Ų���Ϊ�գ�"
                        ControlToValidate="StudentNumber"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������
            </td>
            <td>
                &nbsp;<asp:Literal ID="StudentName" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �������ͣ�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="GiveMoneyType" runat="server" CssClass="asp" TabIndex="2">
                    <asp:ListItem>ס�޷�</asp:ListItem>
                    <asp:ListItem>ˮ���</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="GiveMoneyYear" runat="server" Width="80px" CssClass="asp"
                    TabIndex="3">
                </asp:DropDownList>
                ��&nbsp;<asp:DropDownList ID="GiveMoneyMonth" runat="server" Width="50px" CssClass="asp"
                    TabIndex="4">
                </asp:DropDownList>
                ��&nbsp;<asp:DropDownList ID="GiveMoneyDay" runat="server" Width="50px" CssClass="asp"
                    TabIndex="5">
                </asp:DropDownList>
                ��
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ���ɽ�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="GiveMoney" runat="server" Width="80px" CssClass="asp" TabIndex="6"></asp:TextBox>Ԫ&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="����������"
                    Operator="DataTypeCheck" Type="Currency" ControlToValidate="GiveMoney"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Back" runat="server" Text="����" Font-Size="Medium" 
                    CssClass="btn btn-primary" onclick="Btn_Back_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
