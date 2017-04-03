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

public partial class visitInfoAdd : System.Web.UI.Page
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
        Visit visit = new Visit();
        visit.Interviewee = this.interviewee.Text;
        visit.Interviewer = this.interviewer.Text;
        visit.Relation = this.relation.Text;
        visit.ApartmentNo = this.apartmentNo.Text;
        visit.RoomNo = this.roomNo.Text;
        visit.ManagerName = this.managerName.Text;
        visit.BeginTime = DateTime.Parse(this.beginTime.Text);
        visit.EndTime = DateTime.Parse(this.endTime.Text);
        visit.InterviewMemo = this.interviewMemo.Text;
        visit.InsertVisitInfo();
        this.ErrMessage.Text = "<font color=red>" + visit.ErrMessage + "</font>";
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("visitInfoAdd.aspx");
    }
}