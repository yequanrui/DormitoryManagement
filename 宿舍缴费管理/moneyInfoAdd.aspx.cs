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

public partial class moneyInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        if (!IsPostBack)
        {
            int i;
            for (i = 2001; i <= 2050; i++)
                this.GiveMoneyYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            for (i = 1; i <= 12; i++)
                this.GiveMoneyMonth.Items.Add(new ListItem(i.ToString(),i.ToString()));
            for (i = 1; i <= 31; i++)
                this.GiveMoneyDay.Items.Add(new ListItem(i.ToString(),i.ToString()));
        }
    }
    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        Money money = new Money();
        money.StudentNumber = this.StudentNumber.Text;
        money.GiveMoneyType = this.GiveMoneyType.SelectedValue;
        money.GiveMoneyYear = Convert.ToInt16(this.GiveMoneyYear.SelectedValue);
        money.GiveMoneyMonth = Convert.ToInt16(this.GiveMoneyMonth.SelectedValue);
        money.GiveMoneyDay = Convert.ToInt16(this.GiveMoneyDay.SelectedValue);
        money.GiveMoney = Convert.ToSingle(this.GiveMoney.Text);
        if (money.InsertMoney())
            this.ErrMessage.Text = "<font color=red>交费成功!</font>";
        else
            this.ErrMessage.Text = "<font color=red>" + money.ErrMessage + "</font>";
    }
    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("moneyInfoAdd.aspx");
    }
}
