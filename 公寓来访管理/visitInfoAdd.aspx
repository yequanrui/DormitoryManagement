<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visitInfoAdd.aspx.cs" Inherits="visitInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>访客信息登记</title>
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
                <font>访客信息登记 </font><font size="+1">(带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                被访人：
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="interviewee" runat="server" CssClass="asp" placeholder="请输入被访人姓名"
                    TabIndex="1"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="interviewee" ErrorMessage="被访人不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                来访人：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="interviewer" runat="server" CssClass="asp" placeholder="请输入来访人姓名"
                    TabIndex="2"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="interviewer" ErrorMessage="来访人不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                关系：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="relation" runat="server" CssClass="asp" placeholder="请输入双方关系"
                    TabIndex="3"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="relation" ErrorMessage="双方关系不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                被访人公寓：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="apartmentNo" runat="server" CssClass="asp" placeholder="请输入被访人公寓号"
                    TabIndex="4"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server" ControlToValidate="apartmentNo" ErrorMessage="公寓号不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                被访人房间：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="roomNo" runat="server" CssClass="asp" placeholder="请输入被访人房间号"
                    TabIndex="5"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server" ControlToValidate="roomNo" ErrorMessage="房间号不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                管理员姓名：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="managerName" runat="server" CssClass="asp" placeholder="请输入管理员姓名"
                    TabIndex="6"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server" ControlToValidate="managerName" ErrorMessage="管理员姓名不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                来访时间：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="beginTime" runat="server" CssClass="asp" placeholder="请输入来访时间"
                    TabIndex="7"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server" ControlToValidate="beginTime" ErrorMessage="来访时间不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                结束时间：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="endTime" runat="server" CssClass="asp" placeholder="请输入结束时间"
                    TabIndex="8"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                        runat="server" ControlToValidate="endTime" ErrorMessage="结束时间不能为空！"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                备注：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="interviewMemo" runat="server" CssClass="asp" TextMode="MultiLine"
                    Height="50px" Width="300px" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;<asp:Button ID="Btn_Add" runat="server" Text="登记" OnClick="Btn_Add_Click" Font-Size="Medium"
                    CssClass="btn btn-primary" TabIndex="10" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" Text="取消" OnClick="Btn_Cancle_Click" Font-Size="Medium"
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
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-12-31 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
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
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
    </script>
    </form>
</body>
</html>
