﻿using System;
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
using StudentApartment.DataAccessLayer;
using StudentApartment.BusinessLogicLayer;

public partial class repairInfoCheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        //{
        //    Response.Redirect("../error.aspx");
        //}
        GridViewBind();
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
        Repair repair = new Repair();
        DataSet ds = repair.GetAuditedRepair();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string queryString = "select * from repairInfo where repairTime between '" + this.beginDate.Text;
        queryString += "' and '" + this.endDate.Text + "'";
        DataSet ds = (new DataBase()).GetDataSet(queryString);
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
        string str = "宿舍报修信息表.xls";
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