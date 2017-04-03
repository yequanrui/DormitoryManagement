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

public partial class studentInfoAdd : System.Web.UI.Page
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
        Student student = new Student();
        student.StudentNumber = this.StudentNumber.Text; //取得学号信息
        student.StudentName = this.StudentName.Text; //取得学生姓名
        student.StudentSex = this.StudentSex.Text; //取得学生性别
        student.StudentState = this.StudentState.Text; //取得学生政治面貌
        student.CollegeName = this.CollegeName.Text; //取得所在学院名称
        student.StudentSpec = this.StudentSpec.Text; //取得学生专业名称
        student.StudentBirthday = DateTime.Parse(this.StudentBirthday.Text); //取得学生生日
        student.StudentTelephone = this.StudentTelephone.Text; //取得学生手机号码
        student.StudentAddress = this.StudentAddress.Text; //取得学生家庭地址
        student.StudentMemo = this.StudentMemo.Text; //取得学生备注
        student.InsertStudent(); //将学生信息加入到数据库
        this.ErrMessage.Text = student.ErrMessage; //返回插入学生信息的结果．
    }

    protected void Btn_Cancle_Click(object sender, EventArgs e)
    {
        this.StudentNumber.Text = "";
        this.StudentName.Text = "";
        this.StudentSex.SelectedIndex = 0;
        this.StudentState.SelectedIndex = 0;
        this.CollegeName.SelectedIndex = 0;
        this.StudentSpec.SelectedIndex = 0;
        this.StudentBirthday.Text = "";
        this.StudentTelephone.Text = "";
        this.StudentAddress.Text = "";
        this.StudentMemo.Text = "";
        this.ErrMessage.Text = "";
    }
}
