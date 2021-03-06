<%@ Page Language="C#" AutoEventWireup="true" CodeFile="healthInfoAdd.aspx.cs" Inherits="healthInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>卫生检查登记</title>
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
                <img src="../images/health_Add.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>卫生检查登记 </font><font size="+1">(带*号的为必填项)</font>
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
                检查时间：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="healthTime" runat="server" CssClass="asp" placeholder="请输入检查时间"
                    TabIndex="3"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="healthTime" ErrorMessage="检查时间不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                检查结果：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="healthCheck" runat="server" CssClass="asp" placeholder="请输入检查结果"
                    TextMode="MultiLine" Height="50px" Width="300px" TabIndex="4"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ControlToValidate="healthCheck" ErrorMessage="检查结果不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                检查得分：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="healthScore" runat="server" CssClass="asp" Width="65px" TabIndex="4"></asp:TextBox>分
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                    runat="server" ControlToValidate="healthScore" ErrorMessage="检查得分不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Add" runat="server" Text="登记" OnClick="Btn_Add_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="5" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" Text="取消" OnClick="Btn_Cancle_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="6" />
                &nbsp;&nbsp;
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
            elem: '#healthTime',
            event: 'click',
            istime: true,
            format: 'YYYY-MM-DD hh:mm:ss'
        });
    </script>
    </form>
</body>
</html>
