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
        SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[Cancellation_List] values('" + txtDate.Text + "', '" + txtPatient_Name.Text + "','" + txtPhone_Number.Text + "','" + txtEmail.Text + "','" + txtAppt_Date.Text + "','" + txtNew_Date.Text + "','" + txtInitials.Text + "' ,'" + txtStatus.Text + "')", mycon);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        mycon.Close();
//This code is for cleaning my form
        txtDate.Text = "";
        txtAppt_Date.Text = "";
        txtEmail.Text = "";
        txtInitials.Text = "";
        txtNew_Date.Text = "";
        txtPhone_Number.Text = "";
        txtPatient_Name.Text = "";

    }
}