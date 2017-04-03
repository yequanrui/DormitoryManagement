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
public partial class moneyInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标选择某行时变颜色
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            int moneyId = Convert.ToInt32(this.GridView1.DataKeys[e.Row.DataItemIndex][0]);
            Money money = new Money();
            e.Row.Cells[6].Text = money.GetMoneyTime(moneyId);
        }
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string studentNumber = this.StudentNumber.Text;
        string studentName = this.StudentName.Text;
        string giveMoneyType = this.GiveMoneyType.SelectedValue;
        Money money = new Money();
        this.GridView1.DataSourceID = null;
        this.GridView1.DataSource = money.QueryMoneyInfo(studentNumber, studentName, giveMoneyType);
        this.GridView1.DataBind();
    }

    protected void Btn_Del_Click(object sender, EventArgs e)
    {
        bool IsDelSuccess = true;
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)this.GridView1.Rows[i].Cells[0].FindControl("checkBox");
            if (chk.Checked)
            {
                //得到要删除的交费编号,然后执行删除操作
                int moneyId = Convert.ToInt32(this.GridView1.DataKeys[i][0]);
                Money money = new Money();
                if(!money.DeleteMoneyRecord(moneyId))
                    IsDelSuccess = false;
            }
        }
        if(IsDelSuccess)
            Response.Write("<script>alert('删除成功！');location.href='moneyInfoManage.aspx';</script>");
        else
           Response.Write("<script>alert('删除时发生了错误！');location.href='moneyInfoManage.aspx';</script>");
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

    public void GridViewBind()
    {
        Money money = new Money();
        DataSet ds = money.GetAllMoney();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}
