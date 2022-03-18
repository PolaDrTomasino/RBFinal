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

public partial class PhoneBook : System.Web.UI.Page
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
        //opening conncetion and insert then close DB
        connection();
        SqlCommand cmd2 = new SqlCommand("INSERT INTO [dbo].[NEC_MSG] values('" + txtMSGFor.SelectedItem.Text + "', '" + txtCaller_Name.Text + "', '" + txtDateTime.Text + "','" + txtCaller_Number.Text + "','" + txtMessage.Text + "', '" + txtAction.Text + "' , '" + txtInitials.Text + "' , '" + txtStatus.Text + "')", mycon);
        cmd2.ExecuteNonQuery();
        connection();
        SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
        var emailAddress = this.txtMSGFor.SelectedValue;
        using (MailMessage mm = new MailMessage(smtpSection.From, emailAddress))
        {
            mm.Subject = "Call/Message Received!";
            mm.Body = "Dear '" + txtMSGFor.SelectedItem.Text + "', <br><br> You have a new call/message received from <b>'" + txtCaller_Name.Text + "'<b>, <br><br> Best Regards,<br> Natick Eye Care ";
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = smtpSection.Network.Host;
            smtp.EnableSsl = smtpSection.Network.EnableSsl;
            NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            smtp.Credentials = networkCred;
            smtp.Port = smtpSection.Network.Port;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(this.GetType(), "", "alert()", true);
            //Clearing form after submit
            txtMSGFor.Text = "";
            txtDateTime.Text = "";
            txtCaller_Number.Text = "";
            txtMessage.Text = "";
            txtAction.Text = "";
            txtInitials.Text = "";
        }
    }
    }