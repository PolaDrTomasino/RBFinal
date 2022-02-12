using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;


public partial class ViewOrders : System.Web.UI.Page
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

        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
    }
    // Search Query
    private void rep_bind()
    {
        connection();
        string query = "select * from [Reorder_Contacts] where Patient_Name like'%" + TextBox1.Text + "%' OR Phone_Number like'%" + TextBox1.Text + "%' OR [Email] like'%" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewOrders.DataSource = ds;
        GridViewOrders.DataBind();
    }
    protected void GridViewOrders_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewOrders.PageIndex + 1).ToString() + " of " + GridViewOrders.PageCount.ToString();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [Reorder_Contacts] where [Patient_Name] like'%" + TextBox1.Text + "%' OR [Phone_Number] like'%" + TextBox1.Text + "%' OR [Email] like'%" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewOrders.Visible = true;
            DetailsView1.Visible = false;
            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewOrders.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records";
        }
    }
    protected void AddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReOrderContacts.aspx");
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [OrderID],[Date], [Patient_Name], [Phone_Number], [Email], [Initials] FROM [Reorder_Contacts]"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewOrders.DataSource = dt;
                        GridViewOrders.DataKeyNames = new string[] { "OrderID" };
                        GridViewOrders.DataBind();
                    }
                }
            }
        }
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewOrders.EditIndex = -1;
        this.BindGrid();
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewOrders.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }
    protected void GridViewOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewOrders.Visible = false;
        DetailsView1.Visible = true;
        int selectedRowIndex = GridViewOrders.SelectedIndex;
        int OrderID = (int)GridViewOrders.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [OrderID],[Date], [Patient_Name], [Phone_Number], [Email], [OrderDescription], [OD], [OS], [CCNumber], [Expiration], [CVC], [HomeOffice], [Status], [OrderFrom], [Initials] FROM [Reorder_Contacts] Where OrderID=@OrderID"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    SqlDataReader reader;
                    string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                    cmd.Parameters.Add("OrderID", SqlDbType.Int);
                    cmd.Parameters["OrderID"].Value = OrderID;
                    try
                    {
                        con.Open();
                        reader = cmd.ExecuteReader();
                        DetailsView1.DataSource = reader;
                        DetailsView1.DataKeyNames = new string[] { "OrderID" };
                        DetailsView1.DataBind();
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

    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        DetailsView1.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int OrderID = (int)DetailsView1.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM ReOrder_Contacts WHERE OrderID = @OrderID"))
            {
                cmd.Parameters.AddWithValue("@OrderID", OrderID);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindDetails();
        BindGrid();
        DetailsView1.Visible = false;
        GridViewOrders.Visible = true;
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int OrderID = (int)DetailsView1.DataKey.Value;
        TextBox newDateTextBox = (TextBox)DetailsView1.FindControl("editDate");
        TextBox newPatient_NameTextBox = (TextBox)DetailsView1.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)DetailsView1.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)DetailsView1.FindControl("editEmail");
        TextBox newOrderDescriptionTextBox = (TextBox)DetailsView1.FindControl("editOrderDescription");
        TextBox newODTextBox = (TextBox)DetailsView1.FindControl("editOD");
        TextBox newOSTextBox = (TextBox)DetailsView1.FindControl("editOS");
        TextBox newCCNumberTextBox = (TextBox)DetailsView1.FindControl("editCCNumber");
        TextBox newExpirationTextBox = (TextBox)DetailsView1.FindControl("editExpiration");
        TextBox newCVCTextBox = (TextBox)DetailsView1.FindControl("editCVC");
        DropDownList newHomeOfficeTextBox = (DropDownList)DetailsView1.FindControl("editHomeOffice");
        DropDownList newStatusTextBox = (DropDownList)DetailsView1.FindControl("editStatus");
        TextBox newInitialsTextBox = (TextBox)DetailsView1.FindControl("editInitials");
        DropDownList newOrderFromTextBox = (DropDownList)DetailsView1.FindControl("editOrderFrom");

        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newOrderDescription = newOrderDescriptionTextBox.Text;
        string newOD = newODTextBox.Text;
        string newOS = newOSTextBox.Text;
        string newCCNumber = newCCNumberTextBox.Text;
        string newExpiration = newExpirationTextBox.Text;
        string newCVC = newCVCTextBox.Text;
        string newHomeOffice = newHomeOfficeTextBox.SelectedValue;
        string newStatus = newStatusTextBox.SelectedValue;
        string newInitials = newInitialsTextBox.Text;
        string newOrderFrom = newOrderFromTextBox.SelectedValue;


        connection();
        string query = "UPDATE ReOrder_Contacts SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, OrderDescription=@OrderDescription, OD=@OD, OS=@OS, CCNumber=@CCNumber, Expiration=@Expiration, CVC=@CVC, HomeOffice=@HomeOffice, Status=@Status, Initials=@Initials, OrderFrom=@OrderFrom Where OrderID=@OrderID";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.Add("OrderID", SqlDbType.Int);
        cmd.Parameters["OrderID"].Value = OrderID;
        cmd.Parameters.Add("Date", SqlDbType.VarChar, 255);
        cmd.Parameters["Date"].Value = newDate;
        cmd.Parameters.Add("Patient_Name", SqlDbType.VarChar, 255);
        cmd.Parameters["Patient_Name"].Value = newPatient_Name;
        cmd.Parameters.Add("Phone_Number", SqlDbType.VarChar, 255);
        cmd.Parameters["Phone_Number"].Value = newPhone_Number;
        cmd.Parameters.Add("Email", SqlDbType.VarChar, 255);
        cmd.Parameters["Email"].Value = newEmail;
        cmd.Parameters.Add("OrderDescription", SqlDbType.VarChar, 255);
        cmd.Parameters["OrderDescription"].Value = newOrderDescription;
        cmd.Parameters.Add("OD", SqlDbType.VarChar, 255);
        cmd.Parameters["OD"].Value = newOD;
        cmd.Parameters.Add("OS", SqlDbType.VarChar, 255);
        cmd.Parameters["OS"].Value = newOS;
        cmd.Parameters.Add("CCNumber", SqlDbType.VarChar, 255);
        cmd.Parameters["CCNumber"].Value = newCCNumber;
        cmd.Parameters.Add("Expiration", SqlDbType.VarChar, 255);
        cmd.Parameters["Expiration"].Value = newExpiration;
        cmd.Parameters.Add("CVC", SqlDbType.VarChar, 255);
        cmd.Parameters["CVC"].Value = newCVC;
        cmd.Parameters.Add("HomeOffice", SqlDbType.VarChar, 255);
        cmd.Parameters["HomeOffice"].Value = newHomeOffice;
        cmd.Parameters.Add("Status", SqlDbType.VarChar, 255);
        cmd.Parameters["Status"].Value = newStatus;
        cmd.Parameters.Add("Initials", SqlDbType.VarChar, 255);
        cmd.Parameters["Initials"].Value = newInitials;
        cmd.Parameters.Add("OrderFrom", SqlDbType.VarChar, 255);
        cmd.Parameters["OrderFrom"].Value = newOrderFrom;
        try
        {
            cmd.ExecuteNonQuery();
        }
        finally
        {
            mycon.Close();
        }
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        BindGrid();
        BindDetails();
        DetailsView1.Visible = false;
        GridViewOrders.Visible = true;
    }
   
}