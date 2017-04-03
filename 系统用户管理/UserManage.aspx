<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="UserManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户信息管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <%--<table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/set_user.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>用户信息管理 </font><font size="+1">(带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;用户名： &nbsp;<asp:TextBox ID="username" runat="server" Width="100px" Font-Size="Medium"
                    Height="22px"></asp:TextBox>
                &nbsp;<asp:Button ID="Btn_Query" runat="server" OnClick="Btn_Query_Click" Text="查找"
                    Font-Size="Medium" CssClass="btn btn-primary" />
                &nbsp;<asp:Button ID="Btn_All" runat="server" OnClick="Btn_All_Click" Text="显示所有"
                    Font-Size="Medium" CssClass="btn btn-primary" />
                <font color="red">
                    <asp:Label ID="Label1" runat="server" Text="对不起，没有相关记录！" Visible="False"></asp:Label></font>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px" OnRowDataBound="GridView1_RowDataBound"
                    OnPageIndexChanging="GridView1_PageIndexChanging" OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="adminUsername" HeaderText="用户名" SortExpression="adminUsername">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="adminPassword" HeaderText="密码" SortExpression="adminPassword">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="adminUserrole" HeaderText="用户权限" SortExpression="adminUserrole">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="编辑" ShowEditButton="True">
                            <ControlStyle CssClass="btn" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                            <ControlStyle CssClass="btn" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:CommandField>
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
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                <table width="100%">
                    <tr>
                        <td class="login_right_txt">
                            <img height="30" src="../images/userrole.png" />
                            <span>权&nbsp;&nbsp;&nbsp;限：</span>
                        </td>
                        <td class="login_right_box">
                            &nbsp;<asp:DropDownList ID="Userrole" runat="server" Width="100px" Font-Size="Medium"
                                Font-Names="微软雅黑">
                                <asp:ListItem>管理员</asp:ListItem>
                                <asp:ListItem>宿管</asp:ListItem>
                                <asp:ListItem>学生</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_right_txt">
                            <img height="30" src="../images/user.png" />
                            <span>用户名：</span>
                        </td>
                        <td class="login_right_box">
                            &nbsp;<asp:TextBox ID="TextBox1" runat="server" TabIndex="1" Font-Size="Medium" Font-Names="微软雅黑"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                ErrorMessage="用户名不能为空！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_right_txt">
                            <img height="30" src="../images/password.png" />
                            <span>密&nbsp;&nbsp;&nbsp;码：</span>
                        </td>
                        <td class="login_right_box">
                            &nbsp;<asp:TextBox ID="Password" runat="server" TextMode="Password" TabIndex="2"
                                Font-Size="Medium" Font-Names="微软雅黑"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                                ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 81px">
                        </td>
                        <td align="left">
                            &nbsp;<asp:Label ID="ErrMessage" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 81px">
                        </td>
                        <td height="35" align="left">
                            &nbsp;<asp:Button ID="Btn_Login" runat="server" Text="登录" OnClick="Btn_Login_Click"
                                CssClass="btn btn-primary" TabIndex="3" Font-Size="Medium" />&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Btn_Reset" runat="server" Text="重置" OnClick="Btn_Reset_Click" CssClass="btn btn-primary"
                                TabIndex="4" Font-Size="Medium" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;提示：删除用户后，不能进行还原，只能通过添加方式
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>

    </table>--%>
    </form>
</body>
</html>
