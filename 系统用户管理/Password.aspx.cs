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

public partial class Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
    }
    protected void Btn_ChangePassword_Click(object sender, EventArgs e)
    {
        Admin admin = new Admin();
        admin.AdminUserName = Session["adminUserName"].ToString();
        admin.AdminPassword = this.NewPassword.Text;
        if (admin.ChangePassword())
            this.ErrMessage.Text = "<font color=red>密码修改成功!</font>";
        else
            this.ErrMessage.Text = "<font color=red>密码修改失败!</font>";
    }
}
