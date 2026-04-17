using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            // SQL Injection se bachne ke liye Parameters ka use karein
            string query = "SELECT COUNT(*) FROM Admins WHERE Username=@user AND Password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());
            cmd.Parameters.AddWithValue("@pass", txtPass.Text.Trim());

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();

            if (count > 0)
            {
                //[cite_start]// Session create karein 
                Session["AdminUser"] = txtUser.Text.Trim();
                Response.Redirect("admindashboard.aspx");
            }
            else
            {
                lblError.Text = "Username ya Password galat hai!";
            }
        }
    }
}