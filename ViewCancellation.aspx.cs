using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewCancellation : System.Web.UI.Page
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
        string query = "select * from [Cancellation_List] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewCancellation.DataSource = ds;
        GridViewCancellation.DataBind();
    }
    protected void GridViewCancellation_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewCancellation.PageIndex + 1).ToString() + " of " + GridViewCancellation.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID], [Date], [Patient_Name], [Phone_Number], [Email], [Appt_Date], [New_Date], [Initials] FROM [Cancellation_List]", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewCancellation.DataSource = Dt;
        GridViewCancellation.DataBind();
        return Dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewCancellation.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [Cancellation_List] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewCancellation.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewCancellation.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records"; 

        }
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("ptCancelled.aspx");
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewCancellation.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewCancellation_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewCancellation.Visible = false;
        dvCan.Visible = true;
        int selectedRowIndex = GridViewCancellation.SelectedIndex;
        int ID = (int)GridViewCancellation.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [Appt_Date], [New_Date], [Initials] FROM [Cancellation_List] Where ID=@ID"))
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
                        dvCan.DataSource = reader;
                        dvCan.DataKeyNames = new string[] { "ID" };
                        dvCan.DataBind();
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

    protected void dvCan_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvCan.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvCan_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvCan.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Cancellation_List WHERE ID = @ID"))
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
        dvCan.Visible = false;
        GridViewCancellation.Visible = true;
    }

    protected void dvCan_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvCan.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvCan.FindControl("editDate");
        TextBox newPatient_NameTextBox = (TextBox)dvCan.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)dvCan.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)dvCan.FindControl("editEmail");
        TextBox newAppt_DateTextBox = (TextBox)dvCan.FindControl("editAppt_Date");
        TextBox newNew_DateTextBox = (TextBox)dvCan.FindControl("editNew_Date");
        TextBox newInitialsTextBox = (TextBox)dvCan.FindControl("editInitials");

        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newAppt_Date = newAppt_DateTextBox.Text;
        string newNew_Date = newNew_DateTextBox.Text;
        string newInitials = newInitialsTextBox.Text;

        connection();
        string query = "UPDATE Cancellation_List SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, Appt_Date=@Appt_Date, New_Date=@New_Date, Initials=@Initials Where ID=@ID";
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
        cmd.Parameters.Add("Appt_Date", SqlDbType.VarChar, 255);
        cmd.Parameters["Appt_Date"].Value = newAppt_Date;
        cmd.Parameters.Add("New_Date", SqlDbType.VarChar, 255);
        cmd.Parameters["New_Date"].Value = newNew_Date;
        cmd.Parameters.Add("Initials", SqlDbType.VarChar, 255);
        cmd.Parameters["Initials"].Value = newInitials;

        try
        {
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "", "update()", true);
        }
        finally
        {
            mycon.Close();
        }
        dvCan.ChangeMode(DetailsViewMode.ReadOnly);
        DisplayRecord();
        BindDetails();
        dvCan.Visible = false;
        GridViewCancellation.Visible = true;
    }
}
