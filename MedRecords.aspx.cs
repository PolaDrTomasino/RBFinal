using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class CancelWait : System.Web.UI.Page
{
    public SqlConnection mycon;
    public string constr;
    public void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["mycon"].ToString();
        mycon = new SqlConnection(constr);
        mycon.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
//SQL Syntax

        connection();
        string query = "INSERT INTO [dbo].[MedRecords] (Date, PatientName, PhoneNumber, Email, DrName, DrPrName, DrPhone, DrFax, DateDone, Initials, Status) Values (@Date, @PatientName, @PhoneNumber, @Email, @DrName, @DrPrName, @DrPhone, @DrFax, @DateDone, @Initials, @Status) ";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.AddWithValue("@Date", txtDate.Text);
        cmd.Parameters.AddWithValue("@PatientName", txtPatientName.Text);
        cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@DrName", txtDrName.Text);
        cmd.Parameters.AddWithValue("@DrPrName", txtDrPrName.Text);
        cmd.Parameters.AddWithValue("@DrPhone", txtDrPhone.Text);
        cmd.Parameters.AddWithValue("@DrFax", txtDrFax.Text);
        cmd.Parameters.AddWithValue("@DateDone", txtDateDone.Text);
        cmd.Parameters.AddWithValue("@Initials", txtInitials.Text);
        cmd.Parameters.AddWithValue("@Status", txtStatus.Text);

        cmd.ExecuteNonQuery();

        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        mycon.Close();
//This code is for cleaning my form
        txtDate.Text = "";
        txtPatientName.Text = "";
        txtPhoneNumber.Text = "";
        txtEmail.Text = "";
        txtDrName.Text = "";
        txtDrPrName.Text = "";
        txtDrPhone.Text = "";
        txtDrFax.Text = "";
        txtDateDone.Text = "";
        txtInitials.Text = "";
        txtStatus.Text = "";
    }
}