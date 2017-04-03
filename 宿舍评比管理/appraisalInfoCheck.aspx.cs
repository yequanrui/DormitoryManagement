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

public partial class appraisalInfoCheck : System.Web.UI.Page
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
            //然后初始化学年下拉框的内容
            ListItem li2 = new ListItem("请选择", "");
            this.appraisalYear.Items.Add(li2);
            Appraisal appraisal = new Appraisal();
            DataSet ds2 = appraisal.GetAppraisalYear();
            for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds2.Tables[0].Rows[i];
                li2 = new ListItem(dr["appraisalYear"].ToString(), dr["appraisalYear"].ToString());
                this.appraisalYear.Items.Add(li2);
            }
            //再初始化学期下拉框的内容
            ListItem li3 = new ListItem("请选择", "");
            this.appraisalTerm.Items.Add(li3);
            DataSet ds3 = appraisal.GetAppraisalTerm();
            for (int i = 0; i < ds3.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds3.Tables[0].Rows[i];
                li3 = new ListItem(dr["appraisalTerm"].ToString(), dr["appraisalTerm"].ToString());
                this.appraisalTerm.Items.Add(li3);
            }
            //最后绑定GridView控件中的数据
            GridViewBind();
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
        Appraisal appraisal = new Appraisal();
        DataSet ds = appraisal.GetAllAppraisal();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string apartmentNo = this.apartmentNo.SelectedValue;
        string appraisalYear = this.appraisalYear.SelectedValue;
        string appraisalTerm = this.appraisalTerm.SelectedValue;
        DataSet ds = (new Appraisal()).QueryAppraisalInfo(apartmentNo, appraisalYear, appraisalTerm);
        this.GridView1.DataSourceID = null;
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }

    protected void Btn_Export_Click(object sender, EventArgs e)
    {
        string str = "宿舍评分信息表.xls";
        GridView1.AllowPaging = false;
        GridViewBind();
        GridViewToExcel(GridView1, "application/ms-excel", str);
    }

    public static void GridViewToExcel(Control ctrl, string FileType, string FileName)
    {
        HttpContext.Current.Response.Charset = "GB2312";
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8; //注意编码
        HttpContext.Current.Response.AppendHeader("Content-Disposition",
            "attachment;filename=" + HttpUtility.UrlEncode(FileName, System.Text.Encoding.UTF8).ToString());
        HttpContext.Current.Response.ContentType = FileType; //image/JPEG;text/HTML;image/GIF;vnd.ms-excel/msword 
        ctrl.Page.EnableViewState = false;
        StringWriter tw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(tw);
        ctrl.RenderControl(hw);
        HttpContext.Current.Response.Write(tw.ToString());
        HttpContext.Current.Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}