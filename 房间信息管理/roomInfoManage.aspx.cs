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

public partial class roomInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        if (!IsPostBack)
        {
            InitData(); //对界面的初始化
        }
    }

    //获取查询条件查询房间信息重新绑定
    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string roomNo = this.RoomNo.Text;
        string apartmentNo = this.apartmentNo.SelectedValue;
        string roomType = this.roomType.SelectedValue;
        this.GridView1.DataSource = (new Room()).QueryRoomInfo(roomNo, apartmentNo, roomType);
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

    //窗体第一次加载时调用本函数对相关控件内容初始化
    public void InitData()
    {
        //首先初始化房间类型下拉框的内容
        string roomType;
        ListItem li = new ListItem("请选择", "");
        this.roomType.Items.Add(li);
        DataSet ds = (new Room()).QueryTypeInfo();
        int rowCount = ds.Tables[0].Rows.Count;
        for (int i = 0; i < rowCount; i++)
        {
            roomType = ds.Tables[0].Rows[i]["roomType"].ToString();
            li = new ListItem(roomType, roomType);
            this.roomType.Items.Add(li);
        }
        //在初始化公寓编号下拉框的内容
        string apartmentNo;
        ListItem li2 = new ListItem("请选择", "");
        this.apartmentNo.Items.Add(li2);
        DataSet ds2 = (new Apartment()).QueryNoInfo();
        int rowCount2 = ds2.Tables[0].Rows.Count;
        for (int i = 0; i < rowCount2; i++)
        {
            apartmentNo = ds2.Tables[0].Rows[i]["apartmentNo"].ToString();
            li2 = new ListItem(apartmentNo, apartmentNo);
            this.apartmentNo.Items.Add(li2);
        }
        //然后绑定GridView控件中的数据
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
        Room room = new Room();
        DataSet ds = room.GetAllRoom();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    //根据选择的房间信息执行删除操作
    protected void Button1_Click(object sender, EventArgs e)
    {
        int selectCount = 0;　//要删除的房间总数
        string roomNos = ""; //保存要删除的房间编号
        string oneRoomNo; //保存某行记录的学号
        foreach (GridViewRow gr in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)gr.Cells[0].FindControl("checkBox");
            if (chk.Checked) //如果要删除该学生
            {
                oneRoomNo = gr.Cells[1].Text;
                if (0 == selectCount)
                    roomNos = "'" + oneRoomNo + "'";
                else
                    roomNos = roomNos + ",'" + oneRoomNo + "'";
                selectCount++;

            }
        }
        if (0 == selectCount) //如果用户没有选择学生
            Response.Write("<script>alert('对不起，你没有选择房间!');</script>");
        else
        {
            Room room = new Room();
            bool result = room.DeleteRooms(roomNos);
            if(true == result)
                Response.Write("<script>alert('房间信息删除成功!');location.href='roomInfoManage.aspx';</script>");
            else
                Response.Write("<script>alert('" + room.ErrMessage + "');</script>");

        }
    }
    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}
