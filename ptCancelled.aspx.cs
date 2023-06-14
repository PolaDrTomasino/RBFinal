using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ptCancelled : System.Web.UI.Page
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
        string query = "INSERT INTO [dbo].[ptCancelled] (Date, PatientName, PhoneNumber, Email, ReasonForCancel, ServType, NewDate, Initials, Status) Values ( @Date, @PatientName, @PhoneNumber, @Email, @ReasonForCancel, @ServType , @NewDate, @Initials, @Status) ";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.AddWithValue("@Date", txtDate.Text);
        cmd.Parameters.AddWithValue("@PatientName", txtPatientName.Text);
        cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@ServType", txtServType.Text);
        cmd.Parameters.AddWithValue("@ReasonForCancel", txtReasonForCancel.Text);
        cmd.Parameters.AddWithValue("@NewDate", txtNewDate.Text);
        cmd.Parameters.AddWithValue("@Initials", txtInitials.Text);
        cmd.Parameters.AddWithValue("@Status", txtStatus.Text);

        cmd.ExecuteNonQuery();

        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        mycon.Close();
//This code is for cleaning my form
        txtDate.Text = "";
        txtPatientName.Text = "";
        txtEmail.Text = "";
        txtInitials.Text = "";
        txtNewDate.Text = "";
        txtPhoneNumber.Text = "";

    }
}