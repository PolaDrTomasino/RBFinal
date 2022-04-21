using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Configuration;

public partial class ReOrderContacts : System.Web.UI.Page
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
        string query = "INSERT INTO [dbo].[Reorder_Contacts] (Date, Patient_Name, Phone_Number, Email, SupAmt, OrderDescription, CCName, CCNumber, Expiration, CVC, HomeOffice, Status, Initials, IsOrdered , Charged, ChargeAmt, InsAmount, IsInsBilled, Rebate) Values (@Date, @Patient_Name, @Phone_Number, @Email, @SupAmt @OrderDescription, @CCName, @CCNumber, @Expiration, @CVC, @HomeOffice, @Status, @Initials, @IsOrdered , @Charged, @ChargeAmt, @InsAmount, @IsInsBilled, @Rebate) ";
        SqlCommand cmd = new SqlCommand(query, mycon);

        cmd.Parameters.AddWithValue("@Date",txtDate.Text );
        cmd.Parameters.AddWithValue("@Patient_Name", txtPatient_Name.Text);
        cmd.Parameters.AddWithValue("@Phone_Number",txtPhone_Number.Text);
        cmd.Parameters.AddWithValue("@Email",txtEmail.Text);
        cmd.Parameters.AddWithValue("@txtSupAmt", txtSupAmt.Text);
        cmd.Parameters.AddWithValue("@OrderDescription", txtOrderDescription.Text);
        cmd.Parameters.AddWithValue("@txtCCName", txtCCName.Text);
        cmd.Parameters.AddWithValue("@CCNumber", txt_CCNumber.Text);
        cmd.Parameters.AddWithValue("@Expiration", txt_Expiration.Text);
        cmd.Parameters.AddWithValue("@CVC",txtCVC.Text);
        cmd.Parameters.AddWithValue("@HomeOffice",txtHomeOffice.Text);
        cmd.Parameters.AddWithValue("@Charged", txtCharged.Text);
        cmd.Parameters.AddWithValue("@IsInsBilled", txtIsInsBil.Text);
        cmd.Parameters.AddWithValue("@InsAmount",txtAmount.Text);
        cmd.Parameters.AddWithValue("@ChargeAmt",txtChargeAmt.Text);
        cmd.Parameters.AddWithValue("@Rebate",txtRebate.Text);
        cmd.Parameters.AddWithValue("@Status",txtStatus.Text);
        cmd.Parameters.AddWithValue("@Initials",txtInitials.Text);
        cmd.Parameters.AddWithValue("@IsOrdered",txtIsOrdered.Text);
        
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
        connection();
        SendEmail();
        //This is to clean my form
        txtDate.Text = "";
        txtPatient_Name.Text = "";
        txtPhone_Number.Text = "";
        txtEmail.Text = "";
        txtOrderDescription.Text = "";
        txt_CCNumber.Text = "";
        txt_Expiration.Text = "";
        txtCCName.Text = "";
        txtCVC.Text = "";
        txtHomeOffice.Text = "";
        txtStatus.Text = "";
        txtCharged.Text = "";
        txtChargeAmt.Text = "";
        txtInitials.Text = "";
        txtRebate.SelectedValue = "No";
        txtRebate.SelectedValue = "No";
        txtSupAmt.SelectedValue = "";
        txtIsInsBil.SelectedValue = "No";
        txtAmount.Text = "";
    }
    private void SendEmail()
    {
        SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
        using (MailMessage mm = new MailMessage(smtpSection.From, "susan@drtomasino.com"))
        {
            mm.Subject = "New Contact Lenses Order for '" + txtPatient_Name.Text + "'";
            mm.Body = "<b>Dear Dr T, <br/> A new Contact Lenses order has been added for '" + txtPatient_Name.Text + "',<br/> <br/> Order Description is '" + txtOrderDescription.Text + "' <br/> <br/> Best Regards, <br/> Natick EyeCare<b>";
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = smtpSection.Network.Host;
            smtp.EnableSsl = smtpSection.Network.EnableSsl;
            NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            smtp.Credentials = networkCred;
            smtp.Port = smtpSection.Network.Port;
            smtp.Send(mm);
        }
    }
}