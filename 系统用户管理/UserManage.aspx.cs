using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using StudentApartment.BusinessLogicLayer;

public partial class UserManage : System.Web.UI.Page
{
    
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
    //    {
    //        Response.Redirect("../error.aspx");
    //    }
    //}

    //protected void Search_Click(object sender, EventArgs e)
    //{
    //    string adminUsername = username.Text.Trim();
    //    if (adminUsername == string.Empty)
    //    {
    //        Response.Write("<script>alert('请输入用户名进行查询！！')</script>");
    //        Sql.GridToView(nowSql, GridView1);
    //        return;
    //    }
    //    string sqlstr = "select * from admin where adminUsername ='" + adminUsername + "'";
    //    int s = Sql.UpdataSql(sqlstr);
    //    if (s > 0)
    //    {
    //        GridView1.Visible = true;
    //        Sql.GridToView(sqlstr, GridView1);
    //        Label1.Visible = false;
    //    }
    //    else
    //    {
    //        Label1.Visible = true;
    //        GridView1.Visible = false;
    //    }
    //}

    //protected void all_Click(object sender, EventArgs e)
    //{
    //    GridView1.Visible = true;
    //    Sql.GridToView(nowSql, GridView1);
    //    Label1.Visible = false;
    //}

    //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView1.PageIndex = e.NewPageIndex;
    //}

    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)        //更新数据
    //{
    //    string adminUsername = ((TextBox)(this.GridView1.Rows[e.RowIndex].Cells[0].Controls[0])).Text.ToString();
    //    string adminPassword = ((TextBox)(this.GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString();
    //    string adminUserrole = ((TextBox)(this.GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString();
    //    int s = Sql.InsertSql("update admin set adminUsername=@adminUsername,adminPassword=@adminPassword,adminUserrole=@adminUserrole", new SqlParameter("UserName", adminUsername), new SqlParameter("PassWord", adminPassword), new SqlParameter("adminUserrole", adminUserrole));
    //    this.GridView1.EditIndex = -1;
    //    Sql.GridToView(nowSql, GridView1);
    //}

    //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    this.GridView1.EditIndex = e.NewEditIndex;
    //    Sql.GridToView(nowSql, GridView1);
    //}

    //protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)     //改变页的操作
    //{
    //    this.GridView1.PageIndex = e.NewPageIndex;
    //}

    //protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    this.GridView1.EditIndex = -1;
    //    Sql.GridToView(nowSql, GridView1);
    //}

    //protected void Button1_Click(object sender, EventArgs e)       //添加用户的操作
    //{
    //    string adminUsername = TextBox1.Text.Trim();
    //    string adminPassword = TextBox2.Text.Trim();
    //    string adminUserrole = DropDownList1.Text.Trim();
    //    if (adminUsername == string.Empty || adminPassword == string.Empty)
    //    {
    //        Response.Write("<script>alert('输入不能为空')</script>");
    //        return;
    //    }
    //    if (adminUserrole == "管理员")         //判断权限
    //    {
    //        adminUserrole = "1";
    //    }
    //    else if (adminUserrole == "教务人员")
    //    {
    //        adminUserrole = "2";
    //    }
    //    else
    //    {
    //        adminUserrole = "3";
    //    }
    //    int s = Sql.InsertSql("insert into admin(adminUsername,adminPassword,adminUserrole) values(,'" + adminUsername + "','" + adminPassword + "','" + adminUserrole + "')");
    //    if (s > 0)
    //    {
    //        Response.Write("<script>alert('添加用户成功！')</script>");
    //        Sql.GridToView(nowSql, GridView1);
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('对不起，添加用户失败！')</script>");
    //    }
    //}
}
