﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ptCancelled : System.Web.UI.Page
{
    //My DB Connection
    SqlConnection connection = new SqlConnection("Data Source=DESKTOP-R3NJ0J9; Initial catalog=TestDB1; User ID=pola; Password=pola");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
//SQL Syntax
        connection.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[Cancellation_List] values('" + txtDate.Text + "','" + txtAppt_Date.Text + "','" + txtEmail.Text + "','" + txtInitials.Text + "', '" + txtNew_Date.Text + "', '" + txtPhone_Number.Text + "','" + txtPatient_Name.Text + "' )", connection);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        connection.Close();
//This code is for cleaning my form
        txtDate.Text = "";
        txtAppt_Date.Text = "";
        txtEmail.Text = "";
        txtInitials.Text = "";
        txtNew_Date.Text = "";
        txtPhone_Number.Text = "";
        txtPatient_Name.Text = "";

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
    protected void Button1_Click1(object sender, EventArgs e)
    {
    }
    protected void txtPatient_Name_TextChanged1(object sender, EventArgs e)
    {

    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("ViewCancellation.aspx");
    }
}