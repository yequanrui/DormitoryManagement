<%@ Page Language="C#" AutoEventWireup="true" CodeFile="illegalInfoAdd.aspx.cs" Inherits="illegalInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Υ����Ϣ�Ǽ�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../laydate/laydate.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" action="" method="post" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/illegal_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>Υ����Ϣ�Ǽ� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ��Ԣ�ţ�
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="apartmentNo" runat="server" DataSourceID="apartmentInfoDataSource"
                    DataTextField="apartmentNo" DataValueField="apartmentNo" AutoPostBack="True"
                    CssClass="asp" TabIndex="1">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ţ�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomNo" runat="server" AutoPostBack="True" DataSourceID="roomNoDataSource"
                    DataTextField="roomNo" DataValueField="roomNo" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Υ��ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="illegalTime" runat="server" CssClass="asp" placeholder="������Υ��ʱ��"
                    TabIndex="3"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="illegalTime" ErrorMessage="Υ��ʱ�䲻��Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Υ��ԭ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="illegalReason" runat="server" CssClass="asp" placeholder="������Υ��ԭ��"
                    Height="50px" TextMode="MultiLine" Width="300px" TabIndex="4"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ControlToValidate="illegalReason" ErrorMessage="Υ��ԭ����Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="���" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="ȡ��" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" />
                <br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
        <asp:SqlDataSource ID="apartmentInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [apartmentNo] FROM [apartmentInfo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="roomNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [roomNo] FROM [roomInfo] WHERE ([apartmentNo] = @apartmentNo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="apartmentNo" Name="apartmentNo" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </table>
    <script>
        laydate.skin('danlan');
        laydate({
            elem: '#illegalTime',
            event: 'click',
            istime: true,
            format: 'YYYY-MM-DD hh:mm:ss'
        });
    </script>
    </form>
</body>
</html>
