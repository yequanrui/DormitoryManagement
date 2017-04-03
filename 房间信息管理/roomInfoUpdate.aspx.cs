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

public partial class roomInfoUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string roomNo = Request.QueryString["roomNo"].ToString(); //取得房间编号参数
        //初始化界面显示
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
        if(!IsPostBack)
            InitDataView(roomNo);
    }
    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        string roomType = this.roomType.SelectedValue;
        float roomPrice = Convert.ToSingle(this.roomPrice.Text);
        string roomTelephone = this.roomTelephone.Text;
        string roomMemo = this.roomMemo.Text;
        Room room = new Room();
        room.RoomNo = Request.QueryString["roomNo"];

        if (room.UpdateRoomInfo(roomType, roomPrice, roomTelephone, roomMemo))
            Response.Write("<script>alert('房间信息更新成功！');location.href='roomInfoUpdate.aspx?roomNo=" + room.RoomNo + "';</script>");
        else
            Response.Write("<script>alert('" + room.ErrMessage + "');</script>");
    }
    protected void Btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("roomInfoManage.aspx");
    }

    public void InitDataView(string roomNo)
    {
        Room room = new Room();
        room.GetRoomInfo(roomNo);
        this.roomNo.Text = room.RoomNo;
        this.apartmentNo.Text = room.ApartmentNo;
        this.roomType.Text = room.RoomType;
        this.roomPrice.Text = room.RoomPrice.ToString();
        this.numberOfBed.Text = room.NumberOfBed.ToString();
        this.leftNumberOfBed.Text = room.LeftNumberOfBed.ToString();
        this.roomTelephone.Text = room.RoomTelephone;
        this.roomMemo.Text = room.RoomMemo;
    }
}
