<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfoUpdate.aspx.cs"
    Inherits="studentInfoUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ѧ����Ϣ�޸�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../laydate/laydate.js" type="text/javascript"></script>
</head>
<body>
    <form name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/student_update.png" width="50px" border="0" hspace="2" align="absmiddle">ѧ��Ϊ<asp:Literal
                    ID="StudentNumber" runat="server"></asp:Literal>��ѧ����Ϣ�޸�<font size="+1"> (��*�ŵ�Ϊ������)</font>
            </th>
        </tr>
        <tr>
            <td align="right" width="36%">
                <br />
                ������
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="StudentName" runat="server" Width="120px" CssClass="asp" TabIndex="1"></asp:TextBox><font
                    color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="StudentName" ErrorMessage="��������Ϊ��"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                �Ա�
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentSex" runat="server" CssClass="asp" TabIndex="2">
                    <asp:ListItem>��</asp:ListItem>
                    <asp:ListItem>Ů</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                ������ò��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentState" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem>��Ա</asp:ListItem>
                    <asp:ListItem>��Ա</asp:ListItem>
                    <asp:ListItem>Ⱥ��</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                ����ѧԺ��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="CollegeName" runat="server" AutoPostBack="True" CssClass="asp"
                    TabIndex="4">
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>�����ϵ</asp:ListItem>
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>���ϵ</asp:ListItem>
                    <asp:ListItem>���ι���ϵ</asp:ListItem>
                    <asp:ListItem>����ϵ</asp:ListItem>
                    <asp:ListItem>�������ϵ</asp:ListItem>
                </asp:DropDownList>
                &nbsp;��������ѧԺ��<asp:Literal ID="NowCollegeName" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                ����רҵ��
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentSpec" runat="server" DataSourceID="StudentSpecDataSource"
                    DataTextField="specialFieldName" DataValueField="specialFieldName" CssClass="asp"
                    TabIndex="5">
                </asp:DropDownList>
                &nbsp;��������רҵ��<asp:Literal ID="NowStudentSpec" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                ���գ�
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentBirthday" runat="server" CssClass="asp" TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                �ֻ����룺
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentTelephone" runat="server" Width="150px" CssClass="asp"
                    placeholder="������ѧ���ֻ���" TabIndex="7"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="StudentTelephone"
                    ErrorMessage="�ֻ���ʽ����ȷ!" ValidationExpression="^1[3|5|7|8|]\d{9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                ��ͥ��ַ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentAddress" runat="server" Width="300px" CssClass="asp"
                    TabIndex="8"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" width="36%">
                ������Ϣ��
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Update" runat="server" OnClick="Btn_Update_Click" Text="����" TabIndex="10"
                    Font-Size="Medium" CssClass="btn btn-primary" />
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
