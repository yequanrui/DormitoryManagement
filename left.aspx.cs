using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using StudentApartment.BusinessLogicLayer;

public partial class left : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((String)Session["adminUserRole"] == "管理员")
        {
            this.h1_student.Visible = true;
            this.div_student.Visible = true;
            this.li_student1.Visible = true;
            this.li_student2.Visible = true;
            this.li_student3.Visible = true;
            this.h1_apartment.Visible = true;
            this.div_apartment.Visible = true;
            this.li_apartment1.Visible = true;
            this.li_apartment2.Visible = true;
            this.li_apartment3.Visible = true;
            this.h1_room.Visible = true;
            this.div_room.Visible = true;
            this.li_room1.Visible = true;
            this.li_room2.Visible = true;
            this.li_room3.Visible = true;
            this.h1_live.Visible = true;
            this.div_live.Visible = true;
            this.li_live0.Visible = true;
            this.li_live1.Visible = true;
            this.li_live2.Visible = true;
            this.li_live3.Visible = true;
            this.h1_visit.Visible = true;
            this.div_visit.Visible = true;
            this.li_visit1.Visible = true;
            this.li_visit2.Visible = true;
            this.h1_money.Visible = true;
            this.div_money.Visible = true;
            this.li_money1.Visible = true;
            this.li_money2.Visible = true;
            this.li_money3.Visible = true;
            this.h1_repair.Visible = true;
            this.div_repair.Visible = true;
            this.li_repair1.Visible = true;
            this.li_repair2.Visible = true;
            this.li_repair3.Visible = true;
            this.h1_health.Visible = true;
            this.div_health.Visible = true;
            this.li_health1.Visible = true;
            this.li_health2.Visible = true;
            this.h1_illegal.Visible = true;
            this.div_illegal.Visible = true;
            this.li_illegal1.Visible = true;
            this.li_illegal2.Visible = true;
            this.li_illegal3.Visible = true;
            this.h1_appraisal.Visible = true;
            this.div_appraisal.Visible = true;
            this.li_appraisal1.Visible = true;
            this.li_appraisal2.Visible = true;
            this.h1_system.Visible = true;
            this.div_system.Visible = true;
            this.li_system1.Visible = true;
            this.li_system2.Visible = true;
            this.li_system5.Visible = true;
        }
        if ((String)Session["adminUserRole"] == "宿管")
        {
            this.h1_room.Visible = true;
            this.div_room.Visible = true;
            this.li_room3.Visible = true;
            this.h1_live.Visible = true;
            this.div_live.Visible = true;
            this.li_live1.Visible = true;
            this.li_live2.Visible = true;
            this.li_live3.Visible = true;
            this.h1_visit.Visible = true;
            this.div_visit.Visible = true;
            this.li_visit1.Visible = true;
            this.li_visit2.Visible = true;
            this.h1_money.Visible = true;
            this.div_money.Visible = true;
            this.li_money1.Visible = true;
            this.li_money2.Visible = true;
            this.li_money3.Visible = true;
            this.h1_repair.Visible = true;
            this.div_repair.Visible = true;
            this.li_repair2.Visible = true;
            this.li_repair3.Visible = true;
            this.h1_health.Visible = true;
            this.div_health.Visible = true;
            this.li_health1.Visible = true;
            this.li_health2.Visible = true;
            this.h1_illegal.Visible = true;
            this.div_illegal.Visible = true;
            this.li_illegal1.Visible = true;
            this.li_illegal2.Visible = true;
            this.li_illegal3.Visible = true;
            this.h1_appraisal.Visible = true;
            this.div_appraisal.Visible = true;
            this.li_appraisal1.Visible = true;
            this.li_appraisal2.Visible = true;
            this.h1_system.Visible = true;
            this.div_system.Visible = true;
            this.li_system3.Visible = true;
            this.li_system5.Visible = true;
            Admin admin = new Admin();
            admin.AdminUserName = Session["AdminUserName"].ToString();
            Session["managerName"] = admin.GetmanagerName();
        }
        if ((String)Session["adminUserRole"] == "学生")
        {
            this.h1_money.Visible = true;
            this.div_money.Visible = true;
            this.li_money3.Visible = true;
            this.h1_repair.Visible = true;
            this.div_repair.Visible = true;
            this.li_repair1.Visible = true;
            this.li_repair3.Visible = true;
            this.h1_health.Visible = true;
            this.div_health.Visible = true;
            this.li_health2.Visible = true;
            this.h1_illegal.Visible = true;
            this.div_illegal.Visible = true;
            this.li_illegal3.Visible = true;
            this.h1_appraisal.Visible = true;
            this.div_appraisal.Visible = true;
            this.li_appraisal2.Visible = true;
            this.h1_system.Visible = true;
            this.div_system.Visible = true;
            this.li_system4.Visible = true;
            this.li_system5.Visible = true;
            Admin admin = new Admin();
            admin.AdminUserName = Session["AdminUserName"].ToString();
            Session["studentNumber"] = admin.GetstudentNumber();
        }
    }
}
