using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewRecReq : System.Web.UI.Page
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
        Label2.Visible = false;
        if (!IsPostBack)
        {
            DisplayRecord();
        }
    }
    private void rep_bind()
    {
        connection();
        string query = "select * from [Receipt_Request] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewRecReq.DataSource = ds;
        GridViewRecReq.DataBind();
    }
    protected void GridViewRecReq_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewRecReq.PageIndex + 1).ToString() + " of " + GridViewRecReq.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [Date], [Patient_Name], [Phone_Number], [Email], [Service_Provider], [Receiving_Via], [Date_Done], [Initials] FROM [Receipt_Request]", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewRecReq.DataSource = Dt;
        GridViewRecReq.DataBind();
        return Dt;
    }
    protected void GridViewRecReq_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewRecReq.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [Receipt_Request] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewRecReq.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewRecReq.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records";

        }
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("ReceiptRequest.aspx");
    }
}