<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfoManage.aspx.cs"
    Inherits="studentInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>学生信息维护</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/student_manage.png" width="50px" border="0" hspace="2" align="absmiddle" />
                <font>学生信息维护</font>
            </th>
        </tr>
        <tr>
            <td align="center">
                <br />
                &nbsp;学号：<asp:TextBox ID="StudentNumber" runat="server" Width="120px" CssClass="asp"
                    TabIndex="1"></asp:TextBox>
                &nbsp;姓名：<asp:TextBox ID="StudentName" runat="server" Width="65px" CssClass="asp"
                    TabIndex="2"></asp:TextBox>
                &nbsp;所在专业：<asp:DropDownList ID="StudentSpec" runat="server" CssClass="asp" TabIndex="3">
                </asp:DropDownList>
                &nbsp;&nbsp;<asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="查询"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="4" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" /><br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" Width="900px" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333"
                    GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                            <ItemTemplate>
                                <asp:CheckBox ID="checkBox" runat="server" /></ItemTemplate>
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="studentNumber" HeaderText="学号" SortExpression="studentNumber">
                            <ControlStyle Width="150px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentName" HeaderText="姓名" SortExpression="studentName">
                            <ControlStyle Width="100px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentSex" HeaderText="性别" SortExpression="studentSex">
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentState" HeaderText="政治面貌" SortExpression="studentState">
                            <ControlStyle Width="60px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentSpec" HeaderText="专业" SortExpression="studentSpec">
                            <ControlStyle Width="120px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentBirthday" HeaderText="生日" SortExpression="studentBirthday"
                            DataFormatString="{0:yyyy年MM月dd日}">
                            <ControlStyle Width="50px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="studentTelephone" HeaderText="手机号" SortExpression="studentTelephone">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="studentNumber" DataNavigateUrlFormatString="studentInfoUpdate.aspx?studentNumber={0}"
                            HeaderText="详情" Text="编辑">
                            <ControlStyle Width="30px" CssClass="btn" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerSettings FirstPageText="首页" LastPageText="末页" Mode="NumericFirstLast" NextPageText="下一页"
                        PreviousPageText="上一页" />
                    <PagerStyle ForeColor="White" BackColor="#284775" Font-Underline="True" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:CheckBox ID="check_ALL" runat="server" Text=" 全选" OnCheckedChanged="check_ALL_CheckedChanged"
                    AutoPostBack="True" TabIndex="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Del" runat="server" Text="删除" OnClick="Btn_Del_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="7" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
