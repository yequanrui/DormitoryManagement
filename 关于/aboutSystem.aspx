<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aboutSystem.aspx.cs" Inherits="aboutSystem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>关于系统</title>
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
    </style>
</head>
<body style="background-color: #FFFFFF; margin-left: 2; margin-top: 2">
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                &nbsp;<img alt="" src="../images/about.png" width="32" height="32" hspace="2" vspace="2"
                    align="middle"><font size="+1"><strong>关于系统</strong></font>
            </td>
        </tr>
    </table>
    <table width="100%" cellspacing="2" cellpadding="3" class="textsmall">
        <tr>
            <td colspan="2" class="tableborder1">
                <img src="../images/print.png" alt="打印" width="15" height="15" hspace="4" vspace="1"
                    align="absmiddle" style="cursor: hand;" onclick="window.print()">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="texttitle">
                <font color="#999999">系统信息</font>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tableborder2">
                <strong>学生公寓信息管理系统</strong>
            </td>
        </tr>
        <tr>
            <td width="50%">
                系统结构：Browser / Server
            </td>
            <td width="50%">
                网页布局：Div+Table+Css
            </td>
        </tr>
        <tr>
            <td width="50%">
                采用技术：ASP.NET
            </td>
            <td width="50%">
                开发工具：Microsoft Visual Studio 2010
            </td>
        </tr>
        <tr>
            <td width="50%">
                数据库：&nbsp;&nbsp; SQL Server 2008
            </td>
            <td width="50%">
                辅助设计：Adobe Photoshop CS6
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tableborder1">
            </td>
        </tr>
    </table>
    <table width="100%" cellspacing="2" cellpadding="3" class="textsmall">
        <tr>
            <td colspan="2" class="texttitle">
                <font color="#999999">系统功能</font>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tableborder2">
            </td>
        </tr>
        <tr>
            <td width="15%">
                学生信息管理：
            </td>
            <td width="85%">
                包括学生专业的设置、学生信息的添加，删除，查询及修改功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                公寓信息管理：
            </td>
            <td width="85%">
                包括公寓信息的添加，删除，查询及修改功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                房间信息管理：
            </td>
            <td width="85%">
                包括房间空余查看、房间信息的添加，删除，查询及修改功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                公寓住宿管理：
            </td>
            <td width="85%">
                包括公寓数据统计、迁出信息查看、学生入住，转移，迁出及信息的查询、修改和导出打印功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                公寓来访管理：
            </td>
            <td width="85%">
                包括来访信息登记，查看和导出打印功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                宿舍缴费管理：
            </td>
            <td width="85%">
                包括欠费信息查看和导出打印、学生缴费信息的添加，删除，查询及修改功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                宿舍报修管理：
            </td>
            <td width="85%">
                包括报修信息登记、报修信息审核、报修结果查看和导出打印功能
            </td>
        </tr>
        <tr>
            <td width="15%" class="style1">
                宿舍卫生管理：
            </td>
            <td width="85%" class="style1">
                包括卫生信息登记、宿舍卫生检查、检查结果查看和导出打印功能
            </td>
        </tr>
        <tr>
            <td width="15%" class="style1">
                宿舍违规管理：
            </td>
            <td width="85%" class="style1">
                包括违规信息登记、宿舍违规审核、违规情况查看和导出打印功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                宿舍评比管理：
            </td>
            <td width="85%">
                包括评比设定、评比结果以及奖状的查看和导出打印功能
            </td>
        </tr>
        <tr>
            <td width="15%">
                系统用户管理：
            </td>
            <td width="85%">
                包括登录日志的查看、用户列表的查看及管理、用户登录密码的设置、不同用户的信息修改功能
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tableborder1">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
