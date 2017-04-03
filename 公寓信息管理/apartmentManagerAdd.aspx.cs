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

public partial class apartmentManagerAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
    }
    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        //从界面中收集宿管的各个字段信息并保存到apartment对象中
        Apartment apartment = new Apartment();
        apartment.ManagerName = this.ManagerName.Text;
        apartment.ManagerSex = this.ManagerSex.SelectedValue;
        apartment.ManagerState = this.ManagerState.SelectedValue;
        apartment.ManagerTelephone = this.ManagerTelephone.Text;
        apartment.ManagerMemo = this.ManagerMemo.Text;
        if (apartment.InsertApartmentManager()) //将宿管信息插入数据库中
            this.ErrMessage.Text = "<font color=red>宿管信息添加成功！</font>";
        else
            this.ErrMessage.Text = "<font color=red>" + apartment.ErrMessage + "</font>"; //显示出错信息
    }
    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        this.ManagerName.Text = "";
        this.ManagerSex.SelectedIndex = 0;
        this.ManagerState.SelectedIndex = 0;
        this.ManagerTelephone.Text = "";
        this.ManagerMemo.Text = "";
        this.ErrMessage.Text = "";
    }
}