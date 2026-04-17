using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class admin_viewmessages : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Admin security check
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            BindMessages();
        }
    }

    private void BindMessages()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            // Naye messages sabse upar dikhane ke liye ORDER BY DESC ka use kiya hai
            string query = "SELECT * FROM ContactMessages ORDER BY MsgID DESC";
            SqlDataAdapter adp = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            gvMessages.DataSource = dt;
            gvMessages.DataBind();
        }
    }

    protected void gvMessages_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Primary key (ID) nikalna
        int msgID = Convert.ToInt32(gvMessages.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM ContactMessages WHERE MsgID = @id", con);
            cmd.Parameters.AddWithValue("@id", msgID);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // List refresh karna
            BindMessages();

            // Success alert
            Response.Write("<script>alert('Message successfully delete ho gaya.');</script>");
        }
    }

    protected void btnSendReply_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string msgID = btn.CommandArgument;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        TextBox txtReply = (TextBox)row.FindControl("txtReply");

        if (!string.IsNullOrEmpty(txtReply.Text))
        {
            string studentEmail = "";
            string studentName = "";
            string originalSubject = "";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // 1. स्टूडेंट की डिटेल्स और ईमेल निकालना
                SqlCommand cmdGet = new SqlCommand("SELECT SenderName, SenderEmail, Subject FROM ContactMessages WHERE MsgID = @id", con);
                cmdGet.Parameters.AddWithValue("@id", msgID);
                con.Open();
                SqlDataReader dr = cmdGet.ExecuteReader();
                if (dr.Read())
                {
                    studentName = dr["SenderName"].ToString();
                    studentEmail = dr["SenderEmail"].ToString();
                    originalSubject = dr["Subject"].ToString();
                }
                con.Close();

                // 2. डेटाबेस में जवाब सेव करना
                string queryUpdate = "UPDATE ContactMessages SET AdminReply = @reply, IsReplied = 1 WHERE MsgID = @id";
                SqlCommand cmdUpd = new SqlCommand(queryUpdate, con);
                cmdUpd.Parameters.AddWithValue("@reply", txtReply.Text.Trim());
                cmdUpd.Parameters.AddWithValue("@id", msgID);
                con.Open();
                cmdUpd.ExecuteNonQuery();
                con.Close();

                // 3. स्टूडेंट को ईमेल भेजना
                SendEmailToStudent(studentEmail, studentName, originalSubject, txtReply.Text.Trim());

                Response.Write("<script>alert('Reply saved and Email sent to student!');</script>");
                BindMessages();
            }
        }
    }

   private void SendEmailToStudent(string toEmail, string name, string subject, string replyMessage)
{
    try
    {
        string fromEmail = "siddhitailor91@gmail.com"; // अपना ईमेल यहाँ लिखें
        string appPassword = "qdybqjokzkdjfnai"; // अपना 16-digit App Password यहाँ लिखें

        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(fromEmail, "itduniya.in Support");
        mail.To.Add(toEmail);
        mail.Subject = "Re: " + subject;
        
        // Email ka Body (string.Format ke saath)
        mail.Body = string.Format(
            "<h3>Hi {0},</h3>" +
            "<p>Aapne humein <b>{1}</b> ke baare mein message bheja tha.</p>" +
            "<p><b>Humara Jawab:</b><br/>{2}</p>" +
            "<br/><p>Dhanyawad,<br/> itduniya.in</p>",
            name, subject, replyMessage
        );

        mail.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential(fromEmail, appPassword);

        smtp.Send(mail);
    }
    catch (Exception ex)
    {
        // ईमेल न जाने पर एरर लॉग करें
        Response.Write("<script>alert('Database updated but Email error: " + ex.Message + "');</script>");
    }
}
}