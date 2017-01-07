using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HospInfoSystem
{
    public partial class admin_panel : System.Web.UI.Page
    {
        SqlConnection baglantı;
        protected void Page_Load(object sender, EventArgs e)
        {
            baglantı = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["database"].ConnectionString);
            baglantı.Open();
        }

        protected void btnManageDoctors_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageDoctors.aspx");
        }

        protected void btnManagePersonal_Click(object sender, EventArgs e)
        {
            Response.Redirect("managePersonal.aspx");
        }
    }
}