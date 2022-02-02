using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Configuration;

public partial class PhoneBook : System.Web.UI.Page
{
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
        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[NEC_MSG] values('" + txtFor.Text + "', '" + txtCaller_Name.Text + "', '" + txtDateTime.Text + "','" + txtCaller_Number.Text + "','" + txtMessage.Text + "','" + txtAction.Text + "','" + txtInitials.Text + "')", mycon);
        cmd2.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        connection();
        //Clearing form after submit
        txtFor.Text = "";
        txtDateTime.Text = "";
        txtCaller_Number.Text = "";
        txtMessage.Text = "";
        txtAction.Text = "";
        txtInitials.Text = "";
    }
}