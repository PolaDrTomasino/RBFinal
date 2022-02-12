using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewRx : System.Web.UI.Page
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
        string query = "select * from [Rx_Request] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewRx.DataSource = ds;
        GridViewRx.DataBind();
    }
    protected void GridViewRx_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewRx.PageIndex + 1).ToString() + " of " + GridViewRx.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [Rx], [Receiving_Via], [Date_Done], [Initials] FROM [Rx_Request]", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewRx.DataSource = Dt;
        GridViewRx.DataBind();
        return Dt;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [Rx_Request] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewRx.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewRx.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records";

        }
    }
    protected void AddRx_Click(object sender, EventArgs e)
    {
        Response.Redirect("RxRequest.aspx");
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewRx.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewRx.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void GridViewRx_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewRx.Visible = false;
        dvRX.Visible = true;
        int selectedRowIndex = GridViewRx.SelectedIndex;
        int ID = (int)GridViewRx.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [Rx], [Receiving_Via], [Date_Done], [Initials] FROM [Rx_Request] Where ID=@ID"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    SqlDataReader reader;
                    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                    cmd.Parameters.Add("ID", SqlDbType.Int);
                    cmd.Parameters["ID"].Value = ID;
                    try
                    {
                        con.Open();
                        reader = cmd.ExecuteReader();
                        dvRX.DataSource = reader;
                        dvRX.DataKeyNames = new string[] { "ID" };
                        dvRX.DataBind();
                        reader.Close();
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
    }

    protected void dvRX_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvRX.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvRX_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvRX.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Rx_Request WHERE ID = @ID"))
            {
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindDetails();
        DisplayRecord();
        dvRX.Visible = false;
        GridViewRx.Visible = true;
    }

    protected void dvRX_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvRX.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvRX.FindControl("editDate");
        TextBox newPatient_NameTextBox = (TextBox)dvRX.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)dvRX.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)dvRX.FindControl("editEmail");
        DropDownList newRxTextBox = (DropDownList)dvRX.FindControl("editRx");
        DropDownList newReceiving_ViaTextBox = (DropDownList)dvRX.FindControl("editReceiving_Via");
        TextBox newDate_DoneTextBox = (TextBox)dvRX.FindControl("editDate_Done");
        TextBox newInitialsTextBox = (TextBox)dvRX.FindControl("editInitials");

        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newRx = newRxTextBox.SelectedValue;
        string newReceiving_Via = newReceiving_ViaTextBox.SelectedValue;
        string newDate_Done = newDate_DoneTextBox.Text;
        string newInitials = newInitialsTextBox.Text;



        connection();
        string query = "UPDATE Rx_Request SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, Rx=@Rx, Receiving_Via=@Receiving_Via, Date_Done=@Date_Done, Initials=@Initials Where ID=@ID";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.Add("ID", SqlDbType.Int);
        cmd.Parameters["ID"].Value = ID;
        cmd.Parameters.Add("Date", SqlDbType.VarChar, 255);
        cmd.Parameters["Date"].Value = newDate;
        cmd.Parameters.Add("Patient_Name", SqlDbType.VarChar, 255);
        cmd.Parameters["Patient_Name"].Value = newPatient_Name;
        cmd.Parameters.Add("Phone_Number", SqlDbType.VarChar, 255);
        cmd.Parameters["Phone_Number"].Value = newPhone_Number;
        cmd.Parameters.Add("Email", SqlDbType.VarChar, 255);
        cmd.Parameters["Email"].Value = newEmail;
        cmd.Parameters.Add("Rx", SqlDbType.VarChar, 255);
        cmd.Parameters["Rx"].Value = newRx;
        cmd.Parameters.Add("Receiving_Via", SqlDbType.VarChar, 255);
        cmd.Parameters["Receiving_Via"].Value = newReceiving_Via;
        cmd.Parameters.Add("Date_Done", SqlDbType.VarChar, 255);
        cmd.Parameters["Date_Done"].Value = newDate_Done;
        cmd.Parameters.Add("Initials", SqlDbType.VarChar, 255);
        cmd.Parameters["Initials"].Value = newInitials;

        try
        {
            cmd.ExecuteNonQuery();
        }
        finally
        {
            mycon.Close();
        }
        dvRX.ChangeMode(DetailsViewMode.ReadOnly);
        DisplayRecord();
        BindDetails();
        dvRX.Visible = false;
        GridViewRx.Visible = true;
    }
}