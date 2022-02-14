using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewCLS : System.Web.UI.Page
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
        string query = "select * from [CLSFU] where Patient_Name like'" + TextBox1.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, mycon);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridViewCLS.DataSource = ds;
        GridViewCLS.DataBind();
    }
    protected void GridViewCLS_PreRender(object sender, EventArgs e)
    {
        Label2.Text = "Displaying Page" + (GridViewCLS.PageIndex + 1).ToString() + " of " + GridViewCLS.PageCount.ToString();
    }
    public DataTable DisplayRecord()
    {
        connection();
        SqlDataAdapter Adp = new SqlDataAdapter("select [ID], [Appt_Date], [Patient_Name], [Phone_Number], [Email], [CLS_Try], [FU_Date], [Initials] FROM [CLSFU]", mycon);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewCLS.DataSource = Dt;
        GridViewCLS.DataBind();
        return Dt;
    }
    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewCLS.PageIndex = e.NewPageIndex;
        this.DisplayRecord();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        connection();
        string query = "select *  from [CLSFU] where Patient_Name like'" + TextBox1.Text + "%'";
        SqlCommand com = new SqlCommand(query, mycon);

        SqlDataReader dr;
        dr = com.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();

            rep_bind();
            GridViewCLS.Visible = true;

            TextBox1.Text = "";
            Label2.Text = "";
        }
        else
        {
            GridViewCLS.Visible = false;
            Label2.Visible = true;
            Label2.Text = "The search Term " + TextBox1.Text + " &nbsp;Is Not Available in the Records";

        }
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {
        Response.Redirect("CLStryFU.aspx");
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridViewCLS.EditIndex = -1;
        this.DisplayRecord();
    }
    protected void GridViewCLS_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        GridViewCLS.Visible = false;
        dvCLS.Visible = true;
        int selectedRowIndex = GridViewCLS.SelectedIndex;
        int ID = (int)GridViewCLS.DataKeys[selectedRowIndex].Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select [ID],[Appt_Date], [Patient_Name], [Phone_Number], [Email], [CLS_Try], [FU_Date], [Initials] FROM [CLSFU] Where ID=@ID"))
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
                        dvCLS.DataSource = reader;
                        dvCLS.DataKeyNames = new string[] { "ID" };
                        dvCLS.DataBind();
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

    protected void dvCLS_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dvCLS.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void dvCLS_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int ID = (int)dvCLS.DataKey.Value;
        string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM CLSFU WHERE ID = @ID"))
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
        dvCLS.Visible = false;
        GridViewCLS.Visible = true;
    }

    protected void dvCLS_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int ID = (int)dvCLS.DataKey.Value;
        TextBox newAppt_DateTextBox = (TextBox)dvCLS.FindControl("editAppt_Date");
        TextBox newPatient_NameTextBox = (TextBox)dvCLS.FindControl("editPatient_Name");
        TextBox newPhone_NumberTextBox = (TextBox)dvCLS.FindControl("editPhone_Number");
        TextBox newEmailTextBox = (TextBox)dvCLS.FindControl("editEmail");
        TextBox newCLS_TryTextBox = (TextBox)dvCLS.FindControl("editCLS_Try");
        TextBox newFU_DateTextBox = (TextBox)dvCLS.FindControl("editFU_Date");
        TextBox newInitialsTextBox = (TextBox)dvCLS.FindControl("editInitials");

        string newAppt_Date = newAppt_DateTextBox.Text;
        string newPatient_Name = newPatient_NameTextBox.Text;
        string newPhone_Number = newPhone_NumberTextBox.Text;
        string newEmail = newEmailTextBox.Text;
        string newCLS_Try = newCLS_TryTextBox.Text;
        string newFU_Date = newFU_DateTextBox.Text;
        string newInitials = newInitialsTextBox.Text;

        connection();
        string query = "UPDATE CLSFU SET Appt_Date=@Appt_Date, Patient_Name=@Patient_Name, Phone_Number=@Phone_Number, Email=@Email, CLS_Try=@CLS_Try, FU_Date=@FU_Date, Initials=@Initials Where ID=@ID";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.Add("ID", SqlDbType.Int);
        cmd.Parameters["ID"].Value = ID;
        cmd.Parameters.Add("Appt_Date", SqlDbType.VarChar, 255);
        cmd.Parameters["Appt_Date"].Value = newAppt_Date;
        cmd.Parameters.Add("Patient_Name", SqlDbType.VarChar, 255);
        cmd.Parameters["Patient_Name"].Value = newPatient_Name;
        cmd.Parameters.Add("Phone_Number", SqlDbType.VarChar, 255);
        cmd.Parameters["Phone_Number"].Value = newPhone_Number;
        cmd.Parameters.Add("Email", SqlDbType.VarChar, 255);
        cmd.Parameters["Email"].Value = newEmail;
        cmd.Parameters.Add("CLS_Try", SqlDbType.VarChar, 255);
        cmd.Parameters["CLS_Try"].Value = newCLS_Try;
        cmd.Parameters.Add("FU_Date", SqlDbType.VarChar, 255);
        cmd.Parameters["FU_Date"].Value = newFU_Date;
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
        dvCLS.ChangeMode(DetailsViewMode.ReadOnly);
        DisplayRecord();
        BindDetails();
        dvCLS.Visible = false;
        GridViewCLS.Visible = true;
    }
}