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

public partial class liveInfoAdd : System.Web.UI.Page
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
                this.LiveinYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            for (i = 1; i <= 12; i++)
                this.LiveinMonth.Items.Add(new ListItem(i.ToString(),i.ToString()));
            for (i = 1; i <= 31; i++)
                this.LiveinDay.Items.Add(new ListItem(i.ToString(),i.ToString()));
        }
    }

    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        Live live = new Live();
        live.StudentNumber = this.StudentNumber.Text;
        live.ApartmentNo = this.apartmentNo.SelectedValue;
        live.RoomNo = this.roomNo.SelectedValue;
        live.LiveinYear = Convert.ToInt16(this.LiveinYear.SelectedValue);
        live.LiveinMonth = Convert.ToInt16(this.LiveinMonth.SelectedValue);
        live.LiveinDay = Convert.ToInt16(this.LiveinDay.SelectedValue);
        live.LiveMemo = this.LiveMemo.Text;
        if (live.AddLiveInfo())
            this.ErrMessage.Text = "<font color=red>入住成功!</font>";
        else
            this.ErrMessage.Text = "<font color=red>" + live.ErrMessage + "</font>";
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        Response.Redirect("liveInfoAdd.aspx");
    }
}
