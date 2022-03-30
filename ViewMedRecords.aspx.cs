using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewMedRecords : System.Web.UI.Page
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
        string query = "select * from [MedRecords] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewMedRecords.DataSource = ds;
        GridViewMedRecords.DataBind();
    }
    protected void GridViewMedRecords_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewMedRecords.PageIndex + 1).ToString() + " of " + GridViewMedRecords.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID], [Date], [PatientName], [PhoneNumber], [Email], [DrName], [DrPrName], [DrPhone], [DrFax], [DateDone], [Initials] FROM [MedRecords] Where [Status] != 'Done (Closed)'", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewMedRecords.DataSource = Dt;
        GridViewMedRecords.DataBind();
        return Dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewMedRecords.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [MedRecords] where PatientName like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewMedRecords.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewMedRecords.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records"; 

        }
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("MedRecords.aspx");
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewMedRecords.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewMedRecords_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewMedRecords.Visible = false;
        dvCan.Visible = true;
        int selectedRowIndex = GridViewMedRecords.SelectedIndex;
        int ID = (int)GridViewMedRecords.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID], [Date], [PatientName], [PhoneNumber], [Email], [DrName], [DrPrName], [DrPhone], [DrFax], [DateDone], [Initials], [Status] FROM [MedRecords] Where ID=@ID"))
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
            using (SqlCommand cmd = new SqlCommand("DELETE FROM MedRecords WHERE ID = @ID"))
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
        GridViewMedRecords.Visible = true;
    }

    protected void dvCan_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvCan.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvCan.FindControl("editDate");
        TextBox newPatientNameTextBox = (TextBox)dvCan.FindControl("editPatientName");
        TextBox newPhoneNumberTextBox = (TextBox)dvCan.FindControl("editPhoneNumber");
        TextBox newEmailTextBox = (TextBox)dvCan.FindControl("editEmail");
        TextBox newDrNameTextBox = (TextBox)dvCan.FindControl("editDrName");
        TextBox newDrPrNameTextBox = (TextBox)dvCan.FindControl("editDrPrName");
        TextBox newDrPhoneTextBox = (TextBox)dvCan.FindControl("editDrPhone");
        TextBox newDrFaxTextBox = (TextBox)dvCan.FindControl("editDrFax");
        TextBox newDateDoneTextBox = (TextBox)dvCan.FindControl("editDateDone");
        TextBox newInitialsTextBox = (TextBox)dvCan.FindControl("editInitials");
        DropDownList newStatusTextBox = (DropDownList)dvCan.FindControl("editStatus");


        string newDate = newDateTextBox.Text;
        string newPatientName = newPatientNameTextBox.Text;
        string newPhoneNumber = newPhoneNumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newDrName = newDrNameTextBox.Text;
        string newDrPrName = newDrPrNameTextBox.Text;
        string newDrPhone = newDrPhoneTextBox.Text;
        string newDrFax = newDrFaxTextBox.Text;
        string newDateDone = newDateDoneTextBox.Text;
        string newInitials = newInitialsTextBox.Text;
        string newStatus = newStatusTextBox.SelectedValue;

        connection();
        string query = "UPDATE MedRecords SET Date=@Date, PatientName=@PatientName, PhoneNumber=@PhoneNumber, Email=@Email, DrName=@DrName, DrPrName=@DrPrName, DrPhone=@DrPhone, DrFax=@DrFax, DateDone=@DateDone, Initials=@Initials, Status=@Status Where ID=@ID";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.Add("ID", SqlDbType.Int);
        cmd.Parameters["ID"].Value = ID;
        cmd.Parameters.Add("Date", SqlDbType.VarChar, 255);
        cmd.Parameters["Date"].Value = newDate;
        cmd.Parameters.Add("PatientName", SqlDbType.VarChar, 255);
        cmd.Parameters["PatientName"].Value = newPatientName;
        cmd.Parameters.Add("PhoneNumber", SqlDbType.VarChar, 255);
        cmd.Parameters["PhoneNumber"].Value = newPhoneNumber;
        cmd.Parameters.Add("Email", SqlDbType.VarChar, 255);
        cmd.Parameters["Email"].Value = newEmail;
        cmd.Parameters.Add("DrName", SqlDbType.VarChar, 255);
        cmd.Parameters["DrName"].Value = newDrName;
        cmd.Parameters.Add("DrPrName", SqlDbType.VarChar, 255);
        cmd.Parameters["DrPrName"].Value = newDrPrName;
        cmd.Parameters.Add("DrPhone", SqlDbType.VarChar, 255);
        cmd.Parameters["DrPhone"].Value = newDrPhone;
        cmd.Parameters.Add("DrFax", SqlDbType.VarChar, 255);
        cmd.Parameters["DrFax"].Value = newDrFax;
        cmd.Parameters.Add("DateDone", SqlDbType.VarChar, 255);
        cmd.Parameters["DateDone"].Value = newDateDone;
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
        dvCan.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetails();
        DisplayRecord();
        dvCan.Visible = false;
        GridViewMedRecords.Visible = true;
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID], [Date], [PatientName], [PhoneNumber], [Email], [DrName], [DrPrName], [DrPhone], [DrFax], [DateDone], [Initials] FROM [MedRecords] Where [Status] = 'Done (Closed)'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewMedRecords.DataSource = dt;
                        GridViewMedRecords.DataKeyNames = new string[] { "ID" };
                        GridViewMedRecords.DataBind();
                    }
                }
            }
        }
    }
}