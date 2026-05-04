using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class projects : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string levelFilter = Request.QueryString["lvl"];
            BindProjects(levelFilter);
        }
    }

    private void BindProjects(string level)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Projects";

            if (!string.IsNullOrEmpty(level))
            {
                query += " WHERE Level = @lvl";
            }
            query += " ORDER BY ProjectID DESC";

            SqlCommand cmd = new SqlCommand(query, con);

            if (!string.IsNullOrEmpty(level))
            {
                cmd.Parameters.AddWithValue("@lvl", level);
            }

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            rptAllProjects.DataSource = dt;
            rptAllProjects.DataBind();
        }
    }
}