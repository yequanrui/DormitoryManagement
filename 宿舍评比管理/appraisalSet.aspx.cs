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
using System.IO;
using System.Text;
using StudentApartment.BusinessLogicLayer;
public partial class appraisalSet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        if (!IsPostBack)
        {
            //先初始化学年下拉框的内容
            ListItem li = new ListItem("请选择", "");
            this.appraisalYear.Items.Add(li);
            Appraisal appraisal = new Appraisal();
            DataSet ds = appraisal.GetAppraisalYear();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds.Tables[0].Rows[i];
                li = new ListItem(dr["appraisalYear"].ToString(), dr["appraisalYear"].ToString());
                this.appraisalYear.Items.Add(li);
            }
            //再初始化学期下拉框的内容
            ListItem li2 = new ListItem("请选择", "");
            this.appraisalTerm.Items.Add(li2);
            DataSet ds2 = appraisal.GetAppraisalTerm();
            for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds2.Tables[0].Rows[i];
                li2 = new ListItem(dr["appraisalTerm"].ToString(), dr["appraisalTerm"].ToString());
                this.appraisalTerm.Items.Add(li2);
            }
        }
    }

    protected void Btn_AddRoom_Click(object sender, EventArgs e)
    {
        Appraisal appraisal = new Appraisal();
        appraisal.AppraisalYear = this.appraisalYear.Text;
        appraisal.AppraisalTerm = this.appraisalTerm.Text;
        if (appraisal.AddAppraisalRoom())
            Response.Write("<script>alert('评比宿舍添加成功！');</script>");
        else
            Response.Write("<script>alert('" + appraisal.ErrMessage + "');</script>");
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        Appraisal appraisal = new Appraisal();
        string appraisalYear = this.appraisalYear.SelectedValue;
        string appraisalTerm = this.appraisalTerm.SelectedValue;
        DataSet ds = appraisal.QueryAppraisalSet(appraisalYear, appraisalTerm);
        DataRow dr = ds.Tables[0].Rows[0];
        this.basicScoreH.Text = dr["basicScoreH"].ToString();
        this.healthScale.Text = dr["healthScale"].ToString();
        this.basicScoreI.Text = dr["basicScoreI"].ToString();
        this.illegalScale.Text = dr["illegalScale"].ToString();
        this.totalScoreH.Text = appraisal.QueryTotalScoreH(appraisalYear);
        this.totalScoreI.Text = appraisal.QueryTotalScoreI(appraisalYear);
    }

    protected void Btn_AddCalc_Click(object sender, EventArgs e)
    {
        Appraisal appraisal = new Appraisal();
        appraisal.AppraisalYear = this.appraisalYear.Text;
        appraisal.AppraisalTerm = this.appraisalTerm.Text;
        appraisal.BasicScoreH = this.basicScoreH.Text;
        appraisal.HealthScale = this.healthScale.Text;
        appraisal.BasicScoreI = this.basicScoreI.Text;
        appraisal.IllegalScale = this.illegalScale.Text;
        if (appraisal.AddAppraisalCalc())
            Response.Write("<script>alert('计算公式添加成功！');</script>");
        else
            Response.Write("<script>alert('" + appraisal.ErrMessage + "');</script>");
    }

    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        Appraisal appraisal = new Appraisal();
        appraisal.AppraisalYear = this.appraisalYear.Text;
        appraisal.AppraisalTerm = this.appraisalTerm.Text;
        appraisal.BasicScoreH = this.basicScoreH.Text;
        appraisal.HealthScale = this.healthScale.Text;
        appraisal.BasicScoreI = this.basicScoreI.Text;
        appraisal.IllegalScale = this.illegalScale.Text;
        if (appraisal.UpdateCalc())
            Response.Write("<script>alert('计算公式更新成功!');</script>");
    }

    protected void Btn_Calc_Click(object sender, EventArgs e)
    {
        Appraisal appraisal = new Appraisal();
        appraisal.AppraisalYear = this.appraisalYear.Text;
        appraisal.AppraisalTerm = this.appraisalTerm.Text;
        appraisal.TotalScoreH = this.totalScoreH.Text;
        appraisal.TotalScoreI = this.totalScoreI.Text;
        if (appraisal.CalcAppraisalScore())
            Response.Write("<script>alert('计算并更新成功！');</script>");
        else
            Response.Write("<script>alert('" + appraisal.ErrMessage + "');</script>");
    }
}