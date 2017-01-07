using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace HospInfoSystem.admin
{
    public partial class manageDoctors : System.Web.UI.Page
    {

        SqlConnection baglantı;
        protected void Page_Load(object sender, EventArgs e)
        {
         
            {
                baglantı = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["database"].ConnectionString);
                baglantı.Open();
            }
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            pnlAddDoctorForm.Visible = true;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
                String tc = txtTc.Text;
                String name = txtName.Text;
                String surname = txtSurname.Text;
                String password = txtPassword.Text;
                String title_id = listTitle.SelectedValue;
                String dep_id = listDepartment.SelectedValue;

                if (tc.Length < 11 || name.Equals("") || surname.Equals("") || password.Equals(""))
                {
                    lblResult.Text = "Lütfen tüm bilgileri doldurun!";
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into doctors (tc,name,surname,title_id,dep_id,password" +
                        ") values ('" + tc + "','" + name + "','" + surname + "'," + title_id + "," + dep_id + ",'" + password + "');", baglantı);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        pnlAddDoctorForm.Visible = false;
                        Response.Redirect("");
                    }
                    else
                    {
                        lblResult.Text = "Bişeyler yanlış gitti!";
                    }
                }
            
        }
    }
}