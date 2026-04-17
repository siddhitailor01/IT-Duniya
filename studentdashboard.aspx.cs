using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class studentdashboard : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    public class StudentProfile
    {
        public string Name { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if student is logged in
        if (Session["StudentID"] == null)
        {
            Response.Redirect("studentlogin.aspx");
        }

        if (!IsPostBack)
        {
            LoadStudentData();
            LoadMyMessages();
        }
    }


    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        // 1. Pack data into Model
        StudentProfile data = new StudentProfile
        {
            Name = txtName.Text.Trim(),
            Mobile = txtMobile.Text.Trim()
        };

        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("UPDATE Students SET FullName=@name, Mobile=@mob WHERE StudentID=@id", con);
            cmd.Parameters.AddWithValue("@name", data.Name);
            cmd.Parameters.AddWithValue("@mob", data.Mobile);
            cmd.Parameters.AddWithValue("@id", Session["StudentID"]);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        LoadStudentData(); // Refresh UI

        // Modal ko band karne aur alert dikhane ke liye script
        string script = "alert('Profile updated!'); var myModal = bootstrap.Modal.getInstance(document.getElementById('editProfileModal')); myModal.hide();";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
    }

    private void LoadStudentData()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT FullName, Email, Mobile FROM Students WHERE StudentID=@id", con);
            cmd.Parameters.AddWithValue("@id", Session["StudentID"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string fullName = dr["FullName"].ToString();
                lblHeaderName.Text = string.IsNullOrEmpty(fullName) || fullName == "New Student" ? "Student" : fullName;
                litFirstName.Text = lblHeaderName.Text;
                lblHeaderEmail.Text = dr["Email"].ToString();

                // Form fields populate karna
                if (fullName != "New Student") txtName.Text = fullName;
                txtMobile.Text = dr["Mobile"].ToString();
            }
        }
    }

  

    private void LoadMyMessages()
    {
        // सेफ्टी चेक: अगर ईमेल सेशन में नहीं है, तो क्वेरी न चलायें
        if (Session["StudentEmail"] == null)
        {
            Response.Redirect("studentlogin.aspx");
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT Subject, SentDate, IsReplied, AdminReply FROM ContactMessages WHERE SenderEmail=@email ORDER BY SentDate DESC";
            SqlCommand cmd = new SqlCommand(query, con);

            // .ToString() का इस्तेमाल करें और पक्का करें कि वैल्यू null नहीं है
            cmd.Parameters.AddWithValue("@email", Session["StudentEmail"].ToString());

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                gvMyMessages.DataSource = dt;
                gvMyMessages.DataBind();
            }
            else { pnlNoMessages.Visible = true; }
        }
    }
    
protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("index.aspx");
    }
}