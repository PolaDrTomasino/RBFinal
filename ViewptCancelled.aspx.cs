using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;

public partial class ViewptCancelled : System.Web.UI.Page
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
        string query = "select * from [ptCancelled] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewptCancelled.DataSource = ds;
        GridViewptCancelled.DataBind();
    }
    protected void GridViewptCancelled_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewptCancelled.PageIndex + 1).ToString() + " of " + GridViewptCancelled.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID], [Date], [PatientName], [PhoneNumber], [Email], [ReasonForCancel], [NewDate], [Initials] FROM [ptCancelled] Where [Status] != 'Done (Closed)'", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewptCancelled.DataSource = Dt;
        ViewState["dirState"] = Dt;
        ViewState["sortdr"] = "Asc";
        GridViewptCancelled.DataBind();
        return Dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewptCancelled.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [ptCancelled] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewptCancelled.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewptCancelled.Visible = false;
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
        GridViewptCancelled.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewptCancelled_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewptCancelled.Visible = false;
        dvCan.Visible = true;
        int selectedRowIndex = GridViewptCancelled.SelectedIndex;
        int ID = (int)GridViewptCancelled.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Date], [PatientName], [PhoneNumber], [Email], [ReasonForCancel], [NewDate], [Initials], [Status] FROM [ptCancelled] Where ID=@ID"))
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
            using (SqlCommand cmd = new SqlCommand("DELETE FROM ptCancelled WHERE ID = @ID"))
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
        GridViewptCancelled.Visible = true;
    }

    protected void dvCan_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvCan.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvCan.FindControl("editDate");
        TextBox newPatientNameTextBox = (TextBox)dvCan.FindControl("editPatientName");
        TextBox newPhoneNumberTextBox = (TextBox)dvCan.FindControl("editPhoneNumber");
        TextBox newEmailTextBox = (TextBox)dvCan.FindControl("editEmail");
        TextBox newReasonForCancelTextBox = (TextBox)dvCan.FindControl("editReasonForCancel");
        TextBox newNewDateTextBox = (TextBox)dvCan.FindControl("editNewDate");
        TextBox newInitialsTextBox = (TextBox)dvCan.FindControl("editInitials");
        DropDownList newStatusTextBox = (DropDownList)dvCan.FindControl("editStatus");


        string newDate = newDateTextBox.Text;
        string newPatientName = newPatientNameTextBox.Text;
        string newPhoneNumber = newPhoneNumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newReasonForCancel = newReasonForCancelTextBox.Text;
        string newNewDate = newNewDateTextBox.Text;
        string newInitials = newInitialsTextBox.Text;
        string newStatus = newStatusTextBox.SelectedValue;

        connection();
        string query = "UPDATE ptCancelled SET Date=@Date, PatientName=@PatientName, PhoneNumber=@PhoneNumber, Email=@Email, ReasonForCancel=@ReasonForCancel, NewDate=@NewDate, Initials=@Initials, Status=@Status Where ID=@ID";
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
        cmd.Parameters.Add("ReasonForCancel", SqlDbType.VarChar, 255);
        cmd.Parameters["ReasonForCancel"].Value = newReasonForCancel;
        cmd.Parameters.Add("NewDate", SqlDbType.VarChar, 255);
        cmd.Parameters["NewDate"].Value = newNewDate;
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
        DisplayRecord();
        BindDetails();
        dvCan.Visible = false;
        GridViewptCancelled.Visible = true;
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID], [Date], [PatientName], [PhoneNumber], [Email], [ReasonForCancel], [NewDate], [Initials] FROM [ptCancelled] Where [Status] = 'Done (Closed)'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewptCancelled.DataSource = dt;
                        GridViewptCancelled.DataKeyNames = new string[] { "ID" };
                        GridViewptCancelled.DataBind();
                    }
                }
            }
        }
    }

    protected void GridViewptCancelled_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = Convert.ToDateTime(e.Row.Cells[0].Text.Replace("T", " ")).ToString("MM/dd/yyyy");
            
            if (e.Row.Cells[5].Text != "&nbsp;")
            {
                e.Row.Cells[5].Text = Convert.ToDateTime(e.Row.Cells[5].Text.Replace("T", " ")).ToString("MM/dd/yyyy");
            }
        }
    }

    protected void GridViewptCancelled_Sorting(object sender, GridViewSortEventArgs e)
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
            GridViewptCancelled.DataSource = dtrslt;
            GridViewptCancelled.DataBind();
        }
    }
}
