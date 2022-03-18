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
        string query = "select * from [NEC_MSG] where MSgFor like'%" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewPB.DataSource = ds;
        GridViewPB.DataBind();
    }
    protected void GridViewPB_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewPB.PageIndex + 1).ToString() + " of " + GridViewPB.PageCount.ToString();

    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID] ,[MSGFor], [Caller_Name], [DateTime], [Caller_Number], [Message], [Action], [Status], [Initials] FROM [NEC_MSG] Where [Status] != 'Done (Closed)'", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewPB.DataSource = Dt;
        GridViewPB.DataBind();
        return Dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewPB.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [NEC_MSG] where MSGFor like'%" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewPB.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewPB.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records";

        }
    }
    protected void AddRx_Click(object sender, EventArgs e)
    {
        Response.Redirect("PhoneBook.aspx");
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewPB.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewPB_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewPB.Visible = false;
        dvPB.Visible = true;
        int selectedRowIndex = GridViewPB.SelectedIndex;
        int ID = (int)GridViewPB.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[MSGFor], [Caller_Name], [DateTime], [Caller_Number], [Message], [Action], [Status], [Initials] FROM [NEC_MSG] Where ID=@ID"))
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
                        dvPB.DataSource = reader;
                        dvPB.DataKeyNames = new string[] { "ID" };
                        dvPB.DataBind();
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

    protected void dvPB_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvPB.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvPB_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvPB.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM NEC_MSG WHERE ID = @ID"))
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
        dvPB.Visible = false;
        GridViewPB.Visible = true;
    }

    protected void dvPB_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvPB.DataKey.Value;
        DropDownList newMSGForTextBox = (DropDownList)dvPB.FindControl("editMSGFor");
        TextBox newCaller_NameTextBox = (TextBox)dvPB.FindControl("editCaller_Name");
        TextBox newDateTimeTextBox = (TextBox)dvPB.FindControl("editDateTime");
        TextBox newCaller_NumberTextBox = (TextBox)dvPB.FindControl("editCaller_Number");
        TextBox newMessageTextBox = (TextBox)dvPB.FindControl("editMessage");
        DropDownList newActionTextBox = (DropDownList)dvPB.FindControl("editAction");
        DropDownList newStatusTextBox = (DropDownList)dvPB.FindControl("editStatus");
        TextBox newInitialsTextBox = (TextBox)dvPB.FindControl("editInitials");

        string newMSGFor = newMSGForTextBox.SelectedValue;
        string newCaller_Name = newCaller_NameTextBox.Text;
        string newDateTime = newDateTimeTextBox.Text;
        string newCaller_Number = newCaller_NumberTextBox.Text;
        string newMessage = newMessageTextBox.Text;
        string newAction = newActionTextBox.SelectedValue;
        string newStatus = newStatusTextBox.SelectedValue;
        string newInitials = newInitialsTextBox.Text;

        connection();
        string query = "UPDATE NEC_MSG SET MSGFor=@MSGFor, Caller_Name=@Caller_Name, DateTime=@DateTime, Caller_Number=@Caller_Number, Message=@Message, Action=@Action, Status=@Status, Initials=@Initials Where ID=@ID";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.Add("ID", SqlDbType.Int);
        cmd.Parameters["ID"].Value = ID;
        cmd.Parameters.Add("MSGFor", SqlDbType.VarChar, 255);
        cmd.Parameters["MSGFor"].Value = newMSGFor;
        cmd.Parameters.Add("Caller_Name", SqlDbType.VarChar, 255);
        cmd.Parameters["Caller_Name"].Value = newCaller_Name;
        cmd.Parameters.Add("DateTime", SqlDbType.VarChar, 255);
        cmd.Parameters["DateTime"].Value = newDateTime;
        cmd.Parameters.Add("Caller_Number", SqlDbType.VarChar, 255);
        cmd.Parameters["Caller_Number"].Value = newCaller_Number;
        cmd.Parameters.Add("Message", SqlDbType.VarChar, 1000);
        cmd.Parameters["Message"].Value = newMessage;
        cmd.Parameters.Add("Status", SqlDbType.VarChar, 1000);
        cmd.Parameters["Status"].Value = newStatus;
        cmd.Parameters.Add("Action", SqlDbType.VarChar, 255);
        cmd.Parameters["Action"].Value = newAction;
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
        dvPB.ChangeMode(DetailsViewMode.ReadOnly);
        DisplayRecord();
        dvPB.Visible = false;
        GridViewPB.Visible = true;
    }
    protected void Archive_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID] ,[MSGFor], [Caller_Name], [DateTime], [Caller_Number], [Message], [Action], [Status], [Initials] FROM [NEC_MSG] Where [Status] = 'Done (Closed)'"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewPB.DataSource = dt;
                        GridViewPB.DataKeyNames = new string[] { "ID" };
                        GridViewPB.DataBind();
                    }
                }
            }
        }
    }
}