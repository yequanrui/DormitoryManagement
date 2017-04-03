<%@ Page Language="C#" AutoEventWireup="true" CodeFile="outInfoAdd.aspx.cs" Inherits="outInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Ǩ����Ϣ�Ǽ�</title>
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
                <img src="../images/live_out_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                ѧ��Ϊ<asp:Literal ID="studentNumber" runat="server"></asp:Literal>��Ǩ����Ϣ�Ǽ�
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ѧ��������
            </td>
            <td>
                <br />
                &nbsp;<asp:Literal ID="studentName" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ���ڹ�Ԣ��
            </td>
            <td>
                &nbsp;<asp:Literal ID="apartmentNo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ���ڷ��䣺
            </td>
            <td>
                &nbsp;<asp:Literal ID="roomNo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Ǩ��ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="outTime" runat="server" CssClass="asp" placeholder="������Ǩ��ʱ��"
                    TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                Ǩ��ԭ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="outReason" runat="server" Style="text-align: left" Width="300px"
                    CssClass="asp" placeholder="������Ǩ��ԭ��" TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <br />
                &nbsp;<asp:Button ID="Btn_Out" runat="server" Text="Ǩ��" OnClick="Btn_Out_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />
                &nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_Back" runat="server" Text="����" OnClick="Btn_Back_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="4" />
            </td>
        </tr>
    </table>
    <script>
        laydate.skin('danlan');
        laydate({
            elem: '#outTime',
            event: 'click',
            format: 'YYYY-MM-DD'
        });
    </script>
    </form>
</body>
</html>
