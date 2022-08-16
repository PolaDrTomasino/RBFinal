using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewTrials : System.Web.UI.Page
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
        string query = "select * from [TrialsReq] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewTrials.DataSource = ds;
        GridViewTrials.DataBind();
    }
    protected void GridViewTrials_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewTrials.PageIndex + 1).ToString() + " of " + GridViewTrials.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID], [Date], [Patient_Name], [Phone_Number], [Email], [TrialDescription], [Initials] FROM [TrialsReq] Where [Status] != 'Done (Closed)'", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewTrials.DataSource = Dt;
        ViewState["dirState"] = Dt;
        ViewState["sortdr"] = "Asc";
        GridViewTrials.DataBind();
        return Dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewTrials.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [TrialsReq] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewTrials.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewTrials.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records"; 

        }
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("trials.aspx");
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewTrials.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewTrials_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewTrials.Visible = false;
        dvTrials.Visible = true;
        int selectedRowIndex = GridViewTrials.SelectedIndex;
        int ID = (int)GridViewTrials.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [TrialDescription], [Initials], [Status] FROM [TrialsReq] Where ID=@ID"))
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
                        dvTrials.DataSource = reader;
                        dvTrials.DataKeyNames = new string[] { "ID" };
                        dvTrials.DataBind();
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

    protected void dvTrials_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvTrials.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvTrials_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvTrials.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM TrialsReq WHERE ID = @ID"))
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
        dvTrials.Visible = false;
        GridViewTrials.Visible = true;
    }

    protected void dvTrials_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvTrials.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvTrials.FindControl("editDate");
        TextBox newPatient_NameTextBox = (TextBox)dvTrials.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)dvTrials.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)dvTrials.FindControl("editEmail");
        TextBox newTrialDescriptionTextBox = (TextBox)dvTrials.FindControl("editTrialDescription");
        TextBox newInitialsTextBox = (TextBox)dvTrials.FindControl("editInitials");
        DropDownList newStatusTextBox = (DropDownList)dvTrials.FindControl("editStatus");


        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newTrialDescription = newTrialDescriptionTextBox.Text;
        string newInitials = newInitialsTextBox.Text;
        string newStatus = newStatusTextBox.SelectedValue;

        connection();
        string query = "UPDATE TrialsReq SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, TrialDescription=@TrialDescription, Initials=@Initials, Status=@Status Where ID=@ID";
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
        cmd.Parameters.Add("TrialDescription", SqlDbType.VarChar, 255);
        cmd.Parameters["TrialDescription"].Value = newTrialDescription;
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
        dvTrials.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetails();
        DisplayRecord();
        dvTrials.Visible = false;
        GridViewTrials.Visible = true;
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID], [Date], [Patient_Name], [Phone_Number], [Email], [TrialDescription], [Initials] FROM [TrialsReq] Where [Status] = 'Done (Closed)'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewTrials.DataSource = dt;
                        GridViewTrials.DataKeyNames = new string[] { "ID" };
                        ViewState["dirState"] = dt;
                        ViewState["sortdr"] = "Asc";
                        GridViewTrials.DataBind();
                    }
                }
            }
        }
    }

    protected void GridViewTrials_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = Convert.ToDateTime(e.Row.Cells[0].Text.Replace("T", " ")).ToString("MM/dd/yyyy");
        }
    }

    protected void GridViewTrials_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dtrslt = (DataTable)ViewState["dirState"];
        if (dtrslt.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            GridViewTrials.DataSource = dtrslt;
            GridViewTrials.DataBind();
        }
    }
}
