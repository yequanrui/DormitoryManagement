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

public partial class apartmentManagerUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string managerName = Request.QueryString["ManagerName"]; //取得宿管姓名参数
        this.ManagerName.Text = managerName;
        //初始化界面显示
        Apartment apartment = new Apartment();
        apartment.GetApartmentManager(managerName);
        if (!IsPostBack)
        {
            //下面在界面上更新各个数据的显示
            this.ManagerSex.SelectedValue = apartment.ManagerSex;
            this.ManagerState.SelectedValue = apartment.ManagerState;
            foreach (ListItem li in this.ManagerSex.Items)
            {
                int index = 0;
                if (li.Text == apartment.ManagerSex)
                {
                    this.ManagerSex.SelectedIndex = index;
                    break;
                }
                index++;
            }
            foreach (ListItem li in this.ManagerState.Items)
            {
                int index = 0;
                if (li.Text == apartment.ManagerState)
                {
                    this.ManagerState.SelectedIndex = index;
                    break;
                }
                index++;
            }
            this.ManagerTelephone.Text = apartment.ManagerTelephone;
            this.ManagerMemo.Text = apartment.ManagerMemo;
        }
    }

    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        string managerSex = this.ManagerSex.SelectedValue;
        string managerState = this.ManagerState.SelectedValue;
        string managerTelephone = this.ManagerTelephone.Text;
        string managerMemo = this.ManagerMemo.Text;
        Apartment apartment = new Apartment();
        apartment.ManagerName = Request.QueryString["managerName"];
        if (apartment.UpdateApartmentManager(managerSex, managerState, managerTelephone, managerMemo))
            Response.Write("<script>alert('宿管信息更新成功！');location.href='apartmentManagerUpdate.aspx?managerName=" + apartment.ManagerName + "';</script>");
        else
            Response.Write("<script>alert('" + apartment.ErrMessage + "');</script>");
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("apartmentInfoManage.aspx");
    }
}