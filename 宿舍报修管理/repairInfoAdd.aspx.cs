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


public partial class repairInfoAdd : System.Web.UI.Page
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
        Repair repair = new Repair();
        repair.ApartmentNo = this.apartmentNo.SelectedValue;
        repair.RoomNo = this.roomNo.SelectedValue;
        repair.StudentNumber = this.StudentNumber.Text;
        repair.RepairTime = DateTime.Parse(this.repairTime.Text);
        repair.RepairThing = this.repairThing.Text;
        repair.RepairQuantity = this.repairQuantity.Text;
        repair.RepairReason = this.repairReason.Text;
        repair.AddRepairInfo();
        this.ErrMessage.Text = "<font color=red>" + repair.ErrMessage + "</font>";
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("repairInfoAdd.aspx");
    }
}