<%@ Page Language="C#" AutoEventWireup="true" CodeFile="roomInfoAdd.aspx.cs" Inherits="roomInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>������Ϣ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form action="" method="post" name="form1" runat="server" id="Form1">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/room_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>������Ϣ��� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ����ţ�
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="roomNo" runat="server" Width="100px" CssClass="asp" placeholder="�����뷿���"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="roomNo"
                            ErrorMessage="����Ų���Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������Ԣ��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="apartmentNo" runat="server" DataSourceID="apartmentInfoDataSource"
                    DataTextField="apartmentNo" DataValueField="apartmentNo" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �������ͣ�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomType" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem>6�˼�</asp:ListItem>
                    <asp:ListItem>8�˼�</asp:ListItem>
                    <asp:ListItem>10�˼�</asp:ListItem>
                    <asp:ListItem>14�˼�</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �������⣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomPrice" runat="server" Width="100px" CssClass="asp" placeholder="����������"
                    TabIndex="4"></asp:TextBox>Ԫ&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="roomPrice"
                    ErrorMessage="�۸���Ϊ�գ�"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="roomPrice"
                    ErrorMessage="��������ȷ�ļ۸�" Operator="DataTypeCheck" Type="Currency"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �ܴ�λ����
            </td>
            <td>
                &nbsp;<asp:TextBox ID="numberOfBed" runat="server" Width="80px" CssClass="asp" placeholder="�������ܴ�λ"
                    TabIndex="5"></asp:TextBox>��&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="numberOfBed"
                    ErrorMessage="�ܴ�λ����Ϊ�գ�"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="numberOfBed"
                    ErrorMessage="��������ȷ��������" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ʣ�ലλ����
            </td>
            <td>
                &nbsp;<asp:TextBox ID="leftNumberOfBed" runat="server" Width="80px" CssClass="asp"
                    placeholder="������ʣ�ലλ��" TabIndex="6"></asp:TextBox>��&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="leftNumberOfBed"
                    ErrorMessage="ʣ�ലλ����Ϊ�գ�"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="leftNumberOfBed"
                    ErrorMessage="��������ȷ��������" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����绰��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomTelephone" runat="server" CssClass="asp" placeholder="�����뷿��绰"
                    TabIndex="7"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="roomTelephone"
                    ErrorMessage="�绰��ʽ����ȷ!" ValidationExpression="^[0-9]{3,4}-[0-9]{7,8}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ע��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomMemo" runat="server" TextMode="MultiLine" Height="50px"
                    Width="300px" CssClass="asp" TabIndex="8"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal><br />
                <asp:Button ID="Btn_Add" runat="server" Text="���" OnClick="Btn_Add_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="9" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="ȡ��" TabIndex="10"
                    CssClass="btn btn-primary" Font-Size="Medium" />
            </td>
        </tr>
        <asp:SqlDataSource ID="apartmentInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [apartmentNo] FROM [apartmentInfo]"></asp:SqlDataSource>
    </table>
    </form>
    <br>
</body>
</html>
