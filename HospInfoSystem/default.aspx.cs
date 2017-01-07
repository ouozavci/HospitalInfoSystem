using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospInfoSystem
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login/admin_login.aspx");
        }

        protected void btnDoctor_Click(object sender, EventArgs e)
        {
            Response.Redirect("login/doctor_login.aspx");
        }

        protected void btnPersonal_Click(object sender, EventArgs e)
        {
            Response.Redirect("login/personal_login.aspx");
        }
    }
}