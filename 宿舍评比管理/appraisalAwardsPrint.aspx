<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appraisalAwardsPrint.aspx.cs"
    Inherits="appraisalAwardsPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>评分奖状打印</title>
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
                <font>评分奖状打印</font>
                <input type="button" name="print" onclick="preview()" value="预览并打印" style="font-size: medium;
                    width: 110px" class="btn btn-primary" />
            </th>
        </tr>
        <tr>
            <td>
                <!--startprint-->
                <div>
                    <div class="award_txt">
                        <asp:Label ID="apartmentNo" runat="server"></asp:Label>幢<asp:Label ID="roomNo" runat="server"></asp:Label>宿舍：<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;在<asp:Label ID="appraisalYear" runat="server"></asp:Label>-<asp:Label
                            ID="appraisalYear1" runat="server"></asp:Label>学年度第<asp:Label ID="appraisalTerm"
                                runat="server"></asp:Label>学期里荣获第<asp:Label ID="appraisalGrade" runat="server"></asp:Label>，荣获“<asp:Label
                                    ID="appraisalAward" runat="server"></asp:Label>”称号。<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;特发此证，以资鼓励<br />
                        <br />
                        <br />
                        <br />
                        <p>
                            华南师范大学增城学院公寓管理联合会<br />
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
