using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_admindashboard : System.Web.UI.Page
{
    // Ensure "MyDbConn" matches exactly with your web.config name
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            FetchDashboardStats();
        }
    }

    private void FetchDashboardStats()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            // Sabhi tables se count lene ki optimized query
            string query = @"
            SELECT 
                (SELECT COUNT(*) FROM Tutorials) as TutCount,
                (SELECT COUNT(*) FROM Projects) as ProjCount,
                (SELECT COUNT(*) FROM ErrorSolutions) as ErrCount,
                (SELECT COUNT(*) FROM Blogs) as BlogCount,
                (SELECT COUNT(*) FROM Notes) as NoteCount,
                (SELECT COUNT(*) FROM Categories) as CatCount,
                (SELECT COUNT(*) FROM ContactMessages) as MsgCount";

            SqlCommand cmd = new SqlCommand(query, con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    litTotalTutorials.Text = dr["TutCount"].ToString();
                    litTotalProjects.Text = dr["ProjCount"].ToString();
                    litTotalErrors.Text = dr["ErrCount"].ToString();
                    litTotalBlogs.Text = dr["BlogCount"].ToString();
                    litTotalNotes.Text = dr["NoteCount"].ToString();
                    litTotalCategories.Text = dr["CatCount"].ToString();
                    litTotalUserMessages.Text = dr["MsgCount"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                // Debugging ke liye alert ya label update
                litTotalTutorials.Text = "!";
            }
        }
    }
}
