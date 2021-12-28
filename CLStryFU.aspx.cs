using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CLStryFU : System.Web.UI.Page
{
// My DB Connection
    SqlConnection connection = new SqlConnection("Data Source=DESKTOP-R3NJ0J9; Initial catalog=TestDB1; User ID=pola; Password=pola");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
//opening conncetion and insert then close DB
        connection.Open();
        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[CLSFU] values('" + txtAppt_Date.Text + "','" + txtPatient_Name.Text + "','" + txtPhone_Number.Text + "','" + txtEmail.Text + "','" + txtCLS_Try.Text + "','" + txtFU_Date.Text + "','" + txtInitials.Text + "')", connection);
        cmd2.ExecuteNonQuery();
        lblMessage.Text = "Contact Lenses Trial Appointment Submitted Successfully";
        connection.Close();
//Clearing form after submit
        txtAppt_Date.Text="";
        txtPatient_Name.Text="";
        txtPhone_Number.Text="";
        txtEmail.Text="";
        txtCLS_Try.Text="";
        txtFU_Date.Text="";
        txtInitials.Text = "";
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtPatient_Name_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtPatient_Name_TextChanged1(object sender, EventArgs e)
    {

    }
}