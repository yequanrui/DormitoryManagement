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

public partial class healthInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
    }
    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        Health health = new Health();
        health.ApartmentNo = this.apartmentNo.SelectedValue;
        health.RoomNo = this.roomNo.SelectedValue;
        health.HealthTime = DateTime.Parse(this.healthTime.Text);
        health.HealthCheck = this.healthCheck.Text;
        health.HealthScore = this.healthScore.Text;
        health.InsertHealthInfo();
        this.ErrMessage.Text = "<font color=red>" + health.ErrMessage + "</font>";
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("healthInfoAdd.aspx");
    }
}