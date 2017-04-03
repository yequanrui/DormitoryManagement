<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appraisalSet.aspx.cs" Inherits="appraisalSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>���������趨</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/print.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/appraisal_set.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>���������趨</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                ������أ�
            </td>
            <td>
                <br />
                &nbsp;ѧ��<asp:DropDownList ID="appraisalYear" runat="server" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
                &nbsp;ѧ��<asp:DropDownList ID="appraisalTerm" runat="server" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
                <font color="red">��������Ҫѡ��</font>
                <br />
                &nbsp;<asp:Button ID="Btn_AddRoom" runat="server" Text="�����������" OnClick="Btn_AddRoom_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" Width="130px" TabIndex="4" />
                &nbsp;<asp:Button ID="Btn_Query" runat="server" Text="��ѯ������ֵ" OnClick="Btn_Query_Click"
                    Font-Size="Medium" CssClass="btn btn-primary" Width="130px" TabIndex="5" />
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                &nbsp;&nbsp;���㹫ʽ��
            </td>
            <td>
                <br />
                &nbsp;(����������<asp:TextBox ID="basicScoreH" runat="server" CssClass="asp" Width="50px"
                    TabIndex="5"></asp:TextBox>
                +�����÷�<asp:TextBox ID="totalScoreH" runat="server" CssClass="asp" Width="50px" TabIndex="6"></asp:TextBox>)
                *��������<asp:TextBox ID="healthScale" runat="server" CssClass="asp" Width="50px" TabIndex="7"></asp:TextBox>%
                <br />
                &nbsp;+(���������<asp:TextBox ID="basicScoreI" runat="server" CssClass="asp" Width="50px"
                    TabIndex="8"></asp:TextBox>
                -Υ��۷�<asp:TextBox ID="totalScoreI" runat="server" CssClass="asp" Width="50px" TabIndex="9"></asp:TextBox>)
                *Υ�����<asp:TextBox ID="illegalScale" runat="server" CssClass="asp" Width="50px" TabIndex="10"></asp:TextBox>%
                <br />
                &nbsp;<asp:Button ID="Btn_AddCalc" runat="server" Text="��Ӽ��㹫ʽ" OnClick="Btn_AddCalc_Click"
                    Font-Size="Medium" Width="130px" CssClass="btn btn-primary" TabIndex="11" />
                <font color="red">��Ҫѡѧ���ѧ�ڣ�������ֺͱ�����</font>
                <br />
                &nbsp;<asp:Button ID="Btn_Update" runat="server" Text="���¼��㹫ʽ" OnClick="Btn_Update_Click"
                    Font-Size="Medium" Width="130px" CssClass="btn btn-primary" TabIndex="11" />
                <font color="red">����ѯ��ֵ��Ķ����ܸ��£�</font>
                <br />
                &nbsp;<asp:Button ID="Btn_Calc" runat="server" Text="�������ȵ÷�" OnClick="Btn_Calc_Click"
                    Font-Size="Medium" Width="130px" CssClass="btn btn-primary" TabIndex="12" />
            </td>
        </tr>
        <asp:SqlDataSource ID="roomNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [roomNo] FROM [roomInfo] WHERE ([apartmentNo] = @apartmentNo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="apartmentNo" Name="apartmentNo" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </table>
    </form>
</body>
</html>
