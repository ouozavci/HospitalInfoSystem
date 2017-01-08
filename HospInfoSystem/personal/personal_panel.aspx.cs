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
            if (!pnlDoctor.Visible) { pnlDoctor.Visible = true; }
            else
            {
                pnlDoctor.Visible = false;
                pnlDoctor.Visible = true;
                pnlCalendar.Visible = false;
                pnlHours.Visible = false;
                pnlHastaTc.Visible = false;
                pnlHastaForm.Visible = false;
            }
            
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
                list.Items[0].Value = "0";
        }
        protected void listDepartment_DataBound(object sender, EventArgs e)
        {
            DropDownList list = sender as DropDownList;
            if (list != null)
                list.Items.Insert(0, "Randevu için bölüm seçiniz...");
                list.Items[0].Value = "0";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
          
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

            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
                foreach(DataRowView drow in dv){
                    ListItem item = rButtonsHours.Items.FindByValue(drow["time"].ToString().Substring(0,5));
                    if (item != null)
                    {
                        item.Text += "-" + drow["name"].ToString() + " " + drow["surname"].ToString();
                        item.Enabled = false;
                    }
                }

            pnlHours.Visible = true;
            pnlHastaTc.Visible = false;
            pnlHastaForm.Visible = false;
        }

        protected void rButtonsHours_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlHastaTc.Visible = true;
        }

        protected void btnSorgula_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            if (dv.Count > 0)
                foreach (DataRowView drow in dv)
                {
                    lblMessage.Text = "Hasta bulundu!";
                    txtName.Text = drow["name"].ToString();
                    txtSurname.Text = drow["surname"].ToString();
                    txtBirth.Text = drow["birth_year"].ToString();
                    listInsurance.SelectedValue = drow["insurance_id"].ToString();
                    pnlHastaForm.Visible = true;
                }
            else
            {
                lblMessage.Text = "Hasta kayıtlı değil.";
                txtName.Text = "";
                txtSurname.Text = "";
                txtBirth.Text = "";
                listInsurance.SelectedIndex = 0;
                pnlHastaForm.Visible = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String tc = txtTc.Text;
            String name = txtName.Text;
            String surname = txtSurname.Text;
            String birth = txtBirth.Text;
            String ins = listInsurance.SelectedValue;
            if (lblMessage.Text.Equals("Hasta kayıtlı değil."))
            {
                SqlCommand cmdSave = new SqlCommand("insert into patients (tc,name,surname,birth_year,insurance_type) "+
                    "VALUES ('"+tc+"','"+name+"','"+surname+"',"+birth+","+ins+")", baglantı);
                int rowsAffected = cmdSave.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    lblMessage.Text = "Hasta Kaydedildi! ";
                }
                else
                {
                    lblMessage.Text = "Bişeyler yanlış gitti!";
                    return;
                }
            }

            String doc_id = listDoctors.SelectedValue;
            String patient_id = "0";
            DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            if (dv.Count > 0)
                foreach (DataRowView drow in dv)
                {
                    patient_id = drow["id"].ToString();
                }
            else{
                lblMessage.Text="Hata";
            }
            String date = Calendar1.SelectedDate.ToString("yyyyMMdd");
            String time = rButtonsHours.SelectedValue.ToString()+":00";

            SqlCommand cmdAppointment = new SqlCommand("insert into appointments (doctor_id,patient_id,date,time)" +
            "VALUES ("+doc_id+","+patient_id+",convert(date,'"+date+"'),convert(time,'"+time+"'));", baglantı);
            int rowsAffected1=0;
            try
            {
                rowsAffected1 = cmdAppointment.ExecuteNonQuery();
                if (rowsAffected1 == 1)
                {
                    lblMessage.Text += "Randevu girildi! ";
                }
                else
                {
                    lblMessage.Text = "Bişeyler yanlış gitti!";
                    return;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
          
            
         }
    }
}