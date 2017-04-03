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

public partial class studentInfoUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        string studentNumber = Request.QueryString["StudentNumber"]; //取得学号信息参数
        this.StudentNumber.Text = studentNumber;
        Student student = new Student();
        student.LoadStudentInfo(studentNumber); //查询该学生的信息
        if (!IsPostBack)
        {
            //下面在界面上更新各个数据的显示
            this.StudentName.Text = student.StudentName;
            this.StudentSex.SelectedValue = student.StudentSex;
            this.StudentState.SelectedValue = student.StudentState;
            foreach (ListItem li in this.StudentSex.Items)
            {
                int index = 0;
                if (li.Text == student.StudentSex)
                {
                    this.StudentSex.SelectedIndex = index;
                    break;
                }
                index++;
            }
            foreach (ListItem li in this.StudentState.Items)
            {
                int index = 0;
                if (li.Text == student.StudentState)
                {
                    this.StudentState.SelectedIndex = index;
                    break;
                }
                index++;
            }
            this.CollegeName.Text = student.CollegeName;
            this.StudentSpec.Text = student.StudentSpec;
            this.StudentBirthday.Text = student.StudentBirthday.ToString("yyyy-MM-dd");
            this.StudentTelephone.Text = student.StudentTelephone;
            this.StudentAddress.Text = student.StudentAddress;
            this.StudentMemo.Text = student.StudentMemo;
            this.NowCollegeName.Text = "<font color=red>" + student.CollegeName + "</font>";
            this.NowStudentSpec.Text = "<font color=red>" + student.StudentSpec + "</font>";
        }
    }

    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        Student student = new Student();
        student.StudentNumber = this.StudentNumber.Text;
        student.StudentName = this.StudentName.Text;
        student.StudentSex = this.StudentSex.SelectedValue;
        student.StudentState = this.StudentState.SelectedValue;
        student.CollegeName = this.CollegeName.SelectedValue;
        student.StudentSpec = this.StudentSpec.SelectedValue;
        student.StudentBirthday = DateTime.Parse(this.StudentBirthday.Text);
        student.StudentTelephone = this.StudentTelephone.Text;
        student.StudentAddress = this.StudentAddress.Text;
        student.StudentMemo = this.StudentMemo.Text;
        if(student.UpdateStudetnInfo())
            Response.Write("<script>alert('学生信息更新成功!');location.href='studentInfoManage.aspx';</script>");
    }
}
