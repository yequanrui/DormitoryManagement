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

public partial class apartmentInfoUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string apartmentNo = Request.QueryString["apartmentNo"].ToString(); //取得公寓编号参数
        //初始化界面显示
        //首先初始化公寓类型下拉框的内容
        string apartmentType;
        ListItem li = new ListItem("请选择", "");
        this.apartmentType.Items.Add(li);
        DataSet ds = (new Apartment()).QueryTypeInfo();
        int rowCount = ds.Tables[0].Rows.Count;
        for (int i = 0; i < rowCount; i++)
        {
            apartmentType = ds.Tables[0].Rows[i]["apartmentType"].ToString();
            li = new ListItem(apartmentType, apartmentType);
            this.apartmentType.Items.Add(li);
        }
        string managerName;
        ListItem li2 = new ListItem("请选择", "");
        this.managerName.Items.Add(li2);
        DataSet ds2 = (new Apartment()).QueryNameInfo();
        int rowCount2 = ds2.Tables[0].Rows.Count;
        for (int i = 0; i < rowCount2; i++)
        {
            managerName = ds2.Tables[0].Rows[i]["managerName"].ToString();
            li2 = new ListItem(managerName, managerName);
            this.managerName.Items.Add(li2);
        }
        if(!IsPostBack)
            InitDataView(apartmentNo);
    }
    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        string apartmentType = this.apartmentType.SelectedValue;
        string managerName = this.managerName.Text;
        string apartmentTelephone = this.apartmentTelephone.Text;
        string apartmentMemo = this.apartmentMemo.Text;
        Apartment apartment = new Apartment();
        apartment.ApartmentNo = Request.QueryString["apartmentNo"];
        if (apartment.UpdateApartmentInfo(apartmentType, managerName, apartmentTelephone, apartmentMemo))
            Response.Write("<script>alert('公寓信息更新成功！');location.href='apartmentInfoUpdate.aspx?apartmentNo=" + apartment.ApartmentNo + "';</script>");
        else
            Response.Write("<script>alert('" + apartment.ErrMessage + "');</script>");
    }

    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("apartmentInfoManage.aspx");
    }

    public void InitDataView(string apartmentNo)
    {
        Apartment apartment = new Apartment();
        apartment.GetApartmentInfo(apartmentNo);
        this.apartmentNo.Text = apartment.ApartmentNo;
        this.apartmentType.Text = apartment.ApartmentType;
        this.managerName.Text = apartment.ManagerName;
        this.apartmentTelephone.Text = apartment.ApartmentTelephone;
        this.apartmentMemo.Text = apartment.ApartmentMemo;
    }
}
