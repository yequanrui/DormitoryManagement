using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using StudentApartment.BusinessLogicLayer;

public partial class top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Btn_Logout.Attributes.Add("onclick", "return confirm('您确定要退出系统吗？');");
        }
    }
    protected void Btn_Logout_Click(object sender, ImageClickEventArgs e)
    {
        Admin admin = new Admin();
        admin.LoginTime = DateTime.Parse(Session["loginTime"].ToString());
        admin.LogoutTime = System.DateTime.Now;
        admin.Tologout();
        Response.Write("<script>top.location = 'login.aspx';</script>");
    }
}
