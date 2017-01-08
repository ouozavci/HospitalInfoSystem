using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HospInfoSystem.personal
{
    public partial class personal_panel : System.Web.UI.Page
    {
        SqlConnection baglantı;

        protected void Page_Load(object sender, EventArgs e)
        {
            baglantı = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["database"].ConnectionString);
            bool isPersonal;
            if (Session["isPersonal"] != null)
                isPersonal = (bool)Session["isPersonal"];
            else
                isPersonal = false;
            if (!isPersonal)
            {
                Response.Redirect("../login/personal_login.aspx");
            }
            else
            {
                baglantı.Open();

                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                lblPersonalName.Text = "Hoşgeldiniz " +dv[0]["name"].ToString() + " " + dv[0]["surname"].ToString();
            }
        }

        protected void btnAddAppointment_Click(object sender, EventArgs e)
        {
            pnlDepartment.Visible = true;
        }

        protected void listDepartments_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlDoctor.Visible = true;
        }

        protected void listDoctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlCalendar.Visible = true;
        }
        protected void listDoctors_DataBound(object sender, EventArgs e)
        {
            DropDownList list = sender as DropDownList;
            if (list != null)
                list.Items.Insert(0, "Bir doktor seçiniz...");
        }
        protected void listDepartment_DataBound(object sender, EventArgs e)
        {
            DropDownList list = sender as DropDownList;
            if (list != null)
                list.Items.Insert(0, "Randevu için bölüm seçiniz...");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            rButtonsHours.Items[0].Text = "09:00";
            rButtonsHours.Items[1].Text = "10:00";
            rButtonsHours.Items[2].Text = "11:00";
            rButtonsHours.Items[3].Text = "12:00";
            rButtonsHours.Items[4].Text = "13:00";
            rButtonsHours.Items[5].Text = "14:00";
            rButtonsHours.Items[6].Text = "15:00";
            rButtonsHours.Items[7].Text = "16:00";
            rButtonsHours.Items[8].Text = "17:00";

            rButtonsHours.Items[0].Enabled = true;
            rButtonsHours.Items[1].Enabled = true;
            rButtonsHours.Items[2].Enabled = true;
            rButtonsHours.Items[3].Enabled = true;
            rButtonsHours.Items[4].Enabled = true;
            rButtonsHours.Items[5].Enabled = true;
            rButtonsHours.Items[6].Enabled = true;
            rButtonsHours.Items[7].Enabled = true;
            rButtonsHours.Items[8].Enabled = true;

            rButtonsHours.Items[0].Selected = false;
            rButtonsHours.Items[1].Selected = false;
            rButtonsHours.Items[2].Selected = false;
            rButtonsHours.Items[3].Selected = false;
            rButtonsHours.Items[4].Selected = false;
            rButtonsHours.Items[5].Selected = false;
            rButtonsHours.Items[6].Selected = false;
            rButtonsHours.Items[7].Selected = false;
            rButtonsHours.Items[8].Selected = false;


            if(dv.Count>0)
                foreach(DataRowView drow in dv){
                  ListItem item = rButtonsHours.Items.FindByValue(drow["time"].ToString().Substring(0,5));
                  item.Text+= "-"+drow["name"].ToString() + " " + drow["surname"].ToString();
                  item.Enabled = false;
                }

            pnlHours.Visible = true;
        }
    }
}