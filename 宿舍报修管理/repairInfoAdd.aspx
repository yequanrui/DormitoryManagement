<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repairInfoAdd.aspx.cs" Inherits="repairInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>报修信息登记</title>
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
                <font>报修信息登记 </font><font size="+1">(带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                公寓号：
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
                房间号：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="roomNo" runat="server" AutoPostBack="True" DataSourceID="roomNoDataSource"
                    DataTextField="roomNo" DataValueField="roomNo" CssClass="asp" TabIndex="2">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                报修人学号：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentNumber" runat="server" CssClass="asp" placeholder="请输入学号"
                    TabIndex="3"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                    runat="server" ControlToValidate="StudentNumber" ErrorMessage="学号不能为空！"></asp:RequiredFieldValidator>
                </font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                报修时间：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairTime" runat="server" CssClass="asp" placeholder="请输入报修时间"
                    TabIndex="4"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="repairTime" ErrorMessage="报修时间不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                报修物品：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairThing" runat="server" CssClass="asp" placeholder="请输入报修物品"
                    TabIndex="5"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="repairThing" ErrorMessage="报修物品不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                报修数量：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairQuantity" runat="server" CssClass="asp" placeholder="请输入报修数量"
                    TabIndex="6"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="repairQuantity" ErrorMessage="报修数量不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                报修原因：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="repairReason" runat="server" Height="50px" TextMode="MultiLine"
                    CssClass="asp" placeholder="请输入报修原因" Width="300px" TabIndex="7"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                    runat="server" ControlToValidate="repairReason" ErrorMessage="报修原因不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="添加" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="8" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="取消" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="9" />
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
            elem: '#repairTime',
            event: 'click',
            istime: true,
            format: 'YYYY-MM-DD hh:mm:ss'
        });
    </script>
    </form>
</body>
</html>
