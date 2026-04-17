using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        // Validation check
        if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtMessage.Text))
        {
            Response.Write("<script>alert('Kripya sabhi fields bharein!');</script>");
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            try
            {
                // Aapke naye column names: SentDate ka use kiya gaya hai
                string query = "INSERT INTO ContactMessages (SenderName, SenderEmail, Subject, Message, SentDate) VALUES (@name, @email, @sub, @msg, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@sub", txtSubject.Text.Trim());
                cmd.Parameters.AddWithValue("@msg", txtMessage.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Message sent! Check your dashboard for replies.');</script>");
                txtSubject.Text = txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}