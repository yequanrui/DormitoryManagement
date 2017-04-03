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

public partial class illegalInfoSolve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        //{
        //    Response.Redirect("../error.aspx");
        //}
        string illegalId = Request.QueryString["illegalId"];
        Illegal illegal = new Illegal();
        if (false == illegal.GetIllegalInfo(Convert.ToInt32(illegalId)))
            Response.Write("<script>alert('" + illegal.ErrMessage + "');location.href='illegalInfoManage.aspx'</script>");
        if (!IsPostBack)
        {
            this.apartmentNo.Text = illegal.ApartmentNo;
            this.roomNo.Text = illegal.RoomNo;
            this.illegalTime.Text = illegal.IllegalTime.ToString("yyyy/MM/dd HH:mm:ss");
            this.illegalReason.Text = illegal.IllegalReason;
            this.illegalSolve.Text = illegal.IllegalSolve;
            this.illegalScore.Text = illegal.IllegalSolve;
        }
    }

    protected void Btn_Solve_Click(object sender, EventArgs e)
    {
        Illegal illegal = new Illegal();
        illegal.IllegalId = Convert.ToInt32(Request.QueryString["illegalId"]);
        illegal.IllegalSolve = this.illegalSolve.Text;
        illegal.IllegalScore = this.illegalScore.Text;
        if (illegal.UpdateSolvingIllegal())
            Response.Write("<script>alert('违规信息处理成功!');location.href='illegalInfoManage.aspx';</script>");
        else
            Response.Write("<script>alert('" + illegal.ErrMessage + "');location.href='illegalInfoAudit.aspx?illegalId=" + Request.QueryString["illegalId"] + "';</script>");
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("illegalInfoManage.aspx");
    }
}