using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class blogdetails : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            int blogID = Convert.ToInt32(Request.QueryString["id"]);
            LoadBlog(blogID);
        }
        else { Response.Redirect("blog.aspx"); }
      

    }

    private void LoadBlog(int id)
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Blogs WHERE BlogID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptBlogDetail.DataSource = dt;
                rptBlogDetail.DataBind();
                this.Title = dt.Rows[0]["Title"].ToString() + " - itduniya.in";
            }
        }
    }

    public string blogTitleFromDatabase { get; set; }
}