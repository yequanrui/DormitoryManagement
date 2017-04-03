<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogCheck.aspx.cs" Inherits="LogCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>��¼��־�鿴</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../laydate/laydate.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/log_check.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>��¼��־�鿴</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                ��¼ʱ�䷶Χ��<asp:TextBox ID="start" runat="server" CssClass="asp" placeholder="�����뿪ʼ����"
                    onclick="laydate()" TabIndex="1"></asp:TextBox><strong>--</strong><asp:TextBox ID="end" runat="server"
                        CssClass="asp" placeholder="�������������" onclick="laydate()" TabIndex="2"></asp:TextBox>&nbsp;
                <asp:Button ID="Btn_Query" runat="server" Text="�鿴" OnClick="Btn_Query_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="��ʾ����" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333" GridLines="None"
                    Font-Size="Medium" Width="900px" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField></asp:BoundField>
                        <asp:BoundField DataField="adminUserName" HeaderText="�û���" SortExpression="adminUserName"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="adminUserRole" HeaderText="�û�Ȩ��" SortExpression="adminUserRole"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="loginTime" HeaderText="��¼ʱ��" SortExpression="loginTime"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="logoutTime" HeaderText="�ǳ�ʱ��" SortExpression="logoutTime" />
                        <asp:BoundField HeaderText="����" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                            DataField="operation" SortExpression="operation">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="��ҳ" LastPageText="ĩҳ" Mode="NumericFirstLast" NextPageText="��һҳ"
                        PreviousPageText="��һҳ" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </form>
    <script>
        laydate.skin('danlan');
        var start = {
            elem: '#start',
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
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-12-31 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                begin.max = datas; //������ѡ�ú����ÿ�ʼ�յ��������
            }
        };
        laydate(start);
        laydate(end);
    </script>
</body>
</html>
