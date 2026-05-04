using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class notes : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindNotes(); 
        }
    }

    private void BindNotes(string searchTerm = "")
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Notes";

            if (!string.IsNullOrEmpty(searchTerm))
            {
                query += " WHERE Title LIKE @search OR Category LIKE @search";
            }

            query += " ORDER BY NoteID DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            if (!string.IsNullOrEmpty(searchTerm))
            {
                cmd.Parameters.AddWithValue("@search", "%" + searchTerm + "%");
            }

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptNotesList.Visible = true;
                lblNoResult.Visible = false;
                rptNotesList.DataSource = dt;
                rptNotesList.DataBind();
            }
            else
            {
                rptNotesList.Visible = false;
                lblNoResult.Visible = true; 
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string search = txtSearch.Text.Trim();
        BindNotes(search);
    }
}