using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-R3NJ0J9; Initial catalog=TestDB1; User ID=pola; Password=pola");
        connection.Open();
        string query1 = "SELECT COUNT(*) FROM Cancellation_List";
        string query2 = "SELECT COUNT(*) FROM CLSFU";
        SqlCommand cmd1 = new SqlCommand(query1, connection);
        SqlCommand cmd2 = new SqlCommand(query2, connection);
        Int32 rows_count1 = Convert.ToInt32(cmd1.ExecuteScalar());
        Int32 rows_count2 = Convert.ToInt32(cmd2.ExecuteScalar());
        cmd1.Dispose();
        connection.Close();

        //Display data on the page
        canviews.Text = rows_count1.ToString();
        clsviews.Text = rows_count2.ToString();
    
    }
    protected void CanViewer_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCancellation.aspx");
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("ViewCLS.aspx");
    }
}