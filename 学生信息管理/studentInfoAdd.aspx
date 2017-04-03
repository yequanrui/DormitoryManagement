<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfoAdd.aspx.cs" Inherits="studentInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ѧ����Ϣ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../laydate/laydate.js" type="text/javascript"></script>
</head>
<body>
    <form action="" method="post" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/student_add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>ѧ����Ϣ��� </font><font size="+1">(��*�ŵ�Ϊ������)</font>
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
                    placeholder="������ѧ��" TabIndex="1"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="StudentNumber" ErrorMessage="ѧ�Ų���Ϊ�գ�"></asp:RequiredFieldValidator>
                </font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentName" runat="server" Width="120px" CssClass="asp" placeholder="����������"
                    TabIndex="2"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="StudentName" ErrorMessage="��������Ϊ��"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �Ա�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentSex" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem>��</asp:ListItem>
                    <asp:ListItem>Ů</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ������ò��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentState" runat="server" CssClass="asp" TabIndex="4">
                    <asp:ListItem>��Ա</asp:ListItem>
                    <asp:ListItem>��Ա</asp:ListItem>
                    <asp:ListItem>Ⱥ��</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ����ѧԺ��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="CollegeName" runat="server" DataTextField="collegeName"
                    DataValueField="collegeName" AutoPostBack="True" CssClass="asp" TabIndex="5">
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>�����ϵ</asp:ListItem>
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>���ϵ</asp:ListItem>
                    <asp:ListItem>���ι���ϵ</asp:ListItem>
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>�������ϵ</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                רҵ��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentSpec" runat="server" DataSourceID="StudentSpecDataSource"
                    DataTextField="specialFieldName" DataValueField="specialFieldName" CssClass="asp"
                    TabIndex="6">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ���գ�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentBirthday" runat="server" CssClass="asp" placeholder="����������"
                    TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �ֻ����룺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentTelephone" runat="server" Width="150px" CssClass="asp"
                    placeholder="������ѧ���ֻ���" TabIndex="8"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="StudentTelephone"
                    ErrorMessage="�ֻ���ʽ����ȷ!" ValidationExpression="^1[3|5|7|8|]\d{9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ͥ��ַ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentAddress" runat="server" Width="300px" CssClass="asp"
                    placeholder="�������ַ" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                ��ע��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="���" TabIndex="11"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="ȡ��" TabIndex="12"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;<br />
                <asp:Literal ID="ErrMessage" runat="server"></asp:Literal>
            </td>
        </tr>
        <asp:SqlDataSource ID="StudentSpecDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [specialFieldName] FROM [collegespecInfo] WHERE ([collegeName] = @collegeName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CollegeName" Name="collegeName" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </table>
    <script>
        laydate.skin('danlan');
        laydate({
            elem: '#StudentBirthday',
            event: 'click',
            format: 'YYYY-MM-DD'
        });
    </script>
    </form>
</body>
</html>
