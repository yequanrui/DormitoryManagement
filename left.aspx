<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ѧ����Ԣ��Ϣ����ϵͳleft</title>
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
                        <a href="javascript:void(0)">ѧ����Ϣ����</a></h1>
                    <div id="div_student" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_student1" runat="server" visible="false"><a href="ѧ����Ϣ����/studentInfoAdd.aspx"
                                target="main">ѧ����Ϣ���</a></li>
                            <li id="li_student2" runat="server" visible="false"><a href="ѧ����Ϣ����/studentInfoManage.aspx"
                                target="main">ѧ����Ϣά��</a></li>
                            <li id="li_student3" runat="server" visible="false"><a href="ѧ����Ϣ����/studentSpecManage.aspx"
                                target="main">ѧ��רҵ����</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_apartment" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">��Ԣ��Ϣ����</a></h1>
                    <div id="div_apartment" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_apartment1" runat="server" visible="false"><a href="��Ԣ��Ϣ����/apartmentInfoAdd.aspx"
                                target="main">��Ԣ��Ϣ���</a></li>
                            <li id="li_apartment2" runat="server" visible="false"><a href="��Ԣ��Ϣ����/apartmentManagerAdd.aspx"
                                target="main">�޹���Ϣ���</a></li>
                            <li id="li_apartment3" runat="server" visible="false"><a href="��Ԣ��Ϣ����/apartmentInfoManage.aspx"
                                target="main">��Ԣ��Ϣά��</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_room" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">������Ϣ����</a></h1>
                    <div id="div_room" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_room1" runat="server" visible="false"><a href="������Ϣ����/roomInfoAdd.aspx"
                                target="main">������Ϣ���</a></li>
                            <li id="li_room2" runat="server" visible="false"><a href="������Ϣ����/roomInfoManage.aspx"
                                target="main">������Ϣά��</a></li>
                            <li id="li_room3" runat="server" visible="false"><a href="������Ϣ����/roomInfoCheck.aspx"
                                target="main">�������鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_live" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">��Ԣס�޹���</a></h1>
                    <div id="div_live" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_live0" runat="server" visible="false"><a href="��Ԣס�޹���/Statistics.aspx"
                                target="main">��Ԣ����ͳ��</a></li>
                            <li id="li_live1" runat="server" visible="false"><a href="��Ԣס�޹���/liveInfoAdd.aspx"
                                target="main">��ס��Ϣ���</a></li>
                            <li id="li_live2" runat="server" visible="false"><a href="��Ԣס�޹���/liveInfoManage.aspx"
                                target="main">ס����Ϣά��</a></li>
                            <li id="li_live3" runat="server" visible="false"><a href="��Ԣס�޹���/outInfoCheck.aspx"
                                target="main">Ǩ����¼�鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_visit" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">��Ԣ���ù���</a></h1>
                    <div id="div_visit" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_visit1" runat="server" visible="false"><a href="��Ԣ���ù���/visitInfoAdd.aspx"
                                target="main">������Ϣ�Ǽ�</a></li>
                            <li id="li_visit2" runat="server" visible="false"><a href="��Ԣ���ù���/visitInfoCheck.aspx"
                                target="main">������Ϣ�鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_money" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">����ɷѹ���</a></h1>
                    <div id="div_money" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_money1" runat="server" visible="false"><a href="����ɷѹ���/moneyInfoAdd.aspx"
                                target="main">�ɷ���Ϣ���</a></li>
                            <li id="li_money2" runat="server" visible="false"><a href="����ɷѹ���/moneyInfoManage.aspx"
                                target="main">�ɷ���Ϣά��</a></li>
                            <li id="li_money3" runat="server" visible="false"><a href="����ɷѹ���/moneyInfoCheck.aspx"
                                target="main">Ƿ����Ϣ�鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_repair" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">���ᱨ�޹���</a></h1>
                    <div id="div_repair" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_repair1" runat="server" visible="false"><a href="���ᱨ�޹���/repairInfoAdd.aspx"
                                target="main">������Ϣ�Ǽ�</a></li>
                            <li id="li_repair2" runat="server" visible="false"><a href="���ᱨ�޹���/repairInfoManage.aspx"
                                target="main">���ᱨ�����</a></li>
                            <li id="li_repair3" runat="server" visible="false"><a href="���ᱨ�޹���/repairInfoCheck.aspx"
                                target="main">���޽���鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_health" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">������������</a></h1>
                    <div id="div_health" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_health1" runat="server" visible="false"><a href="������������/healthInfoAdd.aspx"
                                target="main">�������Ǽ�</a></li>
                            <li id="li_health2" runat="server" visible="false"><a href="������������/healthInfoCheck.aspx"
                                target="main">������鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_illegal" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">����Υ�����</a></h1>
                    <div id="div_illegal" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_illegal1" runat="server" visible="false"><a href="����Υ�����/illegalInfoAdd.aspx"
                                target="main">Υ����Ϣ�Ǽ�</a></li>
                            <li id="li_illegal2" runat="server" visible="false"><a href="����Υ�����/illegalInfoManage.aspx"
                                target="main">����Υ�洦��</a></li>
                            <li id="li_illegal3" runat="server" visible="false"><a href="����Υ�����/illegalInfoCheck.aspx"
                                target="main">�������鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_appraisal" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">�������ȹ���</a></h1>
                    <div id="div_appraisal" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_appraisal1" runat="server" visible="false"><a href="�������ȹ���/appraisalSet.aspx"
                                target="main">�����趨</a></li>
                            <li id="li_appraisal2" runat="server" visible="false"><a href="�������ȹ���/appraisalInfoCheck.aspx"
                                target="main">���Ƚ���鿴</a></li>
                        </ul>
                    </div>
                    <h1 id="h1_system" class="type" runat="server" visible="false">
                        <a href="javascript:void(0)">ϵͳ�û�����</a></h1>
                    <div id="div_system" class="content" runat="server" visible="false">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li id="li_system1" runat="server" visible="false"><a href="ϵͳ�û�����/LogCheck.aspx"
                                target="main">��¼��־�鿴</a></li>
                            <li id="li_system2" runat="server" visible="false"><a href="ϵͳ�û�����/UserManage.aspx"
                                target="main">�û���Ϣ����</a></li>
                            <li id="li_system3" runat="server" visible="false"><a href="ϵͳ�û�����/apartmentManagerUpdate.aspx?managerName=<%=Session["managerName"]%>"
                                target="main">�޹���Ϣ�޸�</a></li>
                            <li id="li_system4" runat="server" visible="false"><a href="ϵͳ�û�����/studentInfoUpdate.aspx?studentNumber=<%=Session["studentNumber"]%>"
                                target="main">ѧ����Ϣ�޸�</a></li>
                            <li id="li_system5" runat="server" visible="false"><a href="ϵͳ�û�����/password.aspx"
                                target="main">��¼�������</a></li>
                        </ul>
                    </div>
                    <h1 class="type">
                        <a href="javascript:void(0)">����</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/menu_topline.gif" width="182" height="5" />
                                </td>
                            </tr>
                        </table>
                        <ul class="MM">
                            <li><a href="����/aboutAuthor.aspx" target="main">������Ϣ</a></li>
                            <li><a href="����/aboutSystem.aspx" target="main">ϵͳ��Ϣ</a></li>
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
