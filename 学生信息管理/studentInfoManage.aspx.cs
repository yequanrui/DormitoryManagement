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

public partial class studentInfoManage : System.Web.UI.Page
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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标选择某行时变颜色
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#abcdef';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            e.Row.Cells[6].Text = Convert.ToDateTime(e.Row.Cells[6].Text).ToShortDateString();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridViewBind();
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

    protected void Btn_Del_Click(object sender, EventArgs e)
    {
        int selectCount = 0;　//要删除的学生总数
        string studentNumbers = ""; //保存要删除学生的学号
        string oneStudentNumber; //保存某行记录的学号
        foreach(GridViewRow gr in GridView1.Rows) 
        {
            CheckBox chk = (CheckBox)gr.Cells[0].FindControl("checkBox");
            if(chk.Checked) //如果要删除该学生
            {
                oneStudentNumber = gr.Cells[1].Text;
                if(0 == selectCount)
                    studentNumbers = "'" + oneStudentNumber + "'";
                else
                    studentNumbers = studentNumbers + ",'" + oneStudentNumber + "'";
                selectCount++;
            }
        }
        if(0 == selectCount) //如果用户没有选择学生
            Response.Write("<script>alert('对不起，你没有选择学生!');</script>");
        else
        {
            Student student = new Student();
            student.DeleteStudents(studentNumbers); //执行学生信息删除
            Response.Write("<script>alert('" + student.ErrMessage + "');location.href='studentInfoManage.aspx';</script>");
        }
    }

    protected void Btn_Query_Click(object sender, EventArgs e)
    {
        string studentNumber = this.StudentNumber.Text;
        string studentName = this.StudentName.Text;
        string studentSpec = this.StudentSpec.SelectedValue;
        Student student = new Student();
        DataSet ds = student.QueryStudent(studentNumber,studentName,studentSpec); //根据条件查询学生信息
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    public void InitData()
    {
        //首先初始化学生专业下拉框的内容
        string specialFieldName;
        ListItem li = new ListItem("请选择", "");
        this.StudentSpec.Items.Add(li);
        DataSet ds = (new Student()).QuerySpecInfo();
        int rowCount = ds.Tables[0].Rows.Count;
        for(int i=0;i<rowCount;i++)
        {
            specialFieldName = ds.Tables[0].Rows[i]["specialFieldName"].ToString();
            li = new ListItem(specialFieldName,specialFieldName);
            this.StudentSpec.Items.Add(li);
        }
        //然后绑定GridView控件中的数据
        GridViewBind();
    }

    public void GridViewBind()
    {
        Student student = new Student();
        DataSet ds = student.QueryAllStudent();
        this.GridView1.DataSource = ds;
        this.GridView1.DataBind();
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}
