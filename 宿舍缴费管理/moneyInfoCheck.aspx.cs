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

public partial class moneyInfoCheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        //GridViewBind();
    }

    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        //当鼠标选择某行时变颜色
    //        e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
    //        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
    //    }
    //}

    //public void GridViewBind()
    //{
    //    Money money = new Money();
    //    ArrayList shouldGiveMoneyList = money.GetShouldGiveMoneyList();
    //    this.GridView1.DataSource = shouldGiveMoneyList;
    //    this.GridView1.DataBind();
    //}

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        Money money = new Money();
        string studentNumber =this.StudentNumber.Text;
        this.shouldGiveMoney.Text = money.ShouldGiveMoney(studentNumber).ToString();
        this.realGiveMoney.Text = money.RealGiveMoney(studentNumber).ToString();
        this.alsoGiveMoney.Text = (money.ShouldGiveMoney(studentNumber) - money.RealGiveMoney(studentNumber)).ToString();
    }
}
