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

public partial class illegalInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //当鼠标选择某行时变颜色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    public void GridViewBind()
    {
        Illegal illegal = new Illegal();
        DataSet ds = illegal.GetAllIllegal();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_Solving_Click(object sender, EventArgs e)
    {
        string queryString = "select * from illegalInfo where illegalSolve is null and illegalScore is null";
        DataBase db = new DataBase();
        DataSet ds = db.GetDataSet(queryString);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Btn_Solved_Click(object sender, EventArgs e)
    {
        string queryString = "select * from illegalInfo where illegalSolve is not null and illegalScore is not null";
        DataBase db = new DataBase();
        DataSet ds = db.GetDataSet(queryString);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}