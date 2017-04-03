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

public partial class moneyInfoUpdate : System.Web.UI.Page
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
                this.GiveMoneyYear.Items.Add(new ListItem(i.ToString(),i.ToString()));
            for (i = 1; i <= 12; i++)
                this.GiveMoneyMonth.Items.Add(new ListItem(i.ToString(),i.ToString()));
            for (i = 1; i <= 31; i++)
                this.GiveMoneyDay.Items.Add(new ListItem(i.ToString(),i.ToString()));
            //下面在界面上更新各个数据的显示
            string moneyId = Request.QueryString["moneyId"];
            Money money = new Money();
            money.GetMoneyInfo(Convert.ToInt32(moneyId));
            this.StudentNumber.Text = money.StudentNumber;
            this.StudentName.Text = money.StudentName;
            this.GiveMoneyType.SelectedValue = money.GiveMoneyType;
            this.GiveMoneyYear.SelectedValue = money.GiveMoneyYear.ToString();
            this.GiveMoneyMonth.SelectedValue = money.GiveMoneyMonth.ToString();
            this.GiveMoneyDay.SelectedValue = money.GiveMoneyDay.ToString();
            this.GiveMoney.Text = money.GiveMoney.ToString();
        }
    }

    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        Money money = new Money();
        money.MoneyId = Convert.ToInt32(Request.QueryString["moneyId"]);
        money.StudentNumber = this.StudentNumber.Text;
        money.GiveMoneyType = this.GiveMoneyType.SelectedValue;
        money.GiveMoneyYear = Convert.ToInt16(this.GiveMoneyYear.SelectedValue);
        money.GiveMoneyMonth = Convert.ToInt16(this.GiveMoneyMonth.SelectedValue);
        money.GiveMoneyDay = Convert.ToInt16(this.GiveMoneyDay.SelectedValue);
        money.GiveMoney = Convert.ToSingle(this.GiveMoney.Text);
        if (money.Update())
            Response.Write("<script>alert('更新成功!');location.href='moneyInfoManage.aspx';</script>");
        else
            Response.Write("<script>alert('" + money.ErrMessage + "');location.href='moneyInfoUpdate.aspx?moneyId=" + Request.QueryString["moneyId"] + "';</script>");
    }
    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("moneyInfoManage.aspx");
    }
}