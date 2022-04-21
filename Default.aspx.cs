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
        string query1 = "SELECT COUNT(*) FROM CancelWait Where [Status] = 'Processing'";
        string query2 = "SELECT COUNT(*) FROM CLSFU Where [Status] = 'Processing'";
        string query3 = "SELECT COUNT(*) FROM Reorder_Contacts Where [Status] = 'Processing'";
        string query4 = "SELECT COUNT(*) FROM Receipt_Request Where [Status] = 'Processing'";
        string query5 = "SELECT COUNT(*) FROM Rx_Request Where [Status] = 'Processing'";
        string query6 = "SELECT COUNT(*) FROM Referral Where [Status] = 'Processing'";
        string query7 = "SELECT COUNT(*) FROM NEC_MSG Where [Status] = 'Processing'";
        string query8 = "SELECT COUNT(*) FROM ptCancelled Where [Status] = 'Processing'";
        string query9 = "SELECT COUNT(*) FROM MedRecords Where [Status] = 'Processing'";
        string query10 = "SELECT COUNT(*) FROM TrialsReq Where [Status] = 'Processing'";
        SqlCommand cmd1 = new SqlCommand(query1, mycon);
        SqlCommand cmd2 = new SqlCommand(query2, mycon);
        SqlCommand cmd3 = new SqlCommand(query3, mycon);
        SqlCommand cmd4 = new SqlCommand(query4, mycon);
        SqlCommand cmd5 = new SqlCommand(query5, mycon);
        SqlCommand cmd6 = new SqlCommand(query6, mycon);
        SqlCommand cmd7 = new SqlCommand(query7, mycon);
        SqlCommand cmd8 = new SqlCommand(query8, mycon);
        SqlCommand cmd9 = new SqlCommand(query9, mycon);
        SqlCommand cmd10 = new SqlCommand(query10, mycon);
        Int32 rows_count1 = Convert.ToInt32(cmd1.ExecuteScalar());
        Int32 rows_count2 = Convert.ToInt32(cmd2.ExecuteScalar());
        Int32 rows_count3 = Convert.ToInt32(cmd3.ExecuteScalar());
        Int32 rows_count4 = Convert.ToInt32(cmd4.ExecuteScalar());
        Int32 rows_count5 = Convert.ToInt32(cmd5.ExecuteScalar());
        Int32 rows_count6 = Convert.ToInt32(cmd6.ExecuteScalar());
        Int32 rows_count7 = Convert.ToInt32(cmd7.ExecuteScalar());
        Int32 rows_count8 = Convert.ToInt32(cmd8.ExecuteScalar());
        Int32 rows_count9 = Convert.ToInt32(cmd9.ExecuteScalar());
        Int32 rows_count10 = Convert.ToInt32(cmd10.ExecuteScalar());
        cmd1.Dispose();
        cmd2.Dispose();
        cmd3.Dispose();
        cmd4.Dispose();
        cmd5.Dispose();
        cmd6.Dispose();
        cmd7.Dispose();
        cmd8.Dispose();
        cmd9.Dispose();
        cmd10.Dispose();
        mycon.Close();

        //Display data on the page
        canviews.Text = rows_count1.ToString();
        clsviews.Text = rows_count2.ToString();
        OrderViews.Text = rows_count3.ToString();
        RecReq.Text = rows_count4.ToString();
        RxReq.Text = rows_count5.ToString();
        RefReq.Text = rows_count6.ToString();
        PhoneBook.Text = rows_count7.ToString();
        canviews2.Text = rows_count8.ToString();
        MedRecords.Text = rows_count9.ToString();
        TrialsViews.Text = rows_count10.ToString();
    }

}