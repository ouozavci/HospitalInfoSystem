using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HospInfoSystem.doctor
{
    public partial class doctor_panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            }
        }
    }
}