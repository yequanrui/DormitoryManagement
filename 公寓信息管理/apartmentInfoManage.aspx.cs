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
using System.Data.SqlClient;
using System.Xml.Linq;

public partial class apartmentInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        if (!IsPostBack)
            InitData(); //对界面的初始化
    }

    //获取查询条件查询公寓信息重新绑定
    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string apartmentType = this.apartmentType.SelectedValue;
        string managerName = this.managerName.SelectedValue;
        this.GridView1.DataSource = (new Apartment()).QueryApartmentInfo(apartmentType, managerName);
        this.GridView1.DataBind();
    }

    protected void check_ALL_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            GridViewRow gr = this.GridView1.Rows[i];
            CheckBox chk = (CheckBox)gr.Cells[0].FindControl("checkBox");
            chk.Checked = this.check_ALL.Checked; //跟随全选按扭的状态变化;
        }
    }

    public void InitData()
    {
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
        //再初始化公寓管理员下拉框的内容
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
        //最后绑定GridView控件中的数据
        GridViewBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //当鼠标选择某行时变颜色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
    }

    public void GridViewBind()
    {
        Apartment apartment = new Apartment();
        DataSet ds = apartment.GetAllApartment();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_Del_M_Click(object sender, EventArgs e)
    {
        Apartment apartment = new Apartment();
        string managerName = this.managerName.SelectedValue;
        if (apartment.DeleteApartmentManager(managerName))
            Response.Write("<script>alert('宿管信息删除成功！');location.href='apartmentInfoManage.aspx';</script>");
        else
            Response.Write("<script>alert('" + apartment.ErrMessage + "');</script>");
    }

    //根据选择的公寓信息执行删除操作
    protected void Btn_Del_Click(object sender, EventArgs e)
    {
        int selectCount = 0;　//要删除的公寓总数
        string apartmentNos = ""; //保存要删除的公寓编号
        string oneapartmentNo; //保存某行记录的编号
        foreach (GridViewRow gr in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)gr.Cells[0].FindControl("checkBox");
            if (chk.Checked) //如果要删除该公寓
            {
                oneapartmentNo = gr.Cells[1].Text;
                if (0 == selectCount)
                    apartmentNos = "'" + oneapartmentNo + "'";
                else
                    apartmentNos = apartmentNos + ",'" + oneapartmentNo + "'";
                selectCount++;
            }
        }
        if (0 == selectCount) //如果用户没有选择公寓
            Response.Write("<script>alert('对不起，你没有选择公寓!');</script>");
        else
        {
            Apartment apartment = new Apartment();
            bool result = apartment.DeleteApartments(apartmentNos);
            if(true == result)
                Response.Write("<script>alert('公寓信息删除成功!');location.href='apartmentInfoManage.aspx';</script>");
            else
                Response.Write("<script>alert('" + apartment.ErrMessage + "');</script>");
        }
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}
