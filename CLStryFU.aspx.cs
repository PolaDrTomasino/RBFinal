using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class CLStryFU : System.Web.UI.Page
{
// My DB Connection
    public SqlConnection mycon;
    public string constr;
    public void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["mycon"].ToString();
        mycon = new SqlConnection(constr);
        mycon.Open();
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        //opening conncetion and insert then close DB

        connection();
        string query = "INSERT INTO [dbo].[CLSFU] (Appt_Date, Patient_Name, Phone_Number, Email, CLS_Try, FU_Date, Initials) Values ( @Appt_Date, @Patient_Name, @Phone_Number, @Email, @CLS_Try, @FU_Date, @Initials) ";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.AddWithValue("@Appt_Date", txtAppt_Date.Text);
        cmd.Parameters.AddWithValue("@Patient_Name", txtPatient_Name.Text);
        cmd.Parameters.AddWithValue("@Phone_Number", txtPhone_Number.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@CLS_Try", txtCLS_Try.Text);
        cmd.Parameters.AddWithValue("@FU_Date", txtFU_Date.Text);
        cmd.Parameters.AddWithValue("@Initials", txtInitials.Text);

        cmd.ExecuteNonQuery();

        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()",true);
        connection();
//Clearing form after submit
        txtAppt_Date.Text="";
        txtPatient_Name.Text="";
        txtPhone_Number.Text="";
        txtEmail.Text="";
        txtCLS_Try.Text="";
        txtFU_Date.Text="";
        txtInitials.Text = "";
    }
}