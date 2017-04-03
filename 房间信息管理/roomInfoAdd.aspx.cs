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

public partial class roomInfoAdd : System.Web.UI.Page
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
        //从界面中收集房间的各个字段信息并保存到room对象中
        Room room = new Room();
        room.RoomNo = this.roomNo.Text;
        room.ApartmentNo = this.apartmentNo.SelectedValue;
        room.RoomType = this.roomType.SelectedValue;
        room.RoomPrice = Convert.ToSingle(this.roomPrice.Text);
        room.NumberOfBed = Convert.ToInt16(this.numberOfBed.Text);
        room.LeftNumberOfBed = Convert.ToInt16(this.leftNumberOfBed.Text);
        room.RoomTelephone = this.roomTelephone.Text;
        room.RoomMemo = this.roomMemo.Text;
        if (room.InsertRoomInfo()) //将房间信息插入数据库中
            this.ErrMessage.Text = "<font color=red>房间信息添加成功！</font>";
        else
            this.ErrMessage.Text = "<font color=red>" + room.ErrMessage + "</font>"; //显示出错信息
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        this.roomNo.Text = "";
        this.apartmentNo.SelectedIndex = 0;
        this.roomType.SelectedIndex = 0;
        this.roomPrice.Text = "";
        this.numberOfBed.Text = "";
        this.leftNumberOfBed.Text = "";
        this.roomTelephone.Text = "";
        this.roomMemo.Text = "";
        this.ErrMessage.Text = "";
    }
}
