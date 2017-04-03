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

public partial class repairInfoAudit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string repairId = Request.QueryString["repairId"];
        Repair repair = new Repair();
        if (false == repair.GetRepairInfo(Convert.ToInt32(repairId)))
            Response.Write("<script>alert('" + repair.ErrMessage + "');location.href='repairInfoManage.aspx'</script>");
        if (!IsPostBack)
        {
            this.apartmentNo.Text = repair.ApartmentNo;
            this.roomNo.Text = repair.RoomNo;
            this.StudentName.Text = repair.StudentName;
            this.StudentTelephone.Text = repair.StudentTelephone;
            this.roomTelephone.Text = repair.RoomTelephone;
            this.repairTime.Text = repair.RepairTime.ToString("yyyy/MM/dd HH:mm:ss");
            this.repairThing.Text = repair.RepairThing;
            this.repairQuantity.Text = repair.RepairQuantity;
            this.repairReason.Text = repair.RepairReason;
        }
    }

    protected void Btn_Audit_Click(object sender, EventArgs e)
    {
        Repair repair = new Repair();
        repair.RepairId = Convert.ToInt32(Request.QueryString["repairId"]);
        repair.RepairAduit = this.repairAduit.Text;
        repair.RepairResult = this.repairResult.Text;
        if (repair.UpdateRepairInfo())
            Response.Write("<script>alert('报修信息审核成功!');location.href='repairInfoManage.aspx';</script>");
        else
            Response.Write("<script>alert('" + repair.ErrMessage + "');location.href='repairInfoAudit.aspx?repairId=" + Request.QueryString["repairId"] + "';</script>");
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("repairInfoManage.aspx");
    }
}