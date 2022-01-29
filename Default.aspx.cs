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
        //my DB connection & the queries
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-R3NJ0J9; Initial catalog=TestDB1; User ID=pola; Password=pola");
        connection.Open();
        string query1 = "SELECT COUNT(*) FROM Cancellation_List";
        string query2 = "SELECT COUNT(*) FROM CLSFU";
        string query3 = "SELECT COUNT(*) FROM Reorder_Contacts";
        string query4 = "SELECT COUNT(*) FROM Receipt_Request";
        string query5 = "SELECT COUNT(*) FROM Rx_Request";
        string query6 = "SELECT COUNT(*) FROM Referral";
        SqlCommand cmd1 = new SqlCommand(query1, connection);
        SqlCommand cmd2 = new SqlCommand(query2, connection);
        SqlCommand cmd3 = new SqlCommand(query3, connection);
        SqlCommand cmd4 = new SqlCommand(query4, connection);
        SqlCommand cmd5 = new SqlCommand(query5, connection);
        SqlCommand cmd6 = new SqlCommand(query6, connection);
        Int32 rows_count1 = Convert.ToInt32(cmd1.ExecuteScalar());
        Int32 rows_count2 = Convert.ToInt32(cmd2.ExecuteScalar());
        Int32 rows_count3 = Convert.ToInt32(cmd3.ExecuteScalar());
        Int32 rows_count4 = Convert.ToInt32(cmd4.ExecuteScalar());
        Int32 rows_count5 = Convert.ToInt32(cmd5.ExecuteScalar());
        Int32 rows_count6 = Convert.ToInt32(cmd6.ExecuteScalar());
        cmd1.Dispose();
        cmd2.Dispose();
        cmd3.Dispose();
        cmd4.Dispose();
        cmd5.Dispose();
        cmd6.Dispose();
        connection.Close();

        //Display data on the page
        canviews.Text = rows_count1.ToString();
        clsviews.Text = rows_count2.ToString();
        OrderViews.Text = rows_count3.ToString();
        RecReq.Text = rows_count4.ToString();
        RxReq.Text = rows_count5.ToString();
        RefReq.Text = rows_count6.ToString();
    }
   
}