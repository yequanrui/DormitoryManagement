<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>学生公寓信息管理系统</title>
    <link href="css/errorstyle.css" rel="stylesheet" type="text/css" />
</head>
<frameset rows="64,*,10%" frameborder="1" framespacing="1">
    <noframes>
        <body>
            <div class="error">
                <p>
                    <span>4</span><span>0</span><span>4</span></p>
                <p>
                    很抱歉，您所用的浏览器不支持框架功能，请更换新的浏览器！</p>
            </div>
        </body>
    </noframes>
    <frame src="top.aspx" noresize="noresize" frameborder="0" name="topFrame" scrolling="no"
        marginwidth="0" marginheight="0" target="main" />
    <frameset cols="200,*" id="frame">
        <frame src="left.aspx" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0"
            frameborder="0" scrolling="no" target="main" />
        <frame src="right.aspx" name="main" marginwidth="0" marginheight="0" frameborder="0"
            scrolling="auto" target="_self" />
    </frameset>
    <frame src="bottom.aspx" noresize="noresize" frameborder="0" name="bottomFrame" scrolling="no"
        marginwidth="0" marginheight="0" target="main" />
</frameset>
</html>
