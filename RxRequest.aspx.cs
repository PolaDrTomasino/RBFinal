﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class RxRequest : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection("Data Source=DESKTOP-R3NJ0J9; Initial catalog=TestDB1; User ID=pola; Password=pola");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection.Open();
        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[Rx_Request] values('" + txtDate.Text + "','" + txtPatient_Name.Text + "','" + txtPhone_Number.Text + "','" + txtEmail.Text + "','" + txtRx.Text + "','" + txtReceiving_Via.Text + "','" + txtDate_Done.Text + "','" + txtInitials.Text + "')", connection);
        cmd2.ExecuteNonQuery();
        lblMessage.Text = "Rx Copy Request Submitted Successfully";
        connection.Close();
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