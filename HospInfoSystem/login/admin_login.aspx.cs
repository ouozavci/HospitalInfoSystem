﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HospInfoSystem
{
    public partial class admin_login : System.Web.UI.Page
    {
        SqlConnection baglantı;
        protected void Page_Load(object sender, EventArgs e)
        {
            baglantı = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["database"].ConnectionString);
            baglantı.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String username = txtAdminUsername.Text;
            String password = txtAdminPassword.Text;

            SqlCommand cmd = new SqlCommand("select id from admins where username='"+username+
            "' and password='"+password+"';",baglantı);

            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                lblResult.Text = "Giriş Başarılı";
                Response.Redirect("../admin/admin_panel.aspx");
            }
            else
            {
                lblResult.Text = "Kullanıcı adı veya Şifre Hatalı!";
            }

        }
    }
}