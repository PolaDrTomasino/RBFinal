using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

public partial class MyDateTest : System.Web.UI.Page
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

        string query2 = "SET DATEFORMAT YMD";
        string query = "INSERT INTO [dbo].[MyDateTest] (Date, DateTime, DateTime2 ) Values (@Date, @DateTime, @DateTime2) ";
        SqlCommand cmd2 = new SqlCommand(query2, mycon);
        SqlCommand cmd = new SqlCommand(query, mycon);

        Console.Write("@Date");
        Console.Write("@DateTime");
        Console.Write("@DateTime2");
        cmd.Parameters.AddWithValue("@Date", txtDate.Text);
        cmd.Parameters.AddWithValue("@DateTime", txtDateTime.Text);
        cmd.Parameters.AddWithValue("@DateTime2", txtDateTime2.Text);

        cmd2.ExecuteNonQuery();
        cmd.ExecuteNonQuery();

        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        mycon.Close();
//This code is for cleaning my form
        txtDate.Text = "";
        


    }
}