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
using StudentApartment.DataAccessLayer;
using StudentApartment.BusinessLogicLayer;

public partial class LogCheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        //{
        //    Response.Redirect("../error.aspx");
        //}
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //鼠标放到行上时变色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int dataIndex = e.Row.DataItemIndex;
            //当鼠标选择某行时变颜色
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
        }
        //自动编号
        if (e.Row.RowIndex != -1)
        {
            int id = e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string queryString = "select * from log where loginTime between '"+ this.start.Text;
        queryString += "' and '" + this.end.Text + "'";
        DataSet ds = (new DataBase()).GetDataSet(queryString);
        this.GridView1.DataSourceID = null;
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    public void GridViewBind()
    {
        Admin admin = new Admin();
        DataSet ds = admin.GetlogInfo();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}