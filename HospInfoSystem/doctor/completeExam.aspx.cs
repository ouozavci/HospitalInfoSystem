using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HospInfoSystem.doctor
{
    public partial class completeExam : System.Web.UI.Page
    {
        String id;
        SqlConnection baglantı;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
            baglantı = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["database"].ConnectionString);

            if (id == null)
            {
                Response.Redirect("/");
            }
            else
            {
                baglantı.Open();
            }
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            String note = txtNote.Text;
            SqlCommand cmdProc = new SqlCommand();
            cmdProc.CommandText = "execExam";
            cmdProc.CommandType = System.Data.CommandType.StoredProcedure;
            cmdProc.Parameters.Add("@appointment_id",System.Data.SqlDbType.Int).Value = Convert.ToInt32(id);
            cmdProc.Parameters.Add("@note", System.Data.SqlDbType.NVarChar).Value = note;
            cmdProc.Connection = baglantı;
            SqlDataReader rdr = cmdProc.ExecuteReader();


                Response.Redirect("doctor_panel.aspx");


        }
    }
}