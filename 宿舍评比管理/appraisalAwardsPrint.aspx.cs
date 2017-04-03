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

public partial class appraisalAwardsPrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string apartmentNo = Request.QueryString["apartmentNo"];
        string appraisalGrade = Request.QueryString["appraisalGrade"];
        Appraisal appraisal = new Appraisal();
        appraisal.LoadAppraisalInfo(apartmentNo, appraisalGrade);
        if (!IsPostBack)
        {
            this.apartmentNo.Text = appraisal.ApartmentNo;
            this.roomNo.Text = appraisal.RoomNo;
            this.appraisalYear.Text = appraisal.AppraisalYear;
            this.appraisalYear1.Text = (Convert.ToInt32(appraisal.AppraisalYear)+1).ToString();
            this.appraisalTerm.Text = appraisal.AppraisalTerm;
            this.appraisalGrade.Text = appraisal.AppraisalGrade;
            this.appraisalAward.Text = appraisal.AppraisalAward;
            this.appraisalTime.Text = appraisal.AppraisalTime.ToString("yyyy年MM月dd日");
        }
    }
}