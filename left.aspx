<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>学生公寓信息管理系统left</title>
    <script src="js/prototype.lite.js" type="text/javascript"></script>
    <script src="js/moo.fx.js" type="text/javascript"></script>
    <script src="js/moo.fx.pack.js" type="text/javascript"></script>
    <link href="css/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
        <tr>
            <td width="182" valign="top">
                <div id="container">
                    <h1 id="h1_student" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">学生信息管理</a></h1>
                    <div id="div_student" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_student1" runat="server" visible="false"><a href="学生信息管理/studentInfoAdd.aspx"
                                target="main">学生信息添加</a></li>
                            <li id="li_student2" runat="server" visible="false"><a href="学生信息管理/studentInfoManage.aspx"
                                target="main">学生信息维护</a></li>
                            <li id="li_student3" runat="server" visible="false"><a href="学生信息管理/studentSpecManage.aspx"
                                target="main">学生专业管理</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_apartment" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">公寓信息管理</a></h1>
                    <div id="div_apartment" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_apartment1" runat="server" visible="false"><a href="公寓信息管理/apartmentInfoAdd.aspx"
                                target="main">公寓信息添加</a></li>
                            <li id="li_apartment2" runat="server" visible="false"><a href="公寓信息管理/apartmentManagerAdd.aspx"
                                target="main">宿管信息添加</a></li>
                            <li id="li_apartment3" runat="server" visible="false"><a href="公寓信息管理/apartmentInfoManage.aspx"
                                target="main">公寓信息维护</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_room" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">房间信息管理</a></h1>
                    <div id="div_room" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_room1" runat="server" visible="false"><a href="房间信息管理/roomInfoAdd.aspx"
                                target="main">房间信息添加</a></li>
                            <li id="li_room2" runat="server" visible="false"><a href="房间信息管理/roomInfoManage.aspx"
                                target="main">房间信息维护</a></li>
                            <li id="li_room3" runat="server" visible="false"><a href="房间信息管理/roomInfoCheck.aspx"
                                target="main">房间空余查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_live" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">公寓住宿管理</a></h1>
                    <div id="div_live" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_live0" runat="server" visible="false"><a href="公寓住宿管理/Statistics.aspx"
                                target="main">公寓数据统计</a></li>
                            <li id="li_live1" runat="server" visible="false"><a href="公寓住宿管理/liveInfoAdd.aspx"
                                target="main">入住信息添加</a></li>
                            <li id="li_live2" runat="server" visible="false"><a href="公寓住宿管理/liveInfoManage.aspx"
                                target="main">住宿信息维护</a></li>
                            <li id="li_live3" runat="server" visible="false"><a href="公寓住宿管理/outInfoCheck.aspx"
                                target="main">迁出记录查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_visit" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">公寓来访管理</a></h1>
                    <div id="div_visit" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_visit1" runat="server" visible="false"><a href="公寓来访管理/visitInfoAdd.aspx"
                                target="main">来访信息登记</a></li>
                            <li id="li_visit2" runat="server" visible="false"><a href="公寓来访管理/visitInfoCheck.aspx"
                                target="main">来访信息查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_money" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">宿舍缴费管理</a></h1>
                    <div id="div_money" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_money1" runat="server" visible="false"><a href="宿舍缴费管理/moneyInfoAdd.aspx"
                                target="main">缴费信息添加</a></li>
                            <li id="li_money2" runat="server" visible="false"><a href="宿舍缴费管理/moneyInfoManage.aspx"
                                target="main">缴费信息维护</a></li>
                            <li id="li_money3" runat="server" visible="false"><a href="宿舍缴费管理/moneyInfoCheck.aspx"
                                target="main">欠费信息查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_repair" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">宿舍报修管理</a></h1>
                    <div id="div_repair" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_repair1" runat="server" visible="false"><a href="宿舍报修管理/repairInfoAdd.aspx"
                                target="main">报修信息登记</a></li>
                            <li id="li_repair2" runat="server" visible="false"><a href="宿舍报修管理/repairInfoManage.aspx"
                                target="main">宿舍报修审核</a></li>
                            <li id="li_repair3" runat="server" visible="false"><a href="宿舍报修管理/repairInfoCheck.aspx"
                                target="main">报修结果查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_health" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">宿舍卫生管理</a></h1>
                    <div id="div_health" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_health1" runat="server" visible="false"><a href="宿舍卫生管理/healthInfoAdd.aspx"
                                target="main">卫生检查登记</a></li>
                            <li id="li_health2" runat="server" visible="false"><a href="宿舍卫生管理/healthInfoCheck.aspx"
                                target="main">检查结果查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_illegal" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">宿舍违规管理</a></h1>
                    <div id="div_illegal" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_illegal1" runat="server" visible="false"><a href="宿舍违规管理/illegalInfoAdd.aspx"
                                target="main">违规信息登记</a></li>
                            <li id="li_illegal2" runat="server" visible="false"><a href="宿舍违规管理/illegalInfoManage.aspx"
                                target="main">宿舍违规处理</a></li>
                            <li id="li_illegal3" runat="server" visible="false"><a href="宿舍违规管理/illegalInfoCheck.aspx"
                                target="main">处理结果查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_appraisal" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">宿舍评比管理</a></h1>
                    <div id="div_appraisal" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_appraisal1" runat="server" visible="false"><a href="宿舍评比管理/appraisalSet.aspx"
                                target="main">评比设定</a></li>
                            <li id="li_appraisal2" runat="server" visible="false"><a href="宿舍评比管理/appraisalInfoCheck.aspx"
                                target="main">评比结果查看</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_system" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">系统用户管理</a></h1>
                    <div id="div_system" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_system1" runat="server" visible="false"><a href="系统用户管理/LogCheck.aspx"
                                target="main">登录日志查看</a></li>
                            <li id="li_system2" runat="server" visible="false"><a href="系统用户管理/UserManage.aspx"
                                target="main">用户信息管理</a></li>
                            <li id="li_system3" runat="server" visible="false"><a href="系统用户管理/apartmentManagerUpdate.aspx?managerName=<%=Session["managerName"]%>"
                                target="main">宿管信息修改</a></li>
                            <li id="li_system4" runat="server" visible="false"><a href="系统用户管理/studentInfoUpdate.aspx?studentNumber=<%=Session["studentNumber"]%>"
                                target="main">学生信息修改</a></li>
                            <li id="li_system5" runat="server" visible="false"><a href="系统用户管理/password.aspx"
                                target="main">登录密码更改</a></li>
                        </ul>
                    </div>
                    <h1 class="type">
                        <a href="javascript:void(0)">关于</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li><a href="关于/aboutAuthor.aspx" target="main">作者信息</a></li>
                            <li><a href="关于/aboutSystem.aspx" target="main">系统信息</a></li>
                        </ul>
                    </div>
                </div>
                <script type="text/javascript">
                    var contents = document.getElementsByClassName('content');
                    var toggles = document.getElementsByClassName('type');
                    var myAccordion = new fx.Accordion(toggles, contents, { opacity: true, duration: 400 });
                    myAccordion.showThisHideOpen(contents[0]);
                </script>
            </td>
        </tr>
    </table>
</body>
</html>
