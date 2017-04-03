<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>系统数据统计</title>
    <link href="../css/mainstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/rightstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" name="form1" method="post" runat="server">
    <table width="100%">
        <tr class="a1">
            <th colspan="8">
                <img src="../images/statistics.png" width="40px" border="0" hspace="2" align="absmiddle">
                <font>系统数据统计</font>
            </th>
        </tr>
        <tr>
            <td align="right" width="45%">
                <br />
                学院(系)：
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="CollegeName" runat="server" AutoPostBack="True" CssClass="asp"
                    TabIndex="1" Width="150px">
                    <asp:ListItem>请选择</asp:ListItem>
                    <asp:ListItem>法律系</asp:ListItem>
                    <asp:ListItem>计算机系</asp:ListItem>
                    <asp:ListItem>经济系</asp:ListItem>
                    <asp:ListItem>会计系</asp:ListItem>
                    <asp:ListItem>旅游管理系</asp:ListItem>
                    <asp:ListItem>外语系</asp:ListItem>
                    <asp:ListItem>艺术设计系</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Btn_Stat1" runat="server" Text="统计" Font-Size="Medium" CssClass="btn btn-primary"
                    TabIndex="2" OnClick="Btn_Stat1_Click" />
            </td>
        </tr>
        <tr>
            <td align="right" width="45%">
                <br />
                专业：
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="StudentSpec" runat="server" DataSourceID="StudentSpecDataSource"
                    DataTextField="specialFieldName" DataValueField="specialFieldName" CssClass="asp"
                    TabIndex="3" Width="150px">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Btn_Stat2" runat="server" Text="统计" Font-Size="Medium" CssClass="btn btn-primary"
                    TabIndex="4" OnClick="Btn_Stat2_Click" />
            </td>
        </tr>
        <tr>
            <td align="right" width="45%">
                <br />
                公寓号：
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="apartmentNo" runat="server" AutoPostBack="True" CssClass="asp"
                    TabIndex="3" Width="150px">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Btn_Stat3" runat="server" Text="统计" Font-Size="Medium" CssClass="btn btn-primary"
                    TabIndex="6" OnClick="Btn_Stat3_Click" />
            </td>
        </tr>
        <tr>
            <td align="right" width="45%">
                <br />
                房间号：
            </td>
            <td>
                <br />
                &nbsp;<asp:DropDownList ID="roomNo" runat="server" DataSourceID="roomNoSource" DataTextField="roomNo"
                    DataValueField="roomNo" CssClass="asp" TabIndex="7" Width="150px">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="Btn_Stat4" runat="server" Text="统计" Font-Size="Medium" CssClass="btn btn-primary"
                    TabIndex="8" OnClick="Btn_Stat4_Click" />
            </td>
        </tr>
        <tr>
            <td align="right" width="45%">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    ShowFooter="True" HorizontalAlign="Right">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="Medium"
                        HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerSettings FirstPageText="" LastPageText="" NextPageText="" PreviousPageText="" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Bold="False" Font-Size="Medium"
                        HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
            <td>
                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    ShowFooter="True" HorizontalAlign="Left">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="Medium"
                        HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerSettings FirstPageText="" LastPageText="" NextPageText="" PreviousPageText="" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Bold="False" Font-Size="Medium"
                        HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center"
                        VerticalAlign="Middle" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="StudentSpecDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [specialFieldName] FROM [collegespecInfo] WHERE ([collegeName] = @collegeName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CollegeName" Name="collegeName" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="roomNoSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [roomNo] FROM [roomInfo] WHERE ([apartmentNo] = @apartmentNo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="apartmentNo" Name="apartmentNo" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
