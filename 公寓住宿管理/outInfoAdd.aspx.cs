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
using StudentApartment.BusinessLogicLayer;

public partial class outInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string studentNumber = Request.QueryString["studentNumber"];
        this.studentNumber.Text = studentNumber;
        Live live = new Live();
        if (false==live.GetOutInfo(studentNumber)) //得到该学生的迁出信息
            Response.Write("<script>alert('" + live.ErrMessage + "');location.href='liveInfoManage.aspx'</script>");
        if (!IsPostBack)
        {
            this.studentName.Text = live.StudentName;
            this.apartmentNo.Text = live.ApartmentNo;
            this.roomNo.Text = live.RoomNo;
        }
    }

    protected void Btn_Out_Click(object sender, EventArgs e)
    {
        Live live = new Live();
        live.StudentNumber = Request.QueryString["studentNumber"];
        live.RoomNo = this.roomNo.Text;
        live.OutTime = DateTime.Parse(this.outTime.Text);
        live.OutReason = this.outReason.Text;
        if (live.AddOutInfo())
            Response.Write("<script>alert('迁出信息登记成功!');location.href='outInfoAdd.aspx?studentNumber=" + live.StudentNumber + "';</script>");
        else
            Response.Write("<script>alert('" + live.ErrMessage + "');</script>");
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("liveInfoManage.aspx");
    }
}