using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class trials : System.Web.UI.Page
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
        string query = "INSERT INTO [dbo].[TrialsReq] (Date, Patient_Name, Phone_Number, Email, TrialDescription, Initials, Status) Values (@Date, @Patient_Name, @Phone_Number, @Email, @TrialDescription, @Initials, @Status) ";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.AddWithValue("@Date", txtDate.Text);
        cmd.Parameters.AddWithValue("@Patient_Name", txtPatient_Name.Text);
        cmd.Parameters.AddWithValue("@Phone_Number", txtPhone_Number.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@TrialDescription", txtTrialDescription.Text);
        cmd.Parameters.AddWithValue("@Initials", txtInitials.Text);
        cmd.Parameters.AddWithValue("@Status", txtStatus.Text);

        cmd.ExecuteNonQuery();

        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        mycon.Close();
//This code is for cleaning my form
        txtDate.Text = "";
        txtEmail.Text = "";
        txtInitials.Text = "";
        txtTrialDescription.Text = "";
        txtPhone_Number.Text = "";
        txtPatient_Name.Text = "";

    }
}