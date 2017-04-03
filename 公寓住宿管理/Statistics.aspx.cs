using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using StudentApartment.DataAccessLayer;
using StudentApartment.BusinessLogicLayer;

public partial class Statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["adminUserName"] == null) && (Session["adminUserRole"] == null))
        {
            Response.Redirect("../error.aspx");
        }
        if (!IsPostBack)
        {
            ListItem li = new ListItem("请选择", "");
            this.apartmentNo.Items.Add(li);
            Apartment apartment = new Apartment();
            DataSet ds = apartment.GetAllApartment();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds.Tables[0].Rows[i];
                li = new ListItem(dr["apartmentNo"].ToString(), dr["apartmentNo"].ToString());
                this.apartmentNo.Items.Add(li);
            }
        }
    }
    protected void Btn_Stat1_Click(object sender, EventArgs e)
    {
        SqlConnection scn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        scn.Open();

        SqlCommand scm = new SqlCommand("studentcount", scn);
        scm.CommandType = CommandType.StoredProcedure;
        SqlParameter nwparam = null;
        nwparam = scm.Parameters.Add(new SqlParameter("@CollegeName", SqlDbType.NVarChar, 20));
        nwparam.Direction = ParameterDirection.Input;
        nwparam.Value = CollegeName.Text;
        SqlDataAdapter sda = new SqlDataAdapter(scm);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();

        //SqlCommand scm1 = new SqlCommand("livecount", scn);
        //scm1.CommandType = CommandType.StoredProcedure;
        //SqlParameter nwparam1 = null;
        //nwparam1 = scm1.Parameters.Add(new SqlParameter("@CollegeName", SqlDbType.NVarChar, 20));
        //nwparam1.Direction = ParameterDirection.Input;
        //nwparam1.Value = CollegeName.Text;
        //SqlDataAdapter sda1 = new SqlDataAdapter(scm1);
        //DataSet ds1 = new DataSet();
        //sda1.Fill(ds1);
        //GridView2.DataSource = ds1;
        //GridView2.DataBind();
    }

    protected void Btn_Stat2_Click(object sender, EventArgs e)
    {
        SqlConnection scn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        scn.Open();
        SqlCommand scm = new SqlCommand("studentcount2", scn);
        scm.CommandType = CommandType.StoredProcedure;

        SqlParameter sprocParams = null;
        sprocParams = scm.Parameters.Add(new SqlParameter("@CollegeName", SqlDbType.NVarChar, 20));
        sprocParams.Direction = ParameterDirection.Input;
        sprocParams.Value = CollegeName.Text;

        sprocParams = scm.Parameters.Add(new SqlParameter("@StudentSpec", SqlDbType.NVarChar, 20));
        sprocParams.Direction = ParameterDirection.Input;
        sprocParams.Value = StudentSpec.Text;

        SqlDataAdapter sda = new SqlDataAdapter(scm);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Btn_Stat3_Click(object sender, EventArgs e)
    {
        SqlConnection scn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        scn.Open();
        SqlCommand scm = new SqlCommand("studentcount", scn);
        scm.CommandType = CommandType.StoredProcedure;

        SqlParameter nwparam = null;
        nwparam = scm.Parameters.Add(new SqlParameter("@CollegeName", SqlDbType.NVarChar, 20));
        nwparam.Direction = ParameterDirection.Input;
        nwparam.Value = CollegeName.Text;

        SqlDataAdapter sda = new SqlDataAdapter(scm);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Btn_Stat4_Click(object sender, EventArgs e)
    {
        SqlConnection scn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        scn.Open();
        SqlCommand scm = new SqlCommand("studentcount3", scn);
        scm.CommandType = CommandType.StoredProcedure;

        SqlParameter sprocParams = null;
        sprocParams = scm.Parameters.Add(new SqlParameter("@apartmentNo", SqlDbType.Int));
        sprocParams.Direction = ParameterDirection.Input;
        sprocParams.Value = apartmentNo.Text;

        sprocParams = scm.Parameters.Add(new SqlParameter("@roomNo", SqlDbType.Int));
        sprocParams.Direction = ParameterDirection.Input;
        sprocParams.Value = roomNo.Text;

        SqlDataAdapter sda = new SqlDataAdapter(scm);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}