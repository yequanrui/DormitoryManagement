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

public partial class apartmentInfoAdd : System.Web.UI.Page
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
        //从界面中收集公寓的各个字段信息并保存到apartment对象中
        Apartment apartment = new Apartment();
        apartment.ApartmentNo = this.apartmentNo.Text;
        apartment.ApartmentType = this.apartmentType.SelectedValue;
        apartment.ManagerName = this.managerName.SelectedValue;
        apartment.ApartmentTelephone = this.apartmentTelephone.Text;
        apartment.ApartmentMemo = this.apartmentMemo.Text;
        if (apartment.InsertApartmentInfo()) //将公寓信息插入数据库中
            this.ErrMessage.Text = "<font color=red>公寓信息添加成功！</font>";
        else
            this.ErrMessage.Text = "<font color=red>" + apartment.ErrMessage + "</font>"; //显示出错信息
    }
    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        this.apartmentNo.Text = "";
        this.apartmentType.SelectedIndex = 0;
        this.managerName.SelectedIndex = 0;
        this.apartmentTelephone.Text = "";
        this.apartmentMemo.Text = "";
        this.ErrMessage.Text = "";
    }
}
