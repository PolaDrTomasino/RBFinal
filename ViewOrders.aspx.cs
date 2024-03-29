﻿using System;
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
            using (SqlCommand cmd = new SqlCommand("select [OrderID],[Date], [Patient_Name], [Phone_Number], [Email],[OrderDescription] ,[SupAmt], [IsOrdered], [Charged], [Invoiced], [IsInsBilled], [Rebate], [Initials] FROM [Reorder_Contacts] Where [Status] != 'Done (Closed)'"))
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
                        ViewState["dirState"] = dt;
                        ViewState["sortdr"] = "Asc";
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
            using (SqlCommand cmd = new SqlCommand("select [OrderID], [Date], [Patient_Name], [Phone_Number], [Email], [OrderDescription], [SupAmt], [CCName], [CCNumber], [Expiration], [CVC], [HomeOffice], [Status], [IsOrdered], [Charged], [Invoiced], [ChargeAmt], [IsInsBilled], [InsAmount], [Rebate], [Initials] FROM [Reorder_Contacts] Where OrderID=@OrderID"))
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "Delete()", true);
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
        DropDownList newSupAmtTextBox = (DropDownList)DetailsView1.FindControl("editSupAmt");
        TextBox newOrderDescriptionTextBox = (TextBox)DetailsView1.FindControl("editOrderDescription");
        TextBox newCCNameTextBox = (TextBox)DetailsView1.FindControl("editCCName");
        TextBox newCCNumberTextBox = (TextBox)DetailsView1.FindControl("editCCNumber");
        TextBox newExpirationTextBox = (TextBox)DetailsView1.FindControl("editExpiration");
        TextBox newCVCTextBox = (TextBox)DetailsView1.FindControl("editCVC");
        DropDownList newHomeOfficeTextBox = (DropDownList)DetailsView1.FindControl("editHomeOffice");
        DropDownList newStatusTextBox = (DropDownList)DetailsView1.FindControl("editStatus");
        DropDownList newChargedTextBox = (DropDownList)DetailsView1.FindControl("editCharged");
        DropDownList newInvoicedTextBox = (DropDownList)DetailsView1.FindControl("editInvoiced");
        TextBox newChargeAmtTextBox = (TextBox)DetailsView1.FindControl("editChargeAmt");
        DropDownList newIsInsBilledTextBox = (DropDownList)DetailsView1.FindControl("editIsInsBilled");
        TextBox newInsAmountTextBox = (TextBox)DetailsView1.FindControl("editInsAmount");
        DropDownList newRebateTextBox = (DropDownList)DetailsView1.FindControl("editRebate");
        TextBox newInitialsTextBox = (TextBox)DetailsView1.FindControl("editInitials");
        DropDownList newIsOrderedTextBox = (DropDownList)DetailsView1.FindControl("editIsOrdered");

        string newDate = newDateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newOrderDescription = newOrderDescriptionTextBox.Text;
        string newSupAmt = newSupAmtTextBox.SelectedValue;
        string newCCName = newCCNameTextBox.Text;
        string newCCNumber = newCCNumberTextBox.Text;
        string newExpiration = newExpirationTextBox.Text;
        string newCVC = newCVCTextBox.Text;
        string newHomeOffice = newHomeOfficeTextBox.SelectedValue;
        string newStatus = newStatusTextBox.SelectedValue;
        string newCharged = newChargedTextBox.SelectedValue;
        string newInvoiced = newInvoicedTextBox.SelectedValue;
        string newChargeAmt = newChargeAmtTextBox.Text;
        string newIsInsBilled = newIsInsBilledTextBox.SelectedValue;
        string newInsAmount = newInsAmountTextBox.Text;
        string newRebate = newRebateTextBox.SelectedValue;
        string newInitials = newInitialsTextBox.Text;
        string newIsOrdered = newIsOrderedTextBox.SelectedValue;


        connection();
        string query = "UPDATE ReOrder_Contacts SET Date=@Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, OrderDescription=@OrderDescription, SupAmt=@SupAmt, CCName=@CCName, CCNumber=@CCNumber, Expiration=@Expiration, CVC=@CVC, HomeOffice=@HomeOffice, Status=@Status, Initials=@Initials, IsOrdered=@IsOrdered, Invoiced=@Invoiced , Charged=@Charged, ChargeAmt=@ChargeAmt, InsAmount=@InsAmount, IsInsBilled=@IsInsBilled, Rebate=@Rebate Where OrderID=@OrderID";
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
        cmd.Parameters.Add("SupAmt", SqlDbType.VarChar, 255);
        cmd.Parameters["SupAmt"].Value = newSupAmt;
        cmd.Parameters.Add("CCName", SqlDbType.VarChar, 255);
        cmd.Parameters["CCName"].Value = newCCName;
        cmd.Parameters.Add("CCNumber", SqlDbType.VarChar, 255);
        cmd.Parameters["CCNumber"].Value = newCCNumber;
        cmd.Parameters.Add("Expiration", SqlDbType.VarChar, 255);
        cmd.Parameters["Expiration"].Value = newExpiration;
        cmd.Parameters.Add("CVC", SqlDbType.VarChar, 255);
        cmd.Parameters["CVC"].Value = newCVC;
        cmd.Parameters.Add("HomeOffice", SqlDbType.VarChar, 255);
        cmd.Parameters["HomeOffice"].Value = newHomeOffice;
        cmd.Parameters.Add("Charged", SqlDbType.VarChar, 255);
        cmd.Parameters["Charged"].Value = newCharged;
        cmd.Parameters.Add("Invoiced", SqlDbType.VarChar, 255);
        cmd.Parameters["Invoiced"].Value = newInvoiced;
        cmd.Parameters.Add("IsInsBilled", SqlDbType.VarChar, 255);
        cmd.Parameters["IsInsBilled"].Value = newIsInsBilled;
        cmd.Parameters.Add("InsAmount", SqlDbType.VarChar, 255);
        cmd.Parameters["InsAmount"].Value = newInsAmount;
        cmd.Parameters.Add("ChargeAmt", SqlDbType.VarChar, 255);
        cmd.Parameters["ChargeAmt"].Value = newChargeAmt;
        cmd.Parameters.Add("Rebate", SqlDbType.VarChar, 255);
        cmd.Parameters["Rebate"].Value = newRebate;
        cmd.Parameters.Add("Status", SqlDbType.VarChar, 255);
        cmd.Parameters["Status"].Value = newStatus;
        cmd.Parameters.Add("Initials", SqlDbType.VarChar, 255);
        cmd.Parameters["Initials"].Value = newInitials;
        cmd.Parameters.Add("IsOrdered", SqlDbType.VarChar, 255);
        cmd.Parameters["IsOrdered"].Value = newIsOrdered;
        try
        {
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "", "update()", true);
        }
        finally
        {
            mycon.Close();
        }
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetails();
        BindGrid();
        DetailsView1.Visible = false;
        GridViewOrders.Visible = true;
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        int noRow = DetailsView1.Rows.Count - 1;//get the no of record

        if (noRow > 0)
        {
            LinkButton button = (LinkButton)(DetailsView1.Rows[noRow].Cells[0].Controls[2]);

            // Add delete confirmation
            ((System.Web.UI.WebControls.LinkButton)(button)).OnClientClick = "if(!confirm('Are you sure?')){ return false; };";

        }
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [OrderID],[Date], [Patient_Name], [Phone_Number], [Email], [IsOrdered], [Invoiced], [Charged], [OrderDescription], [IsInsBilled], [Rebate], [SupAmt], [Initials] FROM [Reorder_Contacts] Where [Status] = 'Done (Closed)'"))
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
                        ViewState["dirState"] = dt;
                        ViewState["sortdr"] = "Asc";
                        GridViewOrders.DataBind();
                    }
                }
            }
        }
    }
    protected void GridViewOrders_Sorting(object sender, GridViewSortEventArgs e)
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
            GridViewOrders.DataSource = dtrslt;
            GridViewOrders.DataBind();
        }
    }

    protected void GridViewOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = Convert.ToDateTime(e.Row.Cells[0].Text.Replace("T", " ")).ToString("MM/dd/yyyy");
        }
    }
}