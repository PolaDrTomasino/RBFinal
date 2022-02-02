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
        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[CLSFU] values('" + txtAppt_Date.Text + "','" + txtPatient_Name.Text + "','" + txtPhone_Number.Text + "','" + txtEmail.Text + "','" + txtCLS_Try.Text + "','" + txtFU_Date.Text + "','" + txtInitials.Text + "')", mycon);
        cmd2.ExecuteNonQuery();
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