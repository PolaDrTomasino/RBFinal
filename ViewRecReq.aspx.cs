﻿using System;
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
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID], [Date], [Patient_Name], [Phone_Number], [Email], [Notes], [Receiving_Via], [Date_Done], [Initials] FROM [Receipt_Request] Where [Status] != 'Done (Closed)'", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewRecReq.DataSource = Dt;
        ViewState["dirState"] = Dt;
        ViewState["sortdr"] = "Asc";
        GridViewRecReq.DataBind();
        return Dt;
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
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewRecReq.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewRecReq_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewRecReq.Visible = false;
        dvRecReQ.Visible = true;
        int selectedRowIndex = GridViewRecReq.SelectedIndex;
        int ID = (int)GridViewRecReq.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Date], [Patient_Name], [Phone_Number], [Email], [Notes], [Receiving_Via], [Date_Done], [Initials], [Status] FROM [Receipt_Request] Where ID=@ID"))
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
                        dvRecReQ.DataSource = reader;
                        dvRecReQ.DataKeyNames = new string[] { "ID" };
                        dvRecReQ.DataBind();
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

    protected void dvRecReQ_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvRecReQ.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvRecReQ_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvRecReQ.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Receipt_Request WHERE ID = @ID"))
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
        dvRecReQ.Visible = false;
        GridViewRecReq.Visible = true;
    }

    protected void dvRecReQ_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvRecReQ.DataKey.Value;
        TextBox newDateTextBox = (TextBox)dvRecReQ.FindControl("editDate");
        TextBox newPatient_NameTextBox = (TextBox)dvRecReQ.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)dvRecReQ.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)dvRecReQ.FindControl("editEmail");
        TextBox newNotesTextBox = (TextBox)dvRecReQ.FindControl("editNotes");
        DropDownList newReceiving_ViaTextBox = (DropDownList)dvRecReQ.FindControl("editReceiving_Via");
        TextBox newDate_DoneTextBox = (TextBox)dvRecReQ.FindControl("editDate_Done");
        TextBox newInitialsTextBox = (TextBox)dvRecReQ.FindControl("editInitials");
        DropDownList newStatusTextBox = (DropDownList)dvRecReQ.FindControl("editStatus");

        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newNotes = newNotesTextBox.Text;
        string newReceiving_Via = newReceiving_ViaTextBox.SelectedValue;
        string newDate_Done = newDate_DoneTextBox.Text;
        string newInitials = newInitialsTextBox.Text;
        string newStatus = newStatusTextBox.SelectedValue;

        connection();
        string query = "UPDATE Receipt_Request SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, Notes=@Notes, Receiving_Via=@Receiving_Via, Date_Done=@Date_Done, Initials=@Initials, Status=@Status Where ID=@ID";
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
        cmd.Parameters.Add("Notes", SqlDbType.VarChar, 255);
        cmd.Parameters["Notes"].Value = newNotes;
        cmd.Parameters.Add("Receiving_Via", SqlDbType.VarChar, 255);
        cmd.Parameters["Receiving_Via"].Value = newReceiving_Via;
        cmd.Parameters.Add("Date_Done", SqlDbType.VarChar, 255);
        cmd.Parameters["Date_Done"].Value = newDate_Done;
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
        dvRecReQ.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetails();
        DisplayRecord();
        dvRecReQ.Visible = false;
        GridViewRecReq.Visible = true;
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID], [Date], [Patient_Name], [Phone_Number], [Email], [Notes], [Receiving_Via], [Date_Done], [Initials] FROM [Receipt_Request] Where [Status] = 'Done (Closed)'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewRecReq.DataSource = dt;
                        GridViewRecReq.DataKeyNames = new string[] { "ID" };
                        ViewState["dirState"] = dt;
                        ViewState["sortdr"] = "Asc";
                        GridViewRecReq.DataBind();
                    }
                }
            }
        }
    }

    protected void GridViewRecReq_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = Convert.ToDateTime(e.Row.Cells[0].Text.Replace("T", " ")).ToString("MM/dd/yyyy");

            if (e.Row.Cells[6].Text != "&nbsp;")
            {
                e.Row.Cells[6].Text = Convert.ToDateTime(e.Row.Cells[6].Text.Replace("T", " ")).ToString("MM/dd/yyyy");
            }
        }
    }

    protected void GridViewRecReq_Sorting(object sender, GridViewSortEventArgs e)
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
            GridViewRecReq.DataSource = dtrslt;
            GridViewRecReq.DataBind();
        }
    }
}
