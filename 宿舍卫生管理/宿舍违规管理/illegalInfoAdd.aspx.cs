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

public partial class illegalInfoAdd : System.Web.UI.Page
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
        Illegal illegal = new Illegal();
        illegal.ApartmentNo = this.apartmentNo.SelectedValue;
        illegal.RoomNo = this.roomNo.SelectedValue;
        illegal.IllegalTime = DateTime.Parse(this.illegalTime.Text);
        illegal.IllegalReason = this.illegalReason.Text;
        illegal.AddIllegalInfo();
        this.ErrMessage.Text = "<font color=red>" + illegal.ErrMessage + "</font>";
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("illegalInfoAdd.aspx");
    }
}