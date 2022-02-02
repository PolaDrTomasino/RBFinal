using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
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
        //my DB connection & the queries

        connection();
        string query1 = "SELECT COUNT(*) FROM Cancellation_List";
        string query2 = "SELECT COUNT(*) FROM CLSFU";
        string query3 = "SELECT COUNT(*) FROM Reorder_Contacts";
        string query4 = "SELECT COUNT(*) FROM Receipt_Request";
        string query5 = "SELECT COUNT(*) FROM Rx_Request";
        string query6 = "SELECT COUNT(*) FROM Referral";
        string query7 = "SELECT COUNT(*) FROM NEC_MSG";
        SqlCommand cmd1 = new SqlCommand(query1, mycon);
        SqlCommand cmd2 = new SqlCommand(query2, mycon);
        SqlCommand cmd3 = new SqlCommand(query3, mycon);
        SqlCommand cmd4 = new SqlCommand(query4, mycon);
        SqlCommand cmd5 = new SqlCommand(query5, mycon);
        SqlCommand cmd6 = new SqlCommand(query6, mycon);
        SqlCommand cmd7 = new SqlCommand(query7, mycon);
        Int32 rows_count1 = Convert.ToInt32(cmd1.ExecuteScalar());
        Int32 rows_count2 = Convert.ToInt32(cmd2.ExecuteScalar());
        Int32 rows_count3 = Convert.ToInt32(cmd3.ExecuteScalar());
        Int32 rows_count4 = Convert.ToInt32(cmd4.ExecuteScalar());
        Int32 rows_count5 = Convert.ToInt32(cmd5.ExecuteScalar());
        Int32 rows_count6 = Convert.ToInt32(cmd6.ExecuteScalar());
        Int32 rows_count7 = Convert.ToInt32(cmd7.ExecuteScalar());
        cmd1.Dispose();
        cmd2.Dispose();
        cmd3.Dispose();
        cmd4.Dispose();
        cmd5.Dispose();
        cmd6.Dispose();
        cmd7.Dispose();
        mycon.Close();

        //Display data on the page
        canviews.Text = rows_count1.ToString();
        clsviews.Text = rows_count2.ToString();
        OrderViews.Text = rows_count3.ToString();
        RecReq.Text = rows_count4.ToString();
        RxReq.Text = rows_count5.ToString();
        RefReq.Text = rows_count6.ToString();
        PhoneBook.Text = rows_count7.ToString();
    }

}