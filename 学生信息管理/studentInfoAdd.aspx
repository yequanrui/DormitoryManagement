<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfoAdd.aspx.cs" Inherits="studentInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>学生信息添加</title>
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
                <font>学生信息添加 </font><font size="+1">(带*号的为必填项)</font>
            </th>
        </tr>
        <tr>
            <td width="36%" align="right">
                <br />
                学号：
            </td>
            <td>
                <br />
                &nbsp;<asp:TextBox ID="StudentNumber" runat="server" Width="150px" CssClass="asp"
                    placeholder="请输入学号" TabIndex="1"></asp:TextBox>
                <font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="StudentNumber" ErrorMessage="学号不能为空！"></asp:RequiredFieldValidator>
                </font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                姓名：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentName" runat="server" Width="120px" CssClass="asp" placeholder="请输入姓名"
                    TabIndex="2"></asp:TextBox><font color="red">&nbsp;*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="StudentName" ErrorMessage="姓名不能为空"></asp:RequiredFieldValidator></font>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                性别：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentSex" runat="server" CssClass="asp" TabIndex="3">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                政治面貌：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="StudentState" runat="server" CssClass="asp" TabIndex="4">
                    <asp:ListItem>团员</asp:ListItem>
                    <asp:ListItem>党员</asp:ListItem>
                    <asp:ListItem>群众</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                所在学院：
            </td>
            <td>
                &nbsp;<asp:DropDownList ID="CollegeName" runat="server" DataTextField="collegeName"
                    DataValueField="collegeName" AutoPostBack="True" CssClass="asp" TabIndex="5">
                    <asp:ListItem>法律系</asp:ListItem>
                    <asp:ListItem>计算机系</asp:ListItem>
                    <asp:ListItem>经济系</asp:ListItem>
                    <asp:ListItem>会计系</asp:ListItem>
                    <asp:ListItem>旅游管理系</asp:ListItem>
                    <asp:ListItem>外语系</asp:ListItem>
                    <asp:ListItem>艺术设计系</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                专业：
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
                生日：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentBirthday" runat="server" CssClass="asp" placeholder="请输入生日"
                    TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                手机号码：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentTelephone" runat="server" Width="150px" CssClass="asp"
                    placeholder="请输入学生手机号" TabIndex="8"></asp:TextBox>&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="StudentTelephone"
                    ErrorMessage="手机格式不正确!" ValidationExpression="^1[3|5|7|8|]\d{9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                家庭地址：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentAddress" runat="server" Width="300px" CssClass="asp"
                    placeholder="请输入地址" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="36%" align="right">
                备注：
            </td>
            <td>
                &nbsp;<asp:TextBox ID="StudentMemo" runat="server" Height="50px" TextMode="MultiLine"
                    Width="300px" CssClass="asp" TabIndex="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="添加" TabIndex="11"
                    CssClass="btn btn-primary" Font-Size="Medium" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_Cancle" runat="server" OnClick="Btn_Cancle_Click" Text="取消" TabIndex="12"
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
