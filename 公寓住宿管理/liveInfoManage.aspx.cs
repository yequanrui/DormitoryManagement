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

public partial class liveInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        if (!IsPostBack)
        {
            //初始化公寓编号下拉框的内容
            ListItem li = new ListItem("请选择", "");
            this.apartmentNo.Items.Add(li);
            Apartment apartment = new Apartment();
            DataSet ds = apartment.GetAllApartment();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds.Tables[0].Rows[i];
                li = new ListItem(dr["apartmentNo"].ToString(), dr["apartmentNo"].ToString());
                this.apartmentNo.Items.Add(li);
            }
            GridViewBind();
        }
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string queryString = "select * from liveInfoView where studentNumber like '%" + this.StudentNumber.Text + "%'";
        queryString += " and studentName like '%" + this.StudentName.Text + "%'";
        queryString += " and apartmentNo like '%" + this.apartmentNo.SelectedValue + "%'";
        queryString += " and roomNo like '%" + this.roomNo.Text + "%'";
        DataSet ds = (new Live()).GetQueryLiveInfo(this.StudentNumber.Text, this.StudentName.Text, this.apartmentNo.SelectedValue, this.roomNo.Text);
        this.GridView1.DataSourceID = null;
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
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
            string studentNumer = e.Row.Cells[0].Text; //得到该学号
            Literal liveTime = (Literal)e.Row.Cells[4].FindControl("liveInTime");
            liveTime.Text = (new Live()).GetLiveTime(studentNumer);  //得到该学生的入住时间
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    public void GridViewBind()
    {
        Live live = new Live();
        DataSet ds = live.GetAllLive();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}
