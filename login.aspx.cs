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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_Login_Click(object sender, EventArgs e)
    {
        //构建一个管理员帐号信息类,然后将用户名和密码传入该类
        Admin admin = new Admin();
        admin.AdminUserName = UserName.Text;
        admin.AdminPassword = Password.Text;
        admin.AdminUserRole = Userrole.SelectedValue;
        admin.LoginTime = System.DateTime.Now;
        //如果验证用户名和密码都成功
        if (admin.checkAdmin()) 
        {
            admin.Tologin();
            Session["adminUserName"] = admin.AdminUserName; //设置登录成功的session变量
            Session["adminUserRole"] = admin.AdminUserRole;
            Session["loginTime"] = admin.LoginTime;
            Response.Redirect("index.aspx");          //转入到主操作界面
        }
        else
        {
            this.ErrMessage.Text = admin.ErrMessage;
        }
    }

    protected void Btn_Reset_Click(object sender, EventArgs e)
    {
        UserName.Text = "";
        Password.Text = "";
        ErrMessage.Text = "";
    }
}
