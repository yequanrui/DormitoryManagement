<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appraisalAwardsPrint.aspx.cs"
    Inherits="appraisalAwardsPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>���ֽ�״��ӡ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/print.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr class="a1">
            <th>
                <img src="../images/print.png" width="50px" border="0" hspace="2" align="absmiddle">
                <font>���ֽ�״��ӡ</font>
                <input type="button" name="print" onclick="preview()" value="Ԥ������ӡ" style="font-size: medium;
                    width: 110px" class="btn btn-primary" />
            </th>
        </tr>
        <tr>
            <td>
                <!--startprint-->
                <div>
                    <div class="award_txt">
                        <asp:Label ID="apartmentNo" runat="server"></asp:Label>��<asp:Label ID="roomNo" runat="server"></asp:Label>���᣺<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;��<asp:Label ID="appraisalYear" runat="server"></asp:Label>-<asp:Label
                            ID="appraisalYear1" runat="server"></asp:Label>ѧ��ȵ�<asp:Label ID="appraisalTerm"
                                runat="server"></asp:Label>ѧ�����ٻ��<asp:Label ID="appraisalGrade" runat="server"></asp:Label>���ٻ�<asp:Label
                                    ID="appraisalAward" runat="server"></asp:Label>���ƺš�<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;�ط���֤�����ʹ���<br />
                        <br />
                        <br />
                        <br />
                        <p>
                            ����ʦ����ѧ����ѧԺ��Ԣ�������ϻ�<br />
                            <asp:Label ID="appraisalTime" runat="server"></asp:Label></p>
                    </div>
                    <img src="../images/award.png" class="award_pic" />
                </div>
                <!--endprint-->
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
