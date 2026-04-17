using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

public partial class studentlogin : System.Web.UI.Page
{
    // Connection string aapke web.config se
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void btnSendOTP_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string otp = new Random().Next(100000, 999999).ToString();
        DateTime expiry = DateTime.Now.AddMinutes(10);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            // MAGIC QUERY: Agar email nahi hai toh Insert karo, agar hai toh sirf OTP update karo
            string query = @"
            IF NOT EXISTS (SELECT 1 FROM Students WHERE Email = @email)
            BEGIN
                INSERT INTO Students (Email, FullName, RegDate) VALUES (@email, 'New Student', GETDATE());
            END
            UPDATE Students SET CurrentOTP = @otp, OTPExpiry = @expiry WHERE Email = @email";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@otp", otp);
            cmd.Parameters.AddWithValue("@expiry", expiry);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // OTP Email bhejne ka function (Aapka purana wala)
            SendOTPEmail(email, otp);

            Session["TempEmail"] = email;
            pnlEmail.Visible = false;
            pnlOTP.Visible = true;
        }
    }

    private void SendOTPEmail(string toEmail, string otp)
    {
        // Aapka email credentials
        string fromEmail = "siddhitailor91@gmail.com";
        string appPassword = "qdybqjokzkdjfnai";

        MailMessage mail = new MailMessage(fromEmail, toEmail);
        mail.Subject = "Login OTP - itduniya.in";
        mail.Body = string.Format("<h3>Hello Student,</h3><p>Aapka login OTP hai: <b>{0}</b></p><p>Ye 10 mins mein expire ho jayega।</p>", otp);
        mail.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
        smtp.Send(mail);
    }

    protected void btnVerifyOTP_Click(object sender, EventArgs e)
    {
        string email = Session["TempEmail"].ToString();
        string otp = txtOTP.Text.Trim();

        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT StudentID, FullName FROM Students WHERE Email=@email AND CurrentOTP=@otp AND OTPExpiry > GETDATE()", con);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@otp", otp);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["StudentID"] = dr["StudentID"].ToString();
                Session["StudentName"] = dr["FullName"].ToString();

                // यह लाइन जोड़ना ज़रूरी है!
                Session["StudentEmail"] = email;

                Response.Redirect("studentdashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid OTP ya time khatam ho gaya!');</script>");
            }
        }
    }    protected void btnBack_Click(object sender, EventArgs e) { pnlEmail.Visible = true; pnlOTP.Visible = false; }
}