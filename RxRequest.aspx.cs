using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class RxRequest : System.Web.UI.Page
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

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        connection();
        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[Rx_Request] values('" + txtDate.Text + "','" + txtPatient_Name.Text + "','" + txtPhone_Number.Text + "','" + txtEmail.Text + "','" + txtRx.Text + "','" + txtReceiving_Via.Text + "','" + txtDate_Done.Text + "','" + txtInitials.Text + "')", mycon);
        cmd2.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        connection();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtPatient_Name_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtPatient_Name_TextChanged1(object sender, EventArgs e)
    {

    }

}