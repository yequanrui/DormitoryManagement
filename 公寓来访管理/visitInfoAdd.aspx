<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visitInfoAdd.aspx.cs" Inherits="visitInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>�ÿ���Ϣ�Ǽ�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../laydate/laydate.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartment_visit_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>�ÿ���Ϣ�Ǽ� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                �����ˣ�
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="interviewee" runat="server" CssClass="asp" placeholder="�����뱻��������"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="interviewee" ErrorMessage="�����˲���Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �����ˣ�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="interviewer" runat="server" CssClass="asp" placeholder="����������������"
                    TabIndex="2"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="interviewer" ErrorMessage="�����˲���Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ϵ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="relation" runat="server" CssClass="asp" placeholder="������˫����ϵ"
                    TabIndex="3"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="relation" ErrorMessage="˫����ϵ����Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �����˹�Ԣ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="apartmentNo" runat="server" CssClass="asp" placeholder="�����뱻���˹�Ԣ��"
                    TabIndex="4"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server" ControlToValidate="apartmentNo" ErrorMessage="��Ԣ�Ų���Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �����˷��䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomNo" runat="server" CssClass="asp" placeholder="�����뱻���˷����"
                    TabIndex="5"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server" ControlToValidate="roomNo" ErrorMessage="����Ų���Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����Ա������
            </td>
            <td>
                &nbsp;<asp:TextBox ID="managerName" runat="server" CssClass="asp" placeholder="���������Ա����"
                    TabIndex="6"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server" ControlToValidate="managerName" ErrorMessage="����Ա��������Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="beginTime" runat="server" CssClass="asp" placeholder="����������ʱ��"
                    TabIndex="7"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server" ControlToValidate="beginTime" ErrorMessage="����ʱ�䲻��Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ʱ�䣺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="endTime" runat="server" CssClass="asp" placeholder="���������ʱ��"
                    TabIndex="8"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server" ControlToValidate="endTime" ErrorMessage="����ʱ�䲻��Ϊ�գ�"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ע��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="interviewMemo" runat="server" CssClass="asp" TextMode="MultiLine"
                    Height="50px" Width="300px" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Add" runat="server" Text="�Ǽ�" OnClick="Btn_Add_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="10" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" Text="ȡ��" OnClick="Btn_Cancle_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="11" />
                &nbsp;&nbsp;
                <br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <script>
        laydate.skin('danlan');
        var start = {
            elem: '#beginTime',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //�趨��С����Ϊ��ǰ����
            max: '2099-12-31 23:59:59', //�������
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //��ʼ��ѡ�ú����ý����յ���С����
                end.start = datas //�������յĳ�ʼֵ�趨Ϊ��ʼ��
            }
        };
        var end = {
            elem: '#endTime',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-12-31 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //������ѡ�ú����ÿ�ʼ�յ��������
            }
        };
        laydate(start);
        laydate(end);
    </script>
    </form>
</body>
</html>
