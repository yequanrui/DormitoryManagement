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

public partial class liveInfoUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string studentNumber = Request.QueryString["studentNumber"];
        this.StudentNumber.Text = studentNumber;
        if (!IsPostBack)
        {
            int i;
            for (i = 2001; i <= 2050; i++)
                this.liveInYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            for (i = 1; i <= 12; i++)
                this.LiveInMonth.Items.Add(new ListItem(i.ToString(), i.ToString()));
            for (i = 1; i <= 31; i++)
                this.LiveInDay.Items.Add(new ListItem(i.ToString(), i.ToString()));
            Live live = new Live();
            live.GetLiveInfo(studentNumber); //得到该学生的入住信息
            this.Now_apartmentNo.Text = "<font color=red>" + live.ApartmentNo + "</font>";
            this.Now_roomNo.Text = "<font color=red>" + live.RoomNo + "</font>";
            this.apartmentNo.SelectedValue = live.ApartmentNo;
            this.roomNo.SelectedValue = live.RoomNo;
            this.liveInYear.Text = live.LiveinYear.ToString();
            this.LiveInMonth.Text = live.LiveinMonth.ToString();
            this.LiveInDay.Text = live.LiveinDay.ToString();
            this.liveMemo.Text = live.LiveMemo;
        }
    }

    protected void Btn_ChangeRoom_Click(object sender, EventArgs e)
    {
        Live live = new Live();
        live.StudentNumber = Request.QueryString["studentNumber"];
        live.ApartmentNo = this.apartmentNo.SelectedValue;
        live.RoomNo = this.roomNo.SelectedValue;
        live.LiveinYear = Convert.ToInt16(this.liveInYear.SelectedValue);
        live.LiveinMonth = Convert.ToInt16(this.LiveInMonth.SelectedValue);
        live.LiveinDay = Convert.ToInt16(this.LiveInDay.SelectedValue);
        live.LiveMemo = this.liveMemo.Text;
        if (live.UpdateLiveInfo())
            Response.Write("<script>alert('房间更换成功!');location.href='liveInfoUpdate.aspx?studentNumber=" + live.StudentNumber + "';</script>");
        else
            Response.Write("<script>alert('" + live.ErrMessage + "');</script>");
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("liveInfoManage.aspx");
    }
}
