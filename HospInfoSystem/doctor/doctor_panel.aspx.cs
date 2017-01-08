using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HospInfoSystem.doctor
{
    public partial class doctor_panel : System.Web.UI.Page
    {
        SqlConnection baglantı;
        protected void Page_Load(object sender, EventArgs e)
        {
            baglantı = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["database"].ConnectionString);
            
            bool isDoctor;
            if (Session["isDoctor"] != null)
                isDoctor = (bool)Session["isDoctor"];
            else
                isDoctor = false;
            if (!isDoctor)
            {
                Response.Redirect("../login/doctor_login.aspx");
            }
            else
            {                
                DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                lblDoctorName.Text = dv[0]["name"].ToString() + " " + dv[0]["surname"].ToString();

                baglantı.Open();
            }
        }

        protected void btnMuayene_Click(object sender, EventArgs e)
        {
            int appointmentId = (int)GridView1.SelectedValue;
            lblResult.Text = appointmentId.ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Muayene")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("completeExam.aspx?id="+id);
            }
            else if (e.CommandName == "Cancel")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                SqlCommand cmdDelete = new SqlCommand("delete from appointments where id="+id.ToString(),baglantı);
                int affRows = cmdDelete.ExecuteNonQuery();
                if (affRows > 0)
                {
                    Response.Redirect("");
                }
                else
                {
                    lblResult.Text = "Kayıt silinemedi!";
                }
            }
        }
    }
}