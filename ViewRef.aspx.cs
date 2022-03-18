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
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [RFR], [RefDate], [Initials], [Status] FROM[Referral] Where [Status] != 'Done (Closed)'", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewRef.DataSource = Dt;
        GridViewRef.DataBind();
        return Dt;
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
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewRef.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewRef.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void GridViewRef_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewRef.Visible = false;
        dvRef.Visible = true;
        int selectedRowIndex = GridViewRef.SelectedIndex;
        int ID = (int)GridViewRef.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [RFR], [RefDate], [Initials], [Status] FROM [Referral] Where ID=@ID"))
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
                        dvRef.DataSource = reader;
                        dvRef.DataKeyNames = new string[] { "ID" };
                        dvRef.DataBind();
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

    protected void dvRef_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvRef.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvRef_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvRef.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Referral WHERE ID = @ID"))
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
        dvRef.Visible = false;
        GridViewRef.Visible = true;
    }

    protected void dvRef_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvRef.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvRef.FindControl("editDate");
        TextBox newPatient_NameTextBox = (TextBox)dvRef.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)dvRef.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)dvRef.FindControl("editEmail");
        TextBox newRFRTextBox = (TextBox)dvRef.FindControl("editRFR");
        TextBox newRefDateTextBox = (TextBox)dvRef.FindControl("editRefDate");
        TextBox newInitialsTextBox = (TextBox)dvRef.FindControl("editInitials");
        DropDownList newStatusTextBox = (DropDownList)dvRef.FindControl("editStatus");

        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newRFR = newRFRTextBox.Text;
        string newRefDate = newRefDateTextBox.Text;
        string newInitials = newInitialsTextBox.Text;
        string newStatus = newStatusTextBox.SelectedValue;


        connection();
        string query = "UPDATE Referral SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, RFR=@RFR, RefDate=@RefDate, Initials=@Initials, Status=@Status Where ID=@ID";
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
        cmd.Parameters.Add("RFR", SqlDbType.VarChar, 255);
        cmd.Parameters["RFR"].Value = newRFR;
        cmd.Parameters.Add("RefDate", SqlDbType.VarChar, 255);
        cmd.Parameters["RefDate"].Value = newRefDate;
        cmd.Parameters.Add("Initials", SqlDbType.VarChar, 255);
        cmd.Parameters["Initials"].Value = newInitials;
        cmd.Parameters.Add("Status", SqlDbType.VarChar, 255);
        cmd.Parameters["Status"].Value = newStatus;

        try
        {
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "", "update()", true);
        }
        finally
        {
            mycon.Close();
        }
        dvRef.ChangeMode(DetailsViewMode.ReadOnly);
        DisplayRecord();
        BindDetails();
        dvRef.Visible = false;
        GridViewRef.Visible = true;
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select[ID],[Date], [Patient_Name], [Phone_Number], [Email], [RFR], [RefDate], [Initials], [Status] FROM[Referral] Where [Status] = 'Done (Closed)'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewRef.DataSource = dt;
                        GridViewRef.DataKeyNames = new string[] { "ID" };
                        GridViewRef.DataBind();
                    }
                }
            }
        }
    }
}