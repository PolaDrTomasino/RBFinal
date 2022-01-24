using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewRef : System.Web.UI.Page
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
        string query = "select * from [Referral] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewRef.DataSource = ds;
        GridViewRef.DataBind();
    }
    protected void GridViewRef_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewRef.PageIndex + 1).ToString() + " of " + GridViewRef.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [Date], [Patient_Name], [Phone_Number], [Email], [RFR], [RefDate], [Initials] FROM [Referral]", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewRef.DataSource = Dt;
        GridViewRef.DataBind();
        return Dt;
    }
    protected void GridViewRef_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewRef.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [Referral] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewRef.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewRef.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records";

        }
    }
    protected void AddRef_Click(object sender, EventArgs e)
    {
        Response.Redirect("Referral.aspx");
    }
}