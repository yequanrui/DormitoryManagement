<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apartmentInfoManage.aspx.cs"
    Inherits="apartmentInfoManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>公寓信息维护</title>
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form method="post" id="Form1" name="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/apartment_manage.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>公寓信息维护</font>
            </th>
        </tr>
        <tr align="center">
            <td>
                <br />
                &nbsp;公寓类型：<asp:DropDownList ID="apartmentType" runat="server" CssClass="asp" TabIndex="1">
                </asp:DropDownList>
                &nbsp;管理员姓名：<asp:DropDownList ID="managerName" runat="server" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Btn_Del_M" runat="server" OnClick="Btn_Del_M_Click" Text="删除管理员"
                    Font-Size="Medium" CssClass="btn btn-primary" TabIndex="6" Width="120px" />&nbsp;
                <asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="查询" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="3" />&nbsp;
                <asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="4" Width="100px" /><br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" OnRowDataBound="GridView1_RowDataBound" Width="700px" ForeColor="#333333"
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
                        <asp:BoundField DataField="apartmentNo" HeaderText="公寓编号" SortExpression="apartmentNo">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentType" HeaderText="公寓类型" SortExpression="apartmentType">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apartmentTelephone" HeaderText="公寓电话" SortExpression="apartmentTelephone">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="managerName" DataNavigateUrlFormatString="apartmentManagerUpdate.aspx?managerName={0}"
                            DataTextField="managerName" HeaderText="管理员姓名" SortExpression="managerName">
                            <ControlStyle Font-Size="Large" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="managerTelephone" HeaderText="手机号码" SortExpression="managerTelephone">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="apartmentNo" DataNavigateUrlFormatString="apartmentInfoUpdate.aspx?apartmentNo={0}"
                            HeaderText="详情" Text="编辑">
                            <ControlStyle CssClass="btn" />
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
                <asp:CheckBox ID="check_ALL" runat="server" AutoPostBack="True" OnCheckedChanged="check_ALL_CheckedChanged"
                    Text=" 全选" TabIndex="4" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Del" runat="server" OnClick="Btn_Del_Click" Text="删除" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
