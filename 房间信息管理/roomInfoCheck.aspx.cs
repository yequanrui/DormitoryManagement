using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using StudentApartment.DataAccessLayer;
using StudentApartment.BusinessLogicLayer;

public partial class roomInfoCheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
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
        Room room = new Room();
        DataSet ds = room.GetAllRoom();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_Full_Click(object sender, EventArgs e)
    {
        string queryString = "select roomNo 房间号,apartmentNo 公寓号,roomType 类型,roomPrice 价格,numberOfBed 床数,leftNumberOfBed 剩余床数,numberOfBed-leftNumberOfBed 已住床数 from roomInfo where apartmentNo="
            + this.apartmentNo.SelectedValue + "and leftNumberOfBed=0";
        DataBase db = new DataBase();
        DataSet ds = db.GetDataSet(queryString);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Btn_Empty_Click(object sender, EventArgs e)
    {
        string queryString = "select roomNo 房间号,apartmentNo 公寓号,roomType 类型,roomPrice 价格,numberOfBed 床数,leftNumberOfBed 剩余床数 from roomInfo where apartmentNo="
            + this.apartmentNo.SelectedValue + "and leftNumberOfBed!=0";
        DataBase db = new DataBase();
        DataSet ds = db.GetDataSet(queryString);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}
