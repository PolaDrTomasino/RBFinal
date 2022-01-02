﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class ViewCancellation : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection("Data Source=DESKTOP-R3NJ0J9; Initial catalog=TestDB1; User ID=pola; Password=pola");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayRecord();
        }  
    }
    public DataTable DisplayRecord()
    {
        SqlDataAdapter Adp = new SqlDataAdapter("select [Date], [Patient_Name], [Phone_Number], [Email], [Appt_Date], [New_Date], [Initials] FROM [Cancellation_List]", connection);
        DataTable Dt = new DataTable();
        Adp.Fill(Dt);
        GridViewCancellation.DataSource = Dt;
        GridViewCancellation.DataBind();
        return Dt;
    }  
    protected void Button1_Click2(object sender, EventArgs e)
        {
            }
    }

