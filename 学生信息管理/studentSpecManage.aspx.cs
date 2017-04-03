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
using StudentApartment.DataAccessHelper;
using System.Data.SqlClient;

public partial class studentSpecManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
    }

    protected void check_ALL_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            GridViewRow gr = this.GridView1.Rows[i];
            CheckBox chk = (CheckBox)gr.Cells[0].FindControl("checkBox");
            chk.Checked = this.check_ALL.Checked; //跟随全选按扭的状态变化;
        }
    }
   
    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        string collegeName = this.CollegeName.SelectedValue;
        string specialFieldName = this.specialFieldName.Text;
        if (specialFieldName == "")
        {
            Response.Write ("<script>alert('专业输入不能为空!');</script>");
            return;
        }
        string queryString = "select * from collegespecInfo where specialFieldName=" + SqlString.GetQuotedString(specialFieldName);
        DataBase db = new DataBase();
        if (db.GetRecord(queryString))
        {
            Response.Write("<script>alert('该专业已经存在！');</script>");
            return;
        }
        string insertString = "insert into collegespecInfo(specialFieldName,collegeName) values (";
        insertString += SqlString.GetQuotedString(specialFieldName) + ",";
        insertString += SqlString.GetQuotedString(collegeName) + ")";
        if (db.InsertOrUpdate(insertString)<0)
            Response.Write("<script>alert('添加专业失败！');</script>");
        Response.Write("<script>alert('添加专业成功！');location.href='fieldSet.aspx';</script>");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标选择某行时变颜色
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)gr.Cells[0].FindControl("checkBox");
            if (chk.Checked) //如果要删除该学生
            {
                string specialFieldName = gr.Cells[1].Text;
                string queryString = "select * from studentInfo where studentSpec=" + SqlString.GetQuotedString(specialFieldName);
                DataBase db = new DataBase();
                if (db.GetRecord(queryString))
                    Response.Write("<script>alert('该专业下还有学生信息，不能删除!');</script>");
                else
                {
                    string deleteString = "delete from collegespecInfo where specialFieldName=" + SqlString.GetQuotedString(specialFieldName);
                    db.InsertOrUpdate(deleteString);
                    Response.Write("<script>alert('" + specialFieldName + " 专业删除成功!');location.href='fieldSet.aspx';;</script>");
                }
            }
        }
    }
}
